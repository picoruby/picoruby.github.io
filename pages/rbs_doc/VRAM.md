---
title: class VRAM
keywords: VRAM
tags: [class]
summary: VRAM class of PicoRuby
sidebar: picoruby_sidebar
permalink: VRAM.html
folder: rbs_doc
---
## Type aliases
### page_t
```ruby
[Integer, Integer, String]
```
## Singleton methods
### new

```ruby
VRAM.new(w: Integer, h: Integer, cols: Integer, rows: Integer) -> void
```
## Instance methods
### dirty_pages

```ruby
instance.dirty_pages(?bool clear_dirty) -> Array[page_t]
```
### draw_bitmap

```ruby
instance.draw_bitmap(x: Integer, y: Integer, w: Integer, h: Integer, data: Array[Integer]) -> self
```
### draw_bytes

```ruby
instance.draw_bytes(x: Integer, y: Integer, w: Integer, h: Integer, data: String) -> self
```
### draw_line

```ruby
instance.draw_line(Integer x0, Integer y0, Integer x1, Integer y1, Integer color) -> self
```
### draw_rect

```ruby
instance.draw_rect(Integer x, Integer y, Integer w, Integer h, Integer color) -> self
```
### erase

```ruby
instance.erase(Integer x, Integer y, Integer w, Integer h) -> self
```
### fill

```ruby
instance.fill(Integer color) -> self
```
### pages

```ruby
instance.pages(?bool clear_dirty) -> Array[page_t]
```
### set_pixel

```ruby
instance.set_pixel(Integer x, Integer y, Integer color) -> self
```
## Attr accessors
### name (accessor)
```ruby
instance.name -> String
```
