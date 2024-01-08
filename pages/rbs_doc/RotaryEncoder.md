---
title: RotaryEncoder
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
### call_proc_if

```ruby
instance.call_proc_if(Integer) -> void
```
### ccw

```ruby
instance.ccw() { () -> void } -> void
```
### clockwise

```ruby
instance.clockwise() { () -> void } -> void
```
### configure

```ruby
instance.configure(Symbol symbol) -> void
```
### consume_encoder

```ruby
instance.consume_encoder(Integer) -> Integer
```
### consume_rotation_anchor

```ruby
instance.consume_rotation_anchor() -> void
```
### consume_rotation_partner

```ruby
instance.consume_rotation_partner() -> Integer
```
### counterclockwise

```ruby
instance.counterclockwise() { () -> void } -> void
```
### create_keycodes

```ruby
instance.create_keycodes(Integer) -> void
```
### cw

```ruby
instance.cw() { () -> void } -> void
```
### init_encoder

```ruby
instance.init_encoder(Integer, Integer) -> Integer
```
### init_pins

```ruby
instance.init_pins() -> void
```
### left?

```ruby
instance.left?() -> bool
```
### right?

```ruby
instance.right?() -> bool
```
