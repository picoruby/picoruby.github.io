---
title: class MIDIBASE::Router::Emitter
keywords: MIDIBASE::Router::Emitter
tags: [class]
summary: MIDIBASE::Router::Emitter class of PicoRuby
sidebar: picoruby_sidebar
permalink: MIDIBASE_Router_Emitter.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
MIDIBASE::Router::Emitter.new(Router router, source_t source) -> void
```
## Instance methods
### handle

```ruby
instance.handle(event_t event, ?timestamp_us: Integer?, **context_value_t context) -> event_t
```
### handle_midi

```ruby
instance.handle_midi(event_t event, source_t source, Integer priority, Integer timestamp_us) -> event_t
```
