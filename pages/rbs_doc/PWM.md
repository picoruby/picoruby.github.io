---
title: PWM
keywords: PWM
tags: [class]
summary: PWM class of PicoRuby
sidebar: picoruby_sidebar
permalink: PWM.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
PWM.new(Integer pin, ?frequency: (Float|Integer), ?duty:  (Float|Integer)) -> instance
```
## Instance methods
### duty

```ruby
instance.duty(Float|Integer) -> Float
```
### frequency

```ruby
instance.frequency(Float|Integer) -> Float
```
### period_us

```ruby
instance.period_us(Integer) -> Float
```
### pulse_width_us

```ruby
instance.pulse_width_us(Integer) -> Float
```
