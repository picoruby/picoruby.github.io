---
title: class MIDIBASE::Router
keywords: MIDIBASE::Router
tags: [class]
summary: MIDIBASE::Router class of PicoRuby
sidebar: picoruby_sidebar
permalink: MIDIBASE_Router.html
folder: rbs_doc
---
## Type aliases
### source_t
```ruby
Symbol
```
### sink_t
```ruby
untyped
```
### route_t
```ruby
[source_t, sink_t, Integer, Array[Symbol]?, Array[Symbol]?, bool]
```
## Singleton methods
### new

```ruby
MIDIBASE::Router.new() -> void
```
## Instance methods
### connect

```ruby
instance.connect(source_t source, sink_t sink, ?priority: Integer, ?only: Array[Symbol]?, ?except: Array[Symbol]?) -> self
```
### emit

```ruby
instance.emit(source_t source, event_t event, ?timestamp_us: Integer?) -> event_t
```
### emit_midi

```ruby
instance.emit_midi(source_t source, event_t event, Integer timestamp_us) -> event_t
```
### output

```ruby
instance.output(source_t source) -> Emitter
```
