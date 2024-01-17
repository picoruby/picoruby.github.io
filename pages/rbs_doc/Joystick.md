---
title: Joystick
keywords: Joystick
tags: [class]
summary: Joystick class of PicoRuby
sidebar: picoruby_sidebar
permalink: Joystick.html
folder: rbs_doc
---
## Type aliases
### adc_pins_t
```ruby
26 | 27 | 28 | 29
```
### init_axis_t
```ruby
:x | :y | :z | :rx | :ry | :rz
```
### init_param_t
```ruby
{
                        invert: bool?,
                        magnify: Integer? | Float?,
                        pin: adc_pins_t
                      }
```
## Singleton methods
### new

```ruby
Joystick.new(?Hash[init_axis_t, init_param_t] axes) -> instance
```
## Instance methods
### drift_supression=

```ruby
instance.drift_supression=(Integer) -> bool
```
### report_hid

```ruby
instance.report_hid(Integer, Integer) -> nil
```
