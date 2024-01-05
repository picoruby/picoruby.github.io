---
title: RotaryEncoder
sidebar: picoruby_sidebar
permalink: RotaryEncoder.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
RotaryEncoder.new(Integer pin_a, Integer pin_b) -> void
```
## Instance methods
### call_proc_if

```ruby
call_proc_if(Integer) -> void
```
### ccw

```ruby
ccw() { () -> void } -> void
```
### clockwise

```ruby
clockwise() { () -> void } -> void
```
### configure

```ruby
configure(Symbol symbol) -> void
```
### consume_encoder

```ruby
consume_encoder(Integer) -> Integer
```
### consume_rotation_anchor

```ruby
consume_rotation_anchor() -> void
```
### consume_rotation_partner

```ruby
consume_rotation_partner() -> Integer
```
### counterclockwise

```ruby
counterclockwise() { () -> void } -> void
```
### create_keycodes

```ruby
create_keycodes(Integer) -> void
```
### cw

```ruby
cw() { () -> void } -> void
```
### init_encoder

```ruby
init_encoder(Integer, Integer) -> Integer
```
### init_pins

```ruby
init_pins() -> void
```
### left?

```ruby
left?() -> bool
```
### right?

```ruby
right?() -> bool
```
