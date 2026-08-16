---
title: class LooperConsole
keywords: LooperConsole
tags: [class]
summary: LooperConsole class of PicoRuby
sidebar: picoruby_sidebar
permalink: LooperConsole.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
LooperConsole.new(MIDIBASE::Looper looper, ?options: LooperCLIOptions?) -> void
```
### usage

```ruby
LooperConsole.usage() -> void
```
## Instance methods
### run

```ruby
instance.run(MIDIBASE::Session session) -> void
```
### watch_recording

```ruby
instance.watch_recording(Symbol part_id, Integer before_tracks, Symbol state) -> void
```
