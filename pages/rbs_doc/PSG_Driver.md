---
title: class PSG::Driver
keywords: PSG::Driver
tags: [class]
summary: PSG::Driver class of PicoRuby
sidebar: picoruby_sidebar
permalink: PSG_Driver.html
folder: rbs_doc
---
## Singleton methods
### select_mcp4922

```ruby
PSG::Driver.select_mcp4922(Integer ldac) -> void
```
### select_pwm

```ruby
PSG::Driver.select_pwm(Integer left, Integer right) -> void
```
## Instance methods
### buffer_empty?

```ruby
instance.buffer_empty?() -> bool
```
### deinit

```ruby
instance.deinit() -> nil
```
### initalize

```ruby
instance.initalize(Symbol type, **Integer opt) -> void
```
### join

```ruby
instance.join() -> void
```
### mute

```ruby
instance.mute(Integer ch, Integer flag, ?Integer tick_delay) -> bool
```
### play_mml

```ruby
instance.play_mml(Array[String] tracks, ?terminate: bool) -> self
```
### play_prs

```ruby
instance.play_prs(String filename, ?terminate: bool) -> void
```
### send_reg

```ruby
instance.send_reg(Integer reg, Integer val, ?Integer tick_delay) -> bool
```
### set_legato

```ruby
instance.set_legato(Integer ch, Integer legato, ?Integer tick_delay) -> bool
```
### set_lfo

```ruby
instance.set_lfo(Integer ch, Integer depth, Integer rate, ?Integer tick_delay) -> bool
```
### set_pan

```ruby
instance.set_pan(Integer ch, Integer pan, ?Integer tick_delay) -> bool
```
### set_timbre

```ruby
instance.set_timbre(Integer ch, Integer timbre_index, ?Integer tick_delay) -> bool
```
