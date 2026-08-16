---
title: class JS::WebAudio::Synth
keywords: JS::WebAudio::Synth
tags: [class]
summary: JS::WebAudio::Synth class of PicoRuby
sidebar: picoruby_sidebar
permalink: JS_WebAudio_Synth.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
JS::WebAudio::Synth.new(?voice_count: Integer, ?master_volume: Float, ?context: js_node_t?) -> void
```
## Instance methods
### active_voices

```ruby
instance.active_voices() -> ::Array[Voice::voice_snapshot_t]
```
### channel_state

```ruby
instance.channel_state(?source: source_t, channel: Integer) -> snapshot_t
```
### cleanup_finished_voices

```ruby
instance.cleanup_finished_voices() -> nil
```
### cleanup_task_running?

```ruby
instance.cleanup_task_running?() -> bool
```
### close

```ruby
instance.close() -> self
```
### handle

```ruby
instance.handle(MIDIBASE::event_t event, ?source: source_t, ?priority: Integer, ?timestamp_us: Integer?, **MIDIBASE::context_value_t context) -> bool
```
### handle_midi

```ruby
instance.handle_midi(MIDIBASE::event_t event, source_t source, Integer priority, Integer? timestamp_us) -> bool
```
### noise_buffer

```ruby
instance.noise_buffer() -> js_node_t
```
### reset

```ruby
instance.reset() -> bool
```
### resume

```ruby
instance.resume() -> self
```
### stop

```ruby
instance.stop() -> self
```
### stopped?

```ruby
instance.stopped?() -> bool
```
### update_tone

```ruby
instance.update_tone(?source: source_t, channel: Integer, **tone_attributes_t attributes) -> snapshot_t
```
### voice_analysers

```ruby
instance.voice_analysers() -> ::Array[js_node_t]
```
### voice_ended

```ruby
instance.voice_ended(Voice voice, Integer generation) -> bool?
```
## Attr accessors
### allocator (reader)
```ruby
instance.allocator -> MIDIBASE::VoiceAllocator
```
### context (reader)
```ruby
instance.context -> js_node_t
```
### mix_analyser (reader)
```ruby
instance.mix_analyser -> js_node_t
```
