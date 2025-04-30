---
title: class GPIO
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
GPIO.high_at?(gpio_pin_t pin) -> bool
```
### low_at?

```ruby
GPIO.low_at?(Integer) -> bool
```
### new

```ruby
GPIO.new(gpio_pin_t pin, Integer flags, ?Integer alt_function) -> instance
```
### open_drain_at

```ruby
GPIO.open_drain_at(gpio_pin_t pin) -> 0
```
### pull_down_at

```ruby
GPIO.pull_down_at(gpio_pin_t pin) -> 0
```
### pull_up_at

```ruby
GPIO.pull_up_at(gpio_pin_t pin) -> 0
```
### read_at

```ruby
GPIO.read_at(gpio_pin_t pin) -> gpio_logic_t
```
### set_dir_at

```ruby
GPIO.set_dir_at(gpio_pin_t pin, Integer flags) -> 0
```
### set_function_at

```ruby
GPIO.set_function_at(gpio_pin_t pin, Integer alt_function) -> 0
```
### write_at

```ruby
GPIO.write_at(gpio_pin_t pin, Integer value) -> 0
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
### open_drain

```ruby
instance.open_drain(Integer flags) -> 0
```
### read

```ruby
instance.read() -> gpio_logic_t
```
### set_dir

```ruby
instance.set_dir(Integer flags) -> 0
```
### set_function

```ruby
instance.set_function(Integer flags, Integer alt_function) -> 0
```
### set_pull

```ruby
instance.set_pull(Integer flags) -> 0
```
### setmode

```ruby
instance.setmode(Integer flags, ?Integer alt_function) -> 0
```
### write

```ruby
instance.write(Integer value) -> 0
```
