---
title: Mouse
keywords: Mouse
tags: [class]
summary: Mouse class of PicoRuby
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
Mouse.new(driver: driver_t) -> instance
```
## Instance methods
### button_pressed?

```ruby
instance.button_pressed?() -> bool
```
### task

```ruby
instance.task() { (Mouse, Keyboard) -> void } -> Proc
```
## Attr accessors
### driver (reader)
```ruby
instance.driver -> driver_t
```
### task_proc (accessor)
```ruby
instance.task_proc -> ^(Mouse, Keyboard) -> void
```
### cursor_speed (accessor)
```ruby
instance.cursor_speed -> Integer
```
### wheel_speed (accessor)
```ruby
instance.wheel_speed -> Integer
```
### buttons (accessor)
```ruby
instance.buttons -> Integer
```
