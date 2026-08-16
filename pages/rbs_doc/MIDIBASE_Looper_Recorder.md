---
title: class MIDIBASE::Looper::Recorder
keywords: MIDIBASE::Looper::Recorder
tags: [class]
summary: MIDIBASE::Looper::Recorder class of PicoRuby
sidebar: picoruby_sidebar
permalink: MIDIBASE_Looper_Recorder.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
MIDIBASE::Looper::Recorder.new(loop_ticks: Integer, grid_ticks: Integer?, voice_limit: Integer, max_events: Integer) -> void
```
## Instance methods
### finish

```ruby
instance.finish() -> EventBuffer?
```
### note_off

```ruby
instance.note_off(Integer tick, Integer channel, Integer note, Integer velocity) -> bool
```
### note_on

```ruby
instance.note_on(Integer tick, Integer channel, Integer note, Integer velocity) -> bool
```
### overflow?

```ruby
instance.overflow?() -> bool
```
## Attr accessors
### buffer (reader)
```ruby
instance.buffer -> EventBuffer
```
### voice_limit (reader)
```ruby
instance.voice_limit -> Integer
```
### channel_mask (reader)
```ruby
instance.channel_mask -> Integer
```
