---
title: class MIDIBASE::Clock
keywords: MIDIBASE::Clock
tags: [class]
summary: MIDIBASE::Clock class of PicoRuby
sidebar: picoruby_sidebar
permalink: MIDIBASE_Clock.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
MIDIBASE::Clock.new(?time_signature: Array[Integer]) -> void
```
## Instance methods
### bar

```ruby
instance.bar() -> Integer
```
### beat

```ruby
instance.beat() -> Integer
```
### clock_running?

```ruby
instance.clock_running?() -> bool
```
### observe

```ruby
instance.observe(event_t event, ?Integer? timestamp_us) -> event_t
```
### position

```ruby
instance.position() -> Array[Integer]
```
### reset

```ruby
instance.reset() -> self
```
### tick

```ruby
instance.tick() -> Integer
```
### time_signature=

```ruby
instance.time_signature=(Array[Integer] signature) -> Array[Integer]
```
## Attr accessors
### bpm (reader)
```ruby
instance.bpm -> Float?
```
### time_signature (reader)
```ruby
instance.time_signature -> Array[Integer]
```
