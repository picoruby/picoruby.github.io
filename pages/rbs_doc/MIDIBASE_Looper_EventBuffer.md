---
title: class MIDIBASE::Looper::EventBuffer
keywords: MIDIBASE::Looper::EventBuffer
tags: [class]
summary: MIDIBASE::Looper::EventBuffer class of PicoRuby
sidebar: picoruby_sidebar
permalink: MIDIBASE_Looper_EventBuffer.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
MIDIBASE::Looper::EventBuffer.new(Integer max_events) -> void
```
## Instance methods
### append

```ruby
instance.append(Integer tick, Symbol command, Integer channel, Integer note, Integer velocity) -> Integer?
```
### clear

```ruby
instance.clear() -> self
```
### event_at

```ruby
instance.event_at(Integer index) -> MIDIBASE::event_t
```
### seal!

```ruby
instance.seal!() -> self
```
### sealed?

```ruby
instance.sealed?() -> bool
```
### set_tick_at

```ruby
instance.set_tick_at(Integer index, Integer tick) -> Integer
```
### sort!

```ruby
instance.sort!() -> self
```
### tick_at

```ruby
instance.tick_at(Integer index) -> Integer
```
## Attr accessors
### count (reader)
```ruby
instance.count -> Integer
```
### max_events (reader)
```ruby
instance.max_events -> Integer
```
