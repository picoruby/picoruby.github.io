---
title: PWM
sidebar: picoruby_sidebar
permalink: PWM.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
PWM.new(Integer pin, ?frequency: (Float|Integer), ?duty:  (Float|Integer)) -> void
```
## Instance methods
### _init

```ruby
_init(Integer pin) -> 0
```
### duty

```ruby
duty(Float|Integer) -> Float
```
### frequency

```ruby
frequency(Float|Integer) -> Float
```
### period_us

```ruby
period_us(Integer) -> Float
```
### pulse_width_us

```ruby
pulse_width_us(Integer) -> Float
```
