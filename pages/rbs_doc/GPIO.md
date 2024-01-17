---
title: GPIO
keywords: GPIO
tags: [class]
summary: GPIO class of PicoRuby
sidebar: picoruby_sidebar
permalink: GPIO.html
folder: rbs_doc
---
## Type aliases
### gpio_pin_t
```ruby
Integer|String|Symbol
```
### gpio_logic_t
```ruby
0 | 1
```
## Singleton methods
### high_at?

```ruby
GPIO.high_at?(gpio_pin_t) -> bool
```
### low_at?

```ruby
GPIO.low_at?(Integer) -> bool
```
### new

```ruby
GPIO.new(gpio_pin_t pin, Integer flags, ?Integer alt_function) -> instance
```
### read_at

```ruby
GPIO.read_at(gpio_pin_t) -> gpio_logic_t
```
### write_at

```ruby
GPIO.write_at(gpio_pin_t, Integer) -> 0
```
## Instance methods
### high?

```ruby
instance.high?() -> bool
```
### low?

```ruby
instance.low?() -> bool
```
### read

```ruby
instance.read() -> gpio_logic_t
```
### setmode

```ruby
instance.setmode(Integer flags, ?Integer alt_function) -> 0
```
### write

```ruby
instance.write(Integer) -> 0
```
