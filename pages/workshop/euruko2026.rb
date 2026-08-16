# BLE Theremin browser sound source
# PicoRuby Workshop "Low Energy Edition" - Euruko 2026
#
# Receives control data from a Raspberry Pi Pico 2 W running the
# theremin script (BLE::UART peripheral) and synthesizes sound with
# the Web Audio API.
#
# Line protocol (device -> browser):
#   F:<hz>   pitch in Hz, sent every 200 ms while a hand is in range
#            (the device decides the pitch; this page is the speaker)
#   B:1|B:0  tact switch pressed / released (gates the sound)
#
# By default incoming pitches are snapped to the C major scale so that
# melodies come out in tune; the Scale selector switches to "free"
# (continuous) mode for the authentic theremin experience.

class ThereminApp < Funicular::Component
  NOTE_NAMES = %w[C C# D D# E F F# G G# A A# B]

  # The device chooser only lists devices whose BLE name starts with this.
  # Keep the prefix when you personalize BLE_NAME on your Pico!
  DEVICE_NAME_PREFIX = "Theremin"

  # Only used to scale the pitch meter display; the actual pitch range
  # is decided by the device.
  METER_MIN_FREQ = 523.0  # C5
  METER_MAX_FREQ = 1047.0 # C6

  MAX_GAIN = 0.4

  # Pitch classes of the C major scale (white keys)
  C_MAJOR = [0, 2, 4, 5, 7, 9, 11]

  def initialize_state
    {
      audio_state: "off",
      ble_state: "disconnected",
      device_name: nil,
      freq: 0,
      gate: false,
      waveform: "sine",
      scale: "cmajor",
      volume: 60,
      reconnectable: false,
      error: nil,
      log: []
    }
  end

  def component_mounted
    @rx_buffer = ""
    build_scale_table
    check_web_bluetooth
    component = self
    @poll_task = Task.new(name: "BLE theremin poll") do
      while component.mounted
        component.poll_uart
        sleep_ms 30
      end
    end
  end

  def component_will_unmount
    close_uart
    @osc.stop(0) if @osc
    @ctx.close if @ctx
  end

  # --- Audio -----------------------------------------------------------

  def enable_audio(_event = nil)
    unless @ctx
      @ctx = JS::WebAudio.create_context
      @osc = @ctx.createOscillator
      @gain = @ctx.createGain
      @osc[:type] = state[:waveform]
      @osc[:frequency][:value] = 440.0
      @gain[:gain][:value] = 0.0
      @osc.connect(@gain)
      @gain.connect(@ctx[:destination])
      @osc.start(0)
    end
    @ctx.resume
    patch(audio_state: "ready", error: nil)
  rescue => e
    patch(audio_state: "error", error: "Audio: #{e.message}")
  end

  def waveform_changed(event)
    waveform = event.target[:value].to_s
    @osc[:type] = waveform if @osc
    patch(waveform: waveform)
  end

  def scale_changed(event)
    patch(scale: event.target[:value].to_s)
  end

  def volume_changed(event)
    volume = event.target[:value].to_s.to_i
    apply_gate(state[:gate], volume) if @ctx
    patch(volume: volume)
  end

  def sound_check_on(_event = nil)
    enable_audio unless @ctx
    apply_gate(true, state[:volume])
    patch(gate: true)
  end

  def sound_check_off(_event = nil)
    apply_gate(false, state[:volume])
    patch(gate: false)
  end

  # --- BLE -------------------------------------------------------------

  def check_web_bluetooth
    navigator = JS.global[:navigator]
    if navigator.is_a?(JS::Object) && navigator[:bluetooth].is_a?(JS::Object)
      return
    end
    hint = if JS.global[:isSecureContext].to_s == "true"
      "This browser does not expose Web Bluetooth. Use Google Chrome. " \
      "On desktop Linux, enable " \
      "chrome://flags/#enable-experimental-web-platform-features " \
      "and restart the browser."
    else
      "Web Bluetooth needs a secure context. Open this page via https:// " \
      "or http://localhost (file:// and plain http:// on a LAN IP " \
      "will not work)."
    end
    patch(ble_state: "unsupported", error: hint)
  end

  def connect_ble(_event = nil)
    enable_audio unless @ctx
    push_log("[*] Opening BLE device chooser...")
    begin
      # With a recent PicoRuby.wasm the chooser is also filtered by the
      # NUS service UUID, so only BLE-UART devices show up at all.
      @uart = JS::BLE::UART.new(name_prefix: DEVICE_NAME_PREFIX)
      name = @uart.device.name.to_s
      name = "(unnamed)" if name.empty?
      if @uart.respond_to?(:on_disconnect)
        component = self
        @uart.on_disconnect { component.handle_ble_lost }
      end
      push_log("[+] Connected to #{name}")
      patch(ble_state: "connected", device_name: name, error: nil,
            reconnectable: @uart.respond_to?(:reconnect))
    rescue => e
      @uart = nil
      push_log("[-] #{e.message}")
      patch(ble_state: "disconnected", error: "BLE: #{e.message}")
    end
  end

  # Re-establish the link to the already-chosen device without showing
  # the browser chooser again (needs a PicoRuby.wasm with
  # JS::BLE::UART#reconnect; falls back to the chooser otherwise).
  def reconnect_ble(_event = nil)
    uart = @uart
    unless uart && uart.respond_to?(:reconnect)
      connect_ble
      return
    end
    push_log("[*] Reconnecting...")
    begin
      uart.reconnect
      push_log("[+] Reconnected")
      patch(ble_state: "connected", gate: false, error: nil)
    rescue => e
      push_log("[-] Reconnect failed: #{e.message}")
      patch(error: "BLE: #{e.message}")
    end
  end

  def disconnect_ble(_event = nil)
    close_uart
    apply_gate(false, state[:volume])
    push_log("[*] Disconnected")
    patch(ble_state: "disconnected", device_name: nil, gate: false)
  end

  def close_uart
    @uart.close if @uart
    @uart = nil
  end

  # Called on link loss, either from the on_disconnect hook (instant)
  # or from the poll loop (fallback for older runtimes). Keeps @uart
  # so that reconnect_ble can revive the link without a chooser.
  def handle_ble_lost
    return unless state[:ble_state] == "connected"
    apply_gate(false, state[:volume])
    push_log("[-] Connection lost")
    patch(ble_state: "lost", gate: false)
  end

  def poll_uart
    uart = @uart
    return unless uart
    unless uart.connected?
      handle_ble_lost
      return
    end
    data = uart.read_nonblock(256)
    return unless data
    @rx_buffer << data
    while (idx = @rx_buffer.index("\n"))
      line = @rx_buffer.byteslice(0, idx).to_s.strip
      @rx_buffer = @rx_buffer.byteslice(idx + 1, @rx_buffer.bytesize) || ""
      handle_line(line) unless line.empty?
    end
  end

  def handle_line(line)
    push_log("[RX] #{line}")
    case line.byteslice(0, 2)
    when "F:"
      update_pitch(line.byteslice(2, 8).to_i)
    when "B:"
      gate = line.byteslice(2, 1) == "1"
      apply_gate(gate, state[:volume])
      patch(gate: gate)
    end
  end

  # --- Synthesis -------------------------------------------------------

  # C major scale frequencies (C1-B6) and the snapping band boundaries,
  # precomputed once.
  #
  # The boundaries sit at equal 1/7-octave steps rather than halfway
  # between neighboring notes. The device maps hand distance uniformly
  # in log frequency, so equal log-width bands give every scale degree
  # the same amount of hand travel. With nearest-note snapping, the
  # semitone pairs (E-F and B-C) would get only half the air of the
  # whole-tone steps and become fiddly to play.
  def build_scale_table
    @scale_freqs = []
    @scale_boundaries = []
    octave = 24 # C1
    while octave <= 84
      degree = 0
      while degree < 7
        note = octave + C_MAJOR[degree]
        @scale_freqs << 440.0 * (2.0 ** ((note - 69) / 12.0))
        boundary = octave + 12.0 * (degree + 0.5) / 7
        @scale_boundaries << 440.0 * (2.0 ** ((boundary - 69) / 12.0))
        degree += 1
      end
      octave += 12
    end
  end

  # Returns the scale note whose band contains freq.
  # @scale_boundaries[i] is the upper bound of @scale_freqs[i]'s band.
  def snap_to_scale(freq)
    index = 0
    size = @scale_boundaries.size
    while index < size && @scale_boundaries[index] <= freq
      index += 1
    end
    index = @scale_freqs.size - 1 if @scale_freqs.size <= index
    @scale_freqs[index]
  end

  def update_pitch(freq)
    return if freq <= 0
    freq = freq.to_f
    freq = snap_to_scale(freq) if state[:scale] == "cmajor"
    if @osc
      @osc[:frequency].setTargetAtTime(freq, @ctx[:currentTime], 0.08)
    end
    patch(freq: freq)
  end

  def apply_gate(on, volume)
    return unless @gain
    target = on ? MAX_GAIN * volume / 100.0 : 0.0
    @gain[:gain].setTargetAtTime(target, @ctx[:currentTime], 0.03)
  end

  def note_label(freq)
    return "--" if freq <= 0
    best_name = "--"
    best_diff = 999999.0
    note = 36
    while note <= 96
      note_freq = 440.0 * (2.0 ** ((note - 69) / 12.0))
      diff = (note_freq - freq).abs
      if diff < best_diff
        best_diff = diff
        best_name = "#{NOTE_NAMES[note % 12]}#{note / 12 - 1}"
      end
      note += 1
    end
    best_name
  end

  def push_log(message)
    log = state[:log] + [message]
    log.shift while 12 < log.size
    patch(log: log)
  end

  # --- View ------------------------------------------------------------

  def render
    connected = state[:ble_state] == "connected"
    div(class: "shell") do
      p(class: "eyebrow") { "PICORUBY WORKSHOP · LOW ENERGY EDITION" }
      h1 { "BLE Theremin" }
      p(class: "lede") { "Wave your hand over the HC-SR04, hold the button, make music." }

      div(class: "status-row") do
        span(class: state[:audio_state] == "ready" ? "status on" : "status") do
          "Audio: #{state[:audio_state]}"
        end
        span(class: connected ? "status on" : "status") do
          case state[:ble_state]
          when "connected" then "BLE: #{state[:device_name]}"
          when "lost" then "BLE: link lost"
          else "BLE: disconnected"
          end
        end
        span(class: state[:gate] ? "status on" : "status") do
          state[:gate] ? "GATE OPEN" : "gate closed"
        end
        span(class: "error") { state[:error].to_s }
      end

      div(class: "actions") do
        button(onclick: :enable_audio, class: "primary") { "1. Enable audio" }
        if connected
          button(onclick: :disconnect_ble) { "Disconnect" }
        elsif state[:ble_state] == "lost" && state[:reconnectable]
          button(onclick: :reconnect_ble, class: "primary") { "Reconnect" }
          button(onclick: :connect_ble) { "Choose another device" }
        elsif state[:ble_state] == "unsupported"
          button(disabled: true) { "2. Connect your Pico" }
        else
          button(onclick: :connect_ble, class: "primary") { "2. Connect your Pico" }
        end
        button(
          onpointerdown: :sound_check_on,
          onpointerup: :sound_check_off,
          onpointercancel: :sound_check_off
        ) { "Sound check (hold)" }
      end

      div(class: "panel") do
        div(class: "readout") do
          span(class: "freq") { state[:freq].to_i.to_s }
          span(class: "freq-unit") { "Hz" }
          span(class: "note-label") { note_label(state[:freq]) }
          span(class: "distance") do
            0 < state[:freq] ? "" : "waiting for pitch data..."
          end
        end
        div(class: "meter") do
          div(class: "meter-fill", style: "width: #{meter_percent}%")
        end
      end

      div(class: "panel controls") do
        label do
          span { "Scale" }
          select(onchange: :scale_changed, value: state[:scale]) do
            option(value: "cmajor") { "C major" }
            option(value: "free") { "free (continuous)" }
          end
        end
        label do
          span { "Waveform" }
          select(onchange: :waveform_changed, value: state[:waveform]) do
            JS::WebAudio::WAVEFORMS.each do |waveform|
              option(value: waveform) { waveform }
            end
          end
        end
        label do
          span { "Volume: #{state[:volume]}" }
          input(type: "range", min: 0, max: 100, step: 1,
                value: state[:volume], oninput: :volume_changed)
        end
      end

      div(class: "panel") do
        div(class: "log") { state[:log].join("\n") }
        p(class: "hint") do
          "Protocol: the device sends F:<hz> every 200 ms and B:1 / B:0 " \
          "when the tact switch changes. Your Pico decides the pitch; " \
          "this page is just the speaker. Use Google Chrome (Web Bluetooth)."
        end
      end
    end
  end

  def meter_percent
    freq = state[:freq]
    return 0 if freq <= 0
    percent = ((freq - METER_MIN_FREQ) * 100 / (METER_MAX_FREQ - METER_MIN_FREQ)).to_i
    percent = 0 if percent < 0
    percent = 100 if 100 < percent
    percent
  end
end

GC.scheduler_driven = true
GC.step_limit = 128

Funicular.start(ThereminApp, container: "app")
