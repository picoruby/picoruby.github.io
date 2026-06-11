---
keywords: documentation
layout: page
tags: [wasm, webassembly, serial]
title: PicoRuby.wasm Web Serial
sidebar: picoruby_sidebar
permalink: wasm-webserial
folder: wasm
---

PicoRuby.wasm can talk to USB serial devices through the browser's Web Serial API via `JS::WebSerial`.

This is useful for browser-based tools that communicate with microcontrollers, bootloaders, REPLs, or simple line-oriented firmware protocols.

Web Serial is a browser API, so the usual browser restrictions apply:

- It works only in browsers that support Web Serial, such as Chromium-based browsers.
- The page must be served from a secure context such as HTTPS or `localhost`.
- Port selection must start from a user gesture such as a button click.
- The browser shows its own serial port picker. Ruby code cannot silently open a port.

## Connect

Check support first, then call `JS::WebSerial.connect` from a click handler. `connect` asks the browser for a port, opens it, and yields a `JS::WebSerial` instance.

```ruby
require 'js'

button = JS.document.getElementById('connect')
log = JS.document.getElementById('log')

unless JS::WebSerial.supported?
  log[:textContent] = "Web Serial is not available in this browser"
end

button.addEventListener('click') do |_event|
  begin
    $serial = JS::WebSerial.connect(baud_rate: 115200) do |port|
      log[:textContent] = "connected\n"

      port.on_receive do |data|
        log[:textContent] = log[:textContent].to_s + data
      end

      port.on_disconnect do
        log[:textContent] = log[:textContent].to_s + "\ndisconnected\n"
      end
    end
  rescue => e
    log[:textContent] = "connect error: #{e.message}"
  end
end
```

Received data is delivered as a Ruby `String` chunk. It may contain arbitrary bytes. Append it directly for a terminal-like UI, or parse it with `bytes`, `bytesize`, and `byteslice` for binary protocols.

## Write

Use `write` for a single string. Use `write_bytes` when you want chunked writes and a promise that resolves when the queued writes are flushed.

```ruby
send_button = JS.document.getElementById('send')

send_button.addEventListener('click') do |_event|
  if $serial && $serial.opened?
    $serial.write("help\r\n")
  end
end
```

For larger binary payloads:

```ruby
bytes = "\x01\x02\x03" * 100
promise = $serial.write_bytes(bytes, chunk_size: 64)
promise.await
```

`drain` returns a JavaScript promise that resolves after the pending write queue for that port has flushed.

```ruby
$serial.write("reboot\r\n")
$serial.drain.await
```

## Close

`close` stops the read loop and waits for `port.close()` internally, avoiding locked-stream errors during reconnect.

```ruby
if $serial && $serial.opened?
  $serial.close
  $serial = nil
end
```

## Lower-Level Port Flow

If you need to separate port selection from opening, use `request_port` and then call `open`.

```ruby
JS::WebSerial.request_port do |port|
  next unless port

  port.open(baud_rate: 9600, parity: 'none')
  port.on_receive do |data|
    puts data.inspect
  end
end
```

## Useful Methods

- `JS::WebSerial.supported?`
- `JS::WebSerial.connect(baud_rate:, data_bits:, stop_bits:, parity:)`
- `JS::WebSerial.request_port`
- `port.open`, `port.opened?`, `port.close`
- `port.on_receive`, `port.on_disconnect`
- `port.write(data)`, `port.write_bytes(data, chunk_size:)`, `port.drain`
- `port.start_terminal_read(terminal)` for xterm.js-style terminal objects

`JS::WebSerial.capture_start`, `capture_peek`, `capture_stop`, `binary_capture_start`, `binary_capture_read`, and `binary_capture_stop` exist for specialized tooling such as firmware transfer or test helpers. Most applications should start with `on_receive`.

## Examples

The PicoRuby.wasm demo directory has a larger terminal-style example:

- [`terminal.html`](https://github.com/picoruby/picoruby/tree/master/mrbgems/picoruby-wasm/demo/www/terminal.html) shows `JS::WebSerial.connect`, terminal output, writes, disconnect handling, capture helpers, and firmware-transfer-oriented binary reads.
