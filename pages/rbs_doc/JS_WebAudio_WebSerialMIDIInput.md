---
title: class JS::WebAudio::WebSerialMIDIInput
keywords: JS::WebAudio::WebSerialMIDIInput
tags: [class]
summary: JS::WebAudio::WebSerialMIDIInput class of PicoRuby
sidebar: picoruby_sidebar
permalink: JS_WebAudio_WebSerialMIDIInput.html
folder: rbs_doc
---
## Type aliases
### serial_state_t
```ruby
:connecting | :connected | :disconnected | :error
```
## Singleton methods
### new

```ruby
JS::WebAudio::WebSerialMIDIInput.new(router: MIDIBASE::Router, ?source: source_t, ?on_state_change: Proc?, ?parser: MIDIBASE::Parser?, ?gc_yield_event_count: Integer?, ?gc_yield_ms: Integer) -> void
```
## Instance methods
### connect

```ruby
instance.connect(?baud_rate: Integer) -> self
```
### disconnect

```ruby
instance.disconnect() -> self
```
### disconnected

```ruby
instance.disconnected() -> self
```
### feed

```ruby
instance.feed(String bytes, ?timestamp_us: Integer) -> Integer
```
### stop

```ruby
instance.stop() -> self
```
## Attr accessors
### state (reader)
```ruby
instance.state -> serial_state_t
```
### error (reader)
```ruby
instance.error -> Exception?
```
### port (reader)
```ruby
instance.port -> JS::WebSerial?
```
### gc_yield_event_count (reader)
```ruby
instance.gc_yield_event_count -> Integer?
```
### gc_yield_ms (reader)
```ruby
instance.gc_yield_ms -> Integer
```
