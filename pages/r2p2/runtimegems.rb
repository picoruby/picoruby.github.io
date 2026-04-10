
INDEX_JSON_URL = 'https://raw.githubusercontent.com/picoruby/runtimegems/refs/heads/master/artifact/index.json'

# ---------------------------------------------------------------------------
# App
# ---------------------------------------------------------------------------
class App
  TX_CHUNK_SIZE   = 32
  TX_CHUNK_GAP_MS = 20

  attr_accessor :current_port

  def initialize
    @doc           = JS.document
    @current_port  = nil
    @auto_reconnect = false
    @readme_cache  = {}
    @gems          = []
    @gem_rows      = []
    @upload_btns   = []
    @uploading     = false
    @terminal      = JS.global[:__nullTerminal]

    unless JS::WebSerial.supported?
      el('not-supported').style.display = 'block'
      el('connect-btn')[:disabled] = true
    end

    bind_events
    load_gems
  end

  def el(id)
    @doc.getElementById(id)
  end

  # Fetch a URL and return body as String, or nil if HTTP status != 200.
  # JS::Object#fetch requires a block; the block receives the Response object.
  def fetch_text(url)
    resp = JS.global.fetch(url) { |r| r }
    return nil unless resp[:status].to_i == 200
    resp.text.await.to_s
  end

  # Build a raw.githubusercontent.com URL for a file inside a GitHub repo.
  def raw_url(repo, ref, path, filename)
    raw_base = repo.to_s.sub('https://github.com', 'https://raw.githubusercontent.com')
    parts = [raw_base, ref.to_s, path.to_s.strip, filename].reject { |p| p.to_s.strip.empty? }
    parts.join('/')
  end

  # Extract [owner, repo_name] from a GitHub repo URL.
  def parse_github_url(repo_url)
    m = repo_url.to_s.match(%r{github\.com/([^/]+)/([^/\n]+)})
    raise "Cannot parse GitHub URL: #{repo_url}" unless m
    repo_name = m[2]
    repo_name = repo_name[0, repo_name.length - 4] if repo_name.end_with?('.git')
    [m[1], repo_name]
  end

  # ---------------------------------------------------------------------------
  # Gem table
  # ---------------------------------------------------------------------------

  def load_gems
    text = fetch_text(INDEX_JSON_URL)
    unless text
      show_log_pane
      append_log("[-] Failed to load index.json")
      return
    end
    js_arr = JS.global[:JSON].parse(text)
    n = js_arr[:length].to_i
    tbody = el('gems-tbody')
    n.times do |i|
      g = js_arr[i]
      tags_js = g[:tags]
      tags_n = tags_js[:length].to_i rescue 0
      tags_arr = []
      tags_n.times { |j| tags_arr << tags_js[j].to_s }
      gem = {
        'name'        => g[:name].to_s,
        'repo'        => g[:repo].to_s,
        'path'        => g[:path].to_s,
        'ref'         => g[:ref].to_s,
        'description' => g[:description].to_s,
        'tags'        => tags_arr
      }
      @gems << gem
      add_gem_row(tbody, gem, i)
    end
  end

  def add_gem_row(tbody, gem, idx)
    tr = @doc.createElement('tr')

    td_name = @doc.createElement('td')
    name_span = @doc.createElement('span')
    name_span[:textContent] = gem['name']
    td_name.appendChild(name_span)
    repo_link = @doc.createElement('a')
    path = gem['path'].to_s.strip
    repo_href = if path.empty?
      gem['repo']
    else
      "#{gem['repo']}/tree/#{gem['ref']}/#{path}"
    end
    repo_link[:href] = repo_href
    repo_link[:target] = '_blank'
    repo_link[:title] = 'Open repository'
    repo_link[:innerHTML] = ' <i class="fa-solid fa-arrow-up-right-from-square"></i>'
    repo_link[:style] = 'color:#7ec8e3;font-size:10px;text-decoration:none;opacity:0.7;'
    td_name.appendChild(repo_link)
    tr.appendChild(td_name)

    td_desc = @doc.createElement('td')
    td_desc[:textContent] = gem['description']
    tr.appendChild(td_desc)

    td_readme = @doc.createElement('td')
    rbtn = @doc.createElement('button')
    rbtn[:textContent] = 'README'
    rbtn[:className] = 'readme-btn'
    rbtn.addEventListener('click') { show_readme(gem) }
    td_readme.appendChild(rbtn)
    tr.appendChild(td_readme)

    td_upload = @doc.createElement('td')
    ubtn = @doc.createElement('button')
    ubtn[:textContent] = 'Upload'
    ubtn[:className] = 'upload-btn'
    ubtn.setAttribute('disabled', 'true')
    ubtn.addEventListener('click') { do_upload_gem(gem, ubtn) }
    td_upload.appendChild(ubtn)
    tr.appendChild(td_upload)
    @upload_btns << ubtn

    search_text = ([gem['name'], gem['description']] + gem['tags']).join(' ').downcase
    @gem_rows << { tr: tr, text: search_text }

    tbody.appendChild(tr)
  end

  def filter_gems(query)
    q = query.downcase.strip
    @gem_rows.each do |row|
      row[:tr].style.display = (q.empty? || row[:text].include?(q)) ? '' : 'none'
    end
  end

  def update_upload_buttons
    @upload_btns.each do |b|
      next if b[:className].to_s.include?('done')
      if connected?
        b.removeAttribute('disabled')
      else
        b.setAttribute('disabled', 'true')
      end
    end
  end

  # ---------------------------------------------------------------------------
  # Bottom pane - README display
  # ---------------------------------------------------------------------------

  def parse_gem_meta(rake_source)
    deps = []
    conflicts = []
    rake_source.each_line do |line|
      m = line.match(/spec\.add_dependency\s+['"]([^'"]+)['"]/)
      deps << m[1] if m
      m = line.match(/spec\.add_conflict\s+['"]([^'"]+)['"]/)
      conflicts << m[1] if m
    end
    { 'deps' => deps.uniq, 'conflicts' => conflicts.uniq }
  end

  def gem_meta_html(meta)
    deps = meta['deps']
    conflicts = meta['conflicts']
    return '' if deps.empty? && conflicts.empty?
    html = '<div class="gem-meta">'
    unless deps.empty?
      tags = deps.map { |d| "<span class=\"gem-meta-dep\">#{d}</span>" }.join(' ')
      html += "<div class=\"gem-meta-row\"><span class=\"gem-meta-label\">Depends on:</span> #{tags}</div>"
    end
    unless conflicts.empty?
      tags = conflicts.map { |c| "<span class=\"gem-meta-conflict\">#{c}</span>" }.join(' ')
      html += "<div class=\"gem-meta-row\"><span class=\"gem-meta-label\">Conflicts with:</span> #{tags}</div>"
    end
    html += '</div>'
    html
  end

  def show_readme(gem)
    name = gem['name']
    unless @readme_cache[name]
      el('bottom-placeholder')[:textContent] = "Loading README for #{name}..."
      el('bottom-placeholder').style.display = 'block'
      el('readme-content').style.display = 'none'
      el('upload-log').style.display = 'none'

      rake_url = raw_url(gem['repo'], gem['ref'], gem['path'], 'mrbgem.rake')
      rake_source = fetch_text(rake_url) || ''
      meta_html = gem_meta_html(parse_gem_meta(rake_source))

      url = raw_url(gem['repo'], gem['ref'], gem['path'], 'README.md')
      text = fetch_text(url)
      readme_html = if text && !text.strip.empty?
        Markdown.new(text).to_html
      else
        '<p style="color:#777">No README found.</p>'
      end
      @readme_cache[name] = meta_html + readme_html
    end

    el('bottom-placeholder').style.display = 'none'
    el('upload-log').style.display = 'none'
    el('readme-content')[:innerHTML] = @readme_cache[name]
    el('readme-content').style.display = 'block'
  end

  # ---------------------------------------------------------------------------
  # Bottom pane - Upload log
  # ---------------------------------------------------------------------------

  def show_log_pane
    el('bottom-placeholder').style.display = 'none'
    el('readme-content').style.display = 'none'
    el('readme-content')[:innerHTML] = ''
    el('upload-log')[:textContent] = ''
    el('upload-log').style.display = 'block'
  end

  def append_log(msg)
    log = el('upload-log')
    log[:textContent] = log[:textContent].to_s + msg + "\n"
    log[:scrollTop] = log[:scrollHeight]
  end

  # ---------------------------------------------------------------------------
  # Upload
  # ---------------------------------------------------------------------------

  def do_upload_gem(gem, btn)
    if @uploading
      show_log_pane
      append_log("[-] Upload already in progress")
      return
    end
    unless connected?
      show_log_pane
      append_log("[-] Not connected. Please connect to R2P2 first.")
      return
    end
    @uploading = true
    show_log_pane
    ok = upload_gem(gem)
    if ok
      btn[:textContent] = 'Uploaded'
      btn.setAttribute('disabled', 'true')
      btn[:className] = 'upload-btn done'
    end
  ensure
    @uploading = false
  end

  # Extract spec.require_name value from mrbgem.rake source.
  # Falls back to parsing the gem name (picoruby-foo -> foo).
  def parse_require_name(rake_source, gem_name)
    rake_source.each_line do |line|
      m = line.match(/spec\.require_name\s*=?\s*['"]([^'"]+)['"]/)
      return m[1] if m
    end
    m = gem_name.match(/^picoruby-(\w+)/)
    m ? m[1] : gem_name
  end

  # List .rb files directly under mrblib/ via GitHub Contents API.
  # Returns array of {name, download_url} sorted alphabetically.
  def list_mrblib_rb_files(gem)
    owner, repo_name = parse_github_url(gem['repo'])
    path = gem['path'].to_s.strip
    path_part = path.empty? ? '' : "/#{path}"
    url = "https://api.github.com/repos/#{owner}/#{repo_name}/contents#{path_part}/mrblib?ref=#{gem['ref']}"
    text = fetch_text(url)
    return [] unless text
    js_arr = JS.global[:JSON].parse(text)
    n = js_arr[:length].to_i
    files = []
    n.times do |i|
      entry = js_arr[i]
      next unless entry[:type].to_s == 'file'
      next unless entry[:name].to_s.end_with?('.rb')
      files << {
        'name'         => entry[:name].to_s,
        'download_url' => entry[:download_url].to_s
      }
    end
    files.sort { |a, b| a['name'] <=> b['name'] }
  end

  # Process a single gem: fetch sources, compile, and upload via PicoModem.
  def upload_gem(gem)
    name = gem['name']
    append_log("\n[*] #{name}")

    rake_url = raw_url(gem['repo'], gem['ref'], gem['path'], 'mrbgem.rake')
    append_log("[.] Fetching mrbgem.rake...")
    rake_source = fetch_text(rake_url)
    unless rake_source
      append_log("[-] Failed to fetch mrbgem.rake")
      return false
    end

    require_name = parse_require_name(rake_source, name)
    append_log("[.] require_name: #{require_name}")

    append_log("[.] Listing mrblib/ files...")
    rb_files = list_mrblib_rb_files(gem)
    if rb_files.empty?
      append_log("[-] No .rb files found in mrblib/")
      return false
    end
    append_log("[.] #{rb_files.size} file(s): #{rb_files.map { |f| f['name'] }.join(', ')}")

    combined = ""
    rb_files.each do |file|
      append_log("[.] Fetching #{file['name']}...")
      src = fetch_text(file['download_url'])
      unless src
        append_log("[-] Failed to fetch #{file['name']}")
        return false
      end
      combined << src
      combined << "\n" unless combined.end_with?("\n")
    end

    append_log("[.] Compiling #{combined.bytesize} bytes...")
    begin
      mrb = PicoRubyVM::InstructionSequence.compile(combined).to_binary
    rescue => e
      append_log("[-] Compile error: #{e.message}")
      return false
    end
    append_log("[.] Compiled: #{mrb.bytesize} bytes")

    dest = "/lib/#{require_name}.mrb"
    append_log("[*] Uploading to #{dest}...")
    upload_binary(mrb, dest)
  end

  # Upload raw binary data to a path on R2P2 via PicoModem.
  def upload_binary(data, path)
    success = false
    begin
      picomodem_enter_mode
      picomodem_send_frame(PicoModem::FILE_WRITE, [data.bytesize].pack("N") + path)

      frame = picomodem_recv_frame
      unless frame
        append_log("[-] Timeout waiting for FILE_ACK")
        return false
      end
      if frame[0] == PicoModem::ERROR
        append_log("[-] Device error: #{frame[1]}")
        return false
      end
      unless frame[0] == PicoModem::FILE_ACK
        append_log("[-] Unexpected response: 0x#{frame[0].to_s(16)}")
        return false
      end
      append_log("[.] Device ready, sending #{data.bytesize} bytes...")

      offset = 0
      while offset < data.bytesize
        remain = data.bytesize - offset
        size = remain < PicoModem::CHUNK_SIZE ? remain : PicoModem::CHUNK_SIZE
        chunk = data.byteslice(offset, size)
        picomodem_send_frame(PicoModem::CHUNK, chunk)

        ack = picomodem_recv_frame
        unless ack
          append_log("[-] Timeout at offset #{offset}")
          return false
        end
        if ack[0] == PicoModem::ERROR
          append_log("[-] Device error: #{ack[1]}")
          return false
        end
        unless ack[0] == PicoModem::CHUNK_ACK
          append_log("[-] Unexpected ACK: 0x#{ack[0].to_s(16)}")
          return false
        end
        offset += size
      end

      frame = picomodem_recv_frame
      unless frame
        append_log("[-] Timeout waiting for completion")
        return false
      end
      case frame[0]
      when PicoModem::DONE_ACK
        payload = frame[1]
        if 5 <= payload.bytesize
          status, remote_crc = payload.byteslice(0, 5).unpack("CN")
          local_crc = CRC.crc32(data)
          if status == PicoModem::OK && local_crc == remote_crc
            append_log("[+] Upload complete (CRC32 verified)")
            success = true
          elsif status == PicoModem::OK
            append_log("[-] CRC32 mismatch: local=0x#{local_crc.to_s(16)} remote=0x#{remote_crc.to_s(16)}")
          else
            append_log("[-] Upload failed: status=0x#{status.to_s(16)}")
          end
        else
          append_log("[+] Upload complete")
          success = true
        end
      when PicoModem::ERROR
        append_log("[-] Device error: #{frame[1]}")
      else
        append_log("[-] Unexpected response: 0x#{frame[0].to_s(16)}")
      end
    rescue => err
      append_log("[-] Error: #{error_text(err)}")
    ensure
      picomodem_exit_mode(!success)
    end
    success
  end

  # ---------------------------------------------------------------------------
  # Connection management
  # ---------------------------------------------------------------------------

  def connected?
    !@current_port.nil?
  end

  def auto_reconnect?
    @auto_reconnect == true
  end

  def auto_reconnect=(v)
    @auto_reconnect = v == true
  end

  def error_text(err)
    msg = err.message.to_s
    msg = err.to_s if msg.empty?
    klass = err.class.to_s
    msg.empty? ? klass : "#{klass}: #{msg}"
  end

  def update_status(text, connected)
    s = el('status')
    s[:textContent] = text
    s[:className] = connected ? 'connected' : 'disconnected'
  end

  def connect
    disconnect if current_port
    begin
      baud_rate = el('baud-rate')[:value].to_i
      JS::WebSerial.connect(baud_rate: baud_rate) do |ws|
        self.current_port = ws
        ws.start_terminal_read(@terminal)
        self.auto_reconnect = true
        update_status('Connected', true)
        el('connect-btn')[:textContent] = 'Disconnect'
        update_upload_buttons
      end
    rescue => err
      JS.global[:console].error("Connect error: #{error_text(err)}")
      update_status('Disconnected', false)
      self.current_port = nil
    end
  end

  def disconnect(manual: false)
    return if @disconnecting
    @disconnecting = true
    self.auto_reconnect = false if manual
    port = current_port
    port&.close rescue nil
    self.current_port = nil
    update_status('Disconnected', false)
    el('connect-btn')[:textContent] = 'Connect'
    update_upload_buttons
  ensure
    @disconnecting = false
  end

  def bind_events
    el('connect-btn').addEventListener('click') { connected? ? disconnect(manual: true) : connect }
    el('gem-filter').addEventListener('input') { filter_gems(el('gem-filter')[:value].to_s) }
    JS.global.addEventListener('serial-reader-closed') { disconnect }

    if JS::WebSerial.supported?
      serial = JS.global[:navigator][:serial]
      serial.addEventListener('connect') do |e|
        next if current_port || !auto_reconnect?
        raw_port = e[:target] || e[:port]
        next unless raw_port
        update_status('Reconnecting...', false)
        sleep_ms 1500
        begin
          ws = JS::WebSerial.new(raw_port)
          baud_rate = el('baud-rate')[:value].to_i
          ws.open(baud_rate: baud_rate)
          ws.start_terminal_read(@terminal)
          self.current_port = ws
          update_status('Connected', true)
          el('connect-btn')[:textContent] = 'Disconnect'
          update_upload_buttons
        rescue => err
          JS.global[:console].error("Auto-reconnect failed: #{error_text(err)}")
          update_status('Disconnected', false)
        end
      end

      serial.addEventListener('disconnect') do
        next unless current_port
        disconnect
      end
    end
  end

  # ---------------------------------------------------------------------------
  # PicoModem protocol helpers
  # ---------------------------------------------------------------------------

  def js_port
    current_port.instance_variable_get(:@js_port)
  end

  def picomodem_send_bytes(data)
    port = current_port
    return unless port
    off = 0
    while off < data.bytesize
      remain = data.bytesize - off
      size = remain < TX_CHUNK_SIZE ? remain : TX_CHUNK_SIZE
      chunk = data.byteslice(off, size)
      port.write(chunk)
      off += size
      sleep_ms TX_CHUNK_GAP_MS if off < data.bytesize
    end
    port.drain.await
  end

  def picomodem_build_frame(cmd, payload = "")
    body = cmd.chr + payload.to_s
    crc = CRC.crc16(body)
    [0x02, body.bytesize].pack("Cn") + body + [crc].pack("n")
  end

  def picomodem_send_frame(cmd, payload = "")
    picomodem_send_bytes(picomodem_build_frame(cmd, payload))
  end

  def picomodem_read_exact(n, timeout_ms)
    buf = ""
    waited = 0
    while buf.bytesize < n
      chunk = JS::WebSerial.binary_capture_read(js_port, n - buf.bytesize)
      if chunk && 0 < chunk.bytesize
        buf << chunk
        waited = 0
      else
        return nil if timeout_ms <= waited
        sleep_ms 10
        waited += 10
      end
    end
    buf
  end

  def picomodem_recv_frame(timeout_ms = PicoModem::TIMEOUT_MS)
    waited = 0
    while true
      b = JS::WebSerial.binary_capture_read(js_port, 1)
      if b && 0 < b.bytesize
        break if b.getbyte(0) == 0x02
        next
      end
      return nil if timeout_ms <= waited
      sleep_ms 10
      waited += 10
    end
    len_bytes = picomodem_read_exact(2, timeout_ms)
    return nil unless len_bytes
    length = len_bytes.unpack("n")[0]
    rest = picomodem_read_exact(length + 2, timeout_ms)
    return nil unless rest
    body = rest.byteslice(0, length)
    expected_crc = rest.byteslice(length, 2).unpack("n")[0]
    return nil unless CRC.crc16(body) == expected_crc
    cmd = body.getbyte(0)
    payload = 1 < length ? body.byteslice(1, length - 1) : ""
    [cmd, payload]
  end

  def picomodem_enter_mode
    jsp = js_port
    JS::WebSerial.capture_start(jsp)
    current_port.write("\x02")
    current_port.drain.await
    waited = 0
    while waited < PicoModem::TIMEOUT_MS
      break if JS::WebSerial.capture_peek(jsp).to_s.include?("\x06")
      sleep_ms 1
      waited += 1
    end
    JS::WebSerial.capture_stop(jsp)
    JS::WebSerial.binary_capture_start(jsp)
  end

  def picomodem_exit_mode(send_abort = false)
    if send_abort
      begin
        picomodem_send_frame(PicoModem::ABORT)
        sleep_ms 100
      rescue
      end
    end
    JS::WebSerial.binary_capture_stop(js_port) rescue nil
  end
end

JS.global[:__ruby_description] = RUBY_DESCRIPTION
App.new
