---
title: Mouse
sidebar: picoruby_sidebar
permalink: Mouse.html
folder: rbs_doc
---
## Type aliases
### driver_t
```ruby
I2C | SPI | Array[ADC]
```
## Singleton methods
### new

```ruby
Mouse.new(driver: driver_t) -> void
```
## Instance methods
### button_pressed?

```ruby
button_pressed?() -> bool
```
### task

```ruby
task() { (Mouse, Keyboard) -> void } -> Proc
```
## Attr accessors
### driver (reader)
```ruby
driver_t
```
### task_proc (accessor)
```ruby
^(Mouse, Keyboard) -> void
```
### cursor_speed (accessor)
```ruby
Integer
```
### wheel_speed (accessor)
```ruby
Integer
```
### buttons (accessor)
```ruby
Integer
```
