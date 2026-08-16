---
title: class MIDIBASE::Looper
keywords: MIDIBASE::Looper
tags: [class]
summary: MIDIBASE::Looper class of PicoRuby
sidebar: picoruby_sidebar
permalink: MIDIBASE_Looper.html
folder: rbs_doc
---
## Type aliases
### output_t
```ruby
untyped
```
### time_source_t
```ruby
untyped
```
### live_note_value_t
```ruby
untyped
```
### midi_message_value_t
```ruby
untyped
```
### command_arg_t
```ruby
untyped
```
### command_result_t
```ruby
untyped
```
### status_value_t
```ruby
untyped
```
### emit_result_t
```ruby
untyped
```
## Singleton methods
### new

```ruby
MIDIBASE::Looper.new(
      output: output_t,
      ?tempo: Integer,
      ?time_signature: Array[Integer],
      ?bars: Integer,
      ?count_in_bars: Integer,
      ?quantize: Symbol,
      ?metronome: Symbol,
      ?voice_capacity: Integer,
      ?click_voice_cost: Integer,
      ?max_parts: Integer,
      ?max_arrangement_steps: Integer,
      ?max_events_per_track: Integer,
      ?time_source: time_source_t
    ) -> void
```
## Instance methods
### advance

```ruby
instance.advance(Integer now_us) -> self
```
### arrangement=

```ruby
instance.arrangement=(Array[Array[untyped]] entries) -> command_result_t
```
### bars=

```ruby
instance.bars=(Integer value) -> command_result_t
```
### clear

```ruby
instance.clear() -> command_result_t
```
### clear_part

```ruby
instance.clear_part(?untyped id) -> command_result_t
```
### copy_part

```ruby
instance.copy_part(untyped source, ?untyped id) -> command_result_t
```
### count_in_bars=

```ruby
instance.count_in_bars=(Integer value) -> command_result_t
```
### create_part

```ruby
instance.create_part(?untyped id, ?bars: Integer?) -> command_result_t
```
### delete

```ruby
instance.delete(Integer index) -> command_result_t
```
### delete_part

```ruby
instance.delete_part(untyped id) -> command_result_t
```
### handle

```ruby
instance.handle(MIDIBASE::event_t event, ?source: Router::source_t, ?priority: Integer, ?timestamp_us: Integer?, **MIDIBASE::context_value_t context) -> bool
```
### handle_midi

```ruby
instance.handle_midi(MIDIBASE::event_t event, Router::source_t source, Integer priority, Integer timestamp_us) -> bool
```
### join

```ruby
instance.join() -> self
```
### metronome=

```ruby
instance.metronome=(Symbol value) -> command_result_t
```
### mute

```ruby
instance.mute(Integer index) -> command_result_t
```
### play

```ruby
instance.play() -> command_result_t
```
### play_song

```ruby
instance.play_song() -> command_result_t
```
### quantize=

```ruby
instance.quantize=(Symbol value) -> command_result_t
```
### record

```ruby
instance.record(?voices: Integer) -> command_result_t
```
### redo

```ruby
instance.redo() -> command_result_t
```
### run

```ruby
instance.run() -> void
```
### select_part

```ruby
instance.select_part(untyped id) -> command_result_t
```
### start

```ruby
instance.start() -> self
```
### status

```ruby
instance.status() -> Hash[Symbol, status_value_t]
```
### stop

```ruby
instance.stop() -> self
```
### tempo=

```ruby
instance.tempo=(Integer value) -> command_result_t
```
### time_signature=

```ruby
instance.time_signature=(Array[Integer] value) -> command_result_t
```
### tracks

```ruby
instance.tracks() -> Array[Track]
```
### transport_stop

```ruby
instance.transport_stop() -> command_result_t
```
### undo

```ruby
instance.undo() -> command_result_t
```
### unmute

```ruby
instance.unmute(Integer index) -> command_result_t
```
## Attr accessors
### state (reader)
```ruby
instance.state -> Symbol
```
### live_source (reader)
```ruby
instance.live_source -> Router::source_t
```
### click_source (reader)
```ruby
instance.click_source -> Router::source_t
```
### track_sources (reader)
```ruby
instance.track_sources -> Array[Router::source_t]
```
