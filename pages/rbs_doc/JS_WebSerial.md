---
title: class JS::WebSerial
keywords: JS::WebSerial
tags: [class]
summary: JS::WebSerial class of PicoRuby
sidebar: picoruby_sidebar
permalink: JS_WebSerial.html
folder: rbs_doc
---
## Singleton methods
### _close_port

```ruby
JS::WebSerial._close_port(JS::Object js_port) -> nil
```
### _close_port_promise

```ruby
JS::WebSerial._close_port_promise(JS::Object js_port) -> JS::Object
```
### _open_port

```ruby
JS::WebSerial._open_port(JS::Object js_port, JS::Object options) -> JS::Object
```
### _request_port

```ruby
JS::WebSerial._request_port() -> JS::Object
```
### _set_on_disconnect

```ruby
JS::WebSerial._set_on_disconnect(JS::Object js_port, Integer callback_id) -> nil
```
### _start_reading

```ruby
JS::WebSerial._start_reading(JS::Object js_port, Integer callback_id) -> nil
```
### _take_last_connected_port

```ruby
JS::WebSerial._take_last_connected_port() -> JS::Object?
```
### _watch_connect_events

```ruby
JS::WebSerial._watch_connect_events() -> nil
```
### binary_capture_read

```ruby
JS::WebSerial.binary_capture_read(JS::Object js_port, Integer max_bytes) -> String
```
### binary_capture_start

```ruby
JS::WebSerial.binary_capture_start(JS::Object js_port) -> nil
```
### binary_capture_stop

```ruby
JS::WebSerial.binary_capture_stop(JS::Object js_port) -> nil
```
### capture_peek

```ruby
JS::WebSerial.capture_peek(JS::Object js_port) -> String
```
### capture_start

```ruby
JS::WebSerial.capture_start(JS::Object js_port) -> nil
```
### capture_stop

```ruby
JS::WebSerial.capture_stop(JS::Object js_port) -> String
```
### connect

```ruby
JS::WebSerial.connect(?baud_rate: Integer, ?data_bits: Integer, ?stop_bits: Integer, ?parity: String) -> JS::WebSerial
JS::WebSerial.connect(?baud_rate: Integer, ?data_bits: Integer, ?stop_bits: Integer, ?parity: String) { (JS::WebSerial) -> void } -> JS::WebSerial
```
### new

```ruby
JS::WebSerial.new(JS::Object js_port) -> void
```
### request_port

```ruby
JS::WebSerial.request_port(?filters: Array[untyped]) -> JS::WebSerial?
JS::WebSerial.request_port(?filters: Array[untyped]) { (JS::WebSerial?) -> void } -> JS::WebSerial?
```
### supported?

```ruby
JS::WebSerial.supported?() -> boolish
```
## Instance methods
### close

```ruby
instance.close() -> nil
```
### drain

```ruby
instance.drain() -> JS::Object
```
### on_disconnect

```ruby
instance.on_disconnect() { () -> void } -> nil
```
### on_receive

```ruby
instance.on_receive() { (String data) -> void } -> nil
```
### open

```ruby
instance.open(?baud_rate: Integer, ?data_bits: Integer, ?stop_bits: Integer, ?parity: String) -> JS::WebSerial
instance.open(?baud_rate: Integer, ?data_bits: Integer, ?stop_bits: Integer, ?parity: String) { (JS::WebSerial) -> void } -> JS::WebSerial
```
### opened?

```ruby
instance.opened?() -> bool
```
### start_terminal_read

```ruby
instance.start_terminal_read() -> nil
```
### write

```ruby
instance.write(String str) -> nil
```
### write_bytes

```ruby
instance.write_bytes(String bytes, ?chunk_size: Integer) -> JS::Object
```
