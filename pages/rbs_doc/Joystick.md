---
title: Joystick
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
Joystick.new(?Hash[init_axis_t, init_param_t] axes) -> void
```
## Instance methods
### drift_supression=

```ruby
drift_supression=(Integer) -> bool
```
### init_axis_offset

```ruby
init_axis_offset(String axis, Integer pin) -> bool
```
### init_sensitivity

```ruby
init_sensitivity(Integer, Float) -> void
```
### report_hid

```ruby
report_hid(Integer, Integer) -> nil
```
### reset_axes

```ruby
reset_axes() -> nil
```
