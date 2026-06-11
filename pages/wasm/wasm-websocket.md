---
keywords: documentation
layout: page
tags: [wasm, webassembly, websocket]
title: PicoRuby.wasm WebSocket
sidebar: picoruby_sidebar
permalink: wasm-websocket
folder: wasm
---

PicoRuby.wasm can open browser WebSocket connections through `JS::WebSocket`.

The class follows the browser WebSocket model: create a socket with a URL, register event callbacks, send data after `onopen`, and close it when the conversation is finished.

## Basic Use

```ruby
require 'js'

log = JS.document.getElementById('log')
ws = JS::WebSocket.new('wss://example.com/socket')

ws.onopen do |_event|
  log[:textContent] = log[:textContent].to_s + "opened\n"
  ws.send("hello from PicoRuby")
end

ws.onmessage do |event|
  log[:textContent] = log[:textContent].to_s + "message: #{event[:data]}\n"
end

ws.onerror do |_event|
  log[:textContent] = log[:textContent].to_s + "error\n"
end

ws.onclose do |_event|
  log[:textContent] = log[:textContent].to_s + "closed\n"
end
```

Callbacks run asynchronously from browser events. Keep the socket object reachable while it is in use, for example by storing it in an instance variable or global variable in a small demo.

```ruby
$socket = JS::WebSocket.new('wss://example.com/socket')
```

## State

`ready_state` returns the browser WebSocket state number. PicoRuby.wasm also defines the browser constants and convenience predicates.

```ruby
case ws.ready_state
when JS::WebSocket::CONNECTING
  puts "connecting"
when JS::WebSocket::OPEN
  puts "open"
when JS::WebSocket::CLOSING
  puts "closing"
when JS::WebSocket::CLOSED
  puts "closed"
end

ws.send("ping") if ws.open?
```

Available predicates are `connecting?`, `open?`, `closing?`, and `closed?`.

## Binary Messages

Text messages are sent with `send`. Binary messages are sent with `send_binary`, using a Ruby `String` as the byte buffer.

```ruby
ws.onopen do |_event|
  ws.binaryType = 'arraybuffer'
  ws.send_binary("\x01\x02\x03")
end

ws.onmessage do |event_or_data|
  if event_or_data.is_a?(String)
    bytes = event_or_data.bytes
    puts "binary: #{bytes.inspect}"
  else
    puts "text: #{event_or_data[:data]}"
  end
end
```

When `binaryType` is set to `'arraybuffer'`, incoming binary frames are delivered to the callback as a Ruby `String`. Text frames are delivered as a JavaScript event object, and the text is available through `event[:data]`.

## Useful Methods

- `JS::WebSocket.new(url)`
- `ws.onopen`, `ws.onmessage`, `ws.onerror`, `ws.onclose`
- `ws.send(data)`, `ws.send_binary(bytes)`, `ws.close`
- `ws.ready_state`, `ws.binary_type`, `ws.binaryType=`
- `ws.connecting?`, `ws.open?`, `ws.closing?`, `ws.closed?`

## Examples

The PicoRuby.wasm demo directory has working examples:

- [`websocket.html`](https://github.com/picoruby/picoruby/tree/master/mrbgems/picoruby-wasm/demo/www/websocket.html) shows creation, callbacks, send, receive, and close.
- [`drb_client.html`](https://github.com/picoruby/picoruby/tree/master/mrbgems/picoruby-wasm/demo/www/drb_client.html) shows a larger application that uses WebSocket communication from PicoRuby.wasm.
