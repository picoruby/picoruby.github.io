---
title: class RotaryEncoder
keywords: RotaryEncoder
tags: [class]
summary: RotaryEncoder class of PicoRuby
sidebar: picoruby_sidebar
permalink: RotaryEncoder.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
RotaryEncoder.new(Integer pin_a, Integer pin_b) -> instance
```
## Instance methods
### clockwise

```ruby
instance.clockwise() { () -> void } -> void
```
### counterclockwise

```ruby
instance.counterclockwise() { () -> void } -> void
```
### on_pin_a

```ruby
instance.on_pin_a(Integer event_type) -> void
```
### on_pin_b

```ruby
instance.on_pin_b(Integer event_type) -> void
```
