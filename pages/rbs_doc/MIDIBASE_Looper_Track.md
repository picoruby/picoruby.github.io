---
title: class MIDIBASE::Looper::Track
keywords: MIDIBASE::Looper::Track
tags: [class]
summary: MIDIBASE::Looper::Track class of PicoRuby
sidebar: picoruby_sidebar
permalink: MIDIBASE_Looper_Track.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
MIDIBASE::Looper::Track.new(EventBuffer events, source: Symbol, voice_limit: Integer, ?channel_mask: Integer) -> void
```
## Instance methods
### advance

```ruby
instance.advance(Integer loop_ticks) -> Integer
```
### copy

```ruby
instance.copy() -> Track
```
### current_event

```ruby
instance.current_event() -> MIDIBASE::event_t
```
### next_tick

```ruby
instance.next_tick(Integer loop_ticks) -> Integer?
```
### note_started

```ruby
instance.note_started(MIDIBASE::event_t event) -> Array[Integer]
```
### note_stopped

```ruby
instance.note_stopped(MIDIBASE::event_t event) -> void
```
### reset

```ruby
instance.reset() -> self
```
### seek

```ruby
instance.seek(Integer absolute_tick, Integer loop_ticks) -> self
```
### take_active_notes

```ruby
instance.take_active_notes() -> Array[Integer]
```
## Attr accessors
### events (reader)
```ruby
instance.events -> EventBuffer
```
### source (reader)
```ruby
instance.source -> Symbol
```
### voice_limit (reader)
```ruby
instance.voice_limit -> Integer
```
### channel_mask (reader)
```ruby
instance.channel_mask -> Integer
```
### muted (accessor)
```ruby
instance.muted -> bool
```
