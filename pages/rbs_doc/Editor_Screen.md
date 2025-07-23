---
title: class Editor::Screen
keywords: Editor::Screen
tags: [class]
summary: Editor::Screen class of PicoRuby
sidebar: picoruby_sidebar
permalink: Editor_Screen.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Editor::Screen.new-> void
```
## Instance methods
### calculate_visual_cursor

```ruby
instance.calculate_visual_cursor-> void
```
### load_file_into_buffer

```ruby
instance.load_file_into_buffer(untyped filepath) -> bool
```
### refresh

```ruby
instance.refresh-> void
```
### refresh_cursor

```ruby
instance.refresh_cursor() { (self) -> void } -> void
```
### refresh_footer

```ruby
instance.refresh_footer() { (self) -> void } -> void
```
### save_file_from_buffer

```ruby
instance.save_file_from_buffer(untyped filepath) -> String
```
### show_cursor

```ruby
instance.show_cursor-> untyped
```
### start

```ruby
instance.start() { (self, Editor::Buffer, Integer) -> void }  -> void
```
## Attr accessors
### footer_height (accessor)
```ruby
instance.footer_height -> Integer
```
### quit_by_sigint (accessor)
```ruby
instance.quit_by_sigint -> bool
```
