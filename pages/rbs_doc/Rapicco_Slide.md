---
title: class Rapicco::Slide
keywords: Rapicco::Slide
tags: [class]
summary: Rapicco::Slide class of PicoRuby
sidebar: picoruby_sidebar
permalink: Rapicco_Slide.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Rapicco::Slide.new(?usakame_h: Integer, ?colors: Hash[Symbol, String]|nil) -> void
```
## Instance methods
### get_screen_size

```ruby
instance.get_screen_size() -> void
```
### render_slide

```ruby
instance.render_slide(parser_dump_t lines) -> void
```
### render_sprite

```ruby
instance.render_sprite(Sprite sprite) -> void
```
## Attr accessors
### page_h (reader)
```ruby
instance.page_h -> Integer
```
### page_w (reader)
```ruby
instance.page_w -> Integer
```
### bullet (accessor)
```ruby
instance.bullet -> Sprite
```
### code_indent (accessor)
```ruby
instance.code_indent -> Integer
```
### line_margin (accessor)
```ruby
instance.line_margin -> Integer
```
