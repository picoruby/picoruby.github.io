---
title: GPIO
sidebar: picoruby_sidebar
permalink: GPIO.html
folder: rbs_doc
---
## Type aliases
### pin_t
```ruby
Integer|String|Symbol
```
## Singleton methods
### _init

```ruby
GPIO._init(pin_t) -> 0
```
### high_at?

```ruby
GPIO.high_at?(pin_t) -> bool
```
### new

```ruby
GPIO.new(pin_t pin, Integer flags, ?Integer alt_function) -> void
```
### low_at?

```ruby
GPIO.low_at?(Integer) -> bool
```
### open_drain_at

```ruby
GPIO.open_drain_at(pin_t) -> 0
```
### pull_down_at

```ruby
GPIO.pull_down_at(pin_t) -> 0
```
### pull_up_at

```ruby
GPIO.pull_up_at(pin_t) -> 0
```
### read_at

```ruby
GPIO.read_at(pin_t) -> Integer
```
### set_dir_at

```ruby
GPIO.set_dir_at(pin_t, Integer) -> 0
```
### set_function_at

```ruby
GPIO.set_function_at(pin_t, Integer) -> 0
```
### write_at

```ruby
GPIO.write_at(pin_t, Integer) -> 0
```
## Instance methods
### high?

```ruby
high?() -> bool
```
### low?

```ruby
low?() -> bool
```
### on_initialize?

```ruby
on_initialize?() -> bool
```
### open_drain

```ruby
open_drain(Integer) -> 0
```
### read

```ruby
read() -> Integer
```
### set_dir

```ruby
set_dir(Integer) -> 0
```
### set_function

```ruby
set_function(Integer, Integer) -> 0
```
### set_pull

```ruby
set_pull(Integer) -> 0
```
### setmode

```ruby
setmode(Integer flags, ?Integer alt_function) -> 0
```
### write

```ruby
write(Integer) -> 0
```
