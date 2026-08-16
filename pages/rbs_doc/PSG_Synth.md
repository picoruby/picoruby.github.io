---
title: class PSG::Synth
keywords: PSG::Synth
tags: [class]
summary: PSG::Synth class of PicoRuby
sidebar: picoruby_sidebar
permalink: PSG_Synth.html
folder: rbs_doc
---
## Type aliases
### voice_pool_config_t
```ruby
Hash[MIDIBASE::Router::source_t, Integer | Array[Integer]]
```
### voice_pool_t
```ruby
Hash[MIDIBASE::Router::source_t, Array[Integer]]
```
### state_key_t
```ruby
[MIDIBASE::Router::source_t, Integer]
```
### state_t
```ruby
[Integer, Integer, Integer, Integer, bool, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, bool]
```
### note_key_t
```ruby
[MIDIBASE::Router::source_t, Integer, Integer]
```
### program_cursor_t
```ruby
[voice_program_t, Integer, Integer, Integer, MIDIBASE::Router::source_t, Integer, Integer]
```
### midi_message_value_t
```ruby
untyped
```
### midi_message_t
```ruby
Array[midi_message_value_t]
```
## Singleton methods
### new

```ruby
PSG::Synth.new(Driver driver, ?voice_count: Integer, ?voice_pools: voice_pool_config_t?) -> void
```
## Instance methods
### handle

```ruby
instance.handle(MIDIBASE::event_t event, ?source: MIDIBASE::Router::source_t, ?priority: Integer, ?timestamp_us: Integer?, **MIDIBASE::context_value_t context) -> bool
```
### handle_midi

```ruby
instance.handle_midi(MIDIBASE::event_t event, MIDIBASE::Router::source_t source, Integer priority, Integer? timestamp_us) -> bool
```
### join

```ruby
instance.join() -> self
```
### run

```ruby
instance.run() -> void
```
### start

```ruby
instance.start() -> self
```
### stop

```ruby
instance.stop() -> self
```
### stop_program

```ruby
instance.stop_program(Symbol name, ?source: MIDIBASE::Router::source_t, ?timestamp_us: Integer?) -> bool
```
### trigger_program

```ruby
instance.trigger_program(Symbol name, ?velocity: Integer, ?source: MIDIBASE::Router::source_t, ?priority: Integer, ?timestamp_us: Integer?) -> bool
```
## Attr accessors
### allocator (reader)
```ruby
instance.allocator -> MIDIBASE::VoiceAllocator
```
