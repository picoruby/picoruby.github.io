---
title: module VRAM::Delegatable
keywords: VRAM::Delegatable
tags: [module]
summary: VRAM::Delegatable module of PicoRuby
sidebar: picoruby_sidebar
permalink: VRAM_Delegatable.html
folder: rbs_doc
---
## Instance methods
### draw_bitmap

```ruby
instance.draw_bitmap(x: Integer, y: Integer, w: Integer, h: Integer, data: Array[Integer]) -> nil
```
### draw_bytes

```ruby
instance.draw_bytes(x: Integer, y: Integer, w: Integer, h: Integer, data: String) -> nil
```
### draw_line

```ruby
instance.draw_line(Integer x0, Integer y0, Integer x1, Integer y1, ?Integer color) -> nil
```
### draw_rect

```ruby
instance.draw_rect(Integer x, Integer y, Integer w, Integer h, ?Integer color, ?bool fill) -> nil
```
### set_pixel

```ruby
instance.set_pixel(Integer x, Integer y, ?Integer color) -> void
```
