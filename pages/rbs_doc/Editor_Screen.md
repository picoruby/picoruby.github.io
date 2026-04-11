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
Editor::Screen.new() -> void
```
## Instance methods
### calculate_visual_cursor

```ruby
instance.calculate_visual_cursor-> void
```
### dirty_to_mode

```ruby
instance.dirty_to_mode(Symbol dirty) -> Symbol
```
### highlighted_segment

```ruby
instance.highlighted_segment(String line, Integer lineno, Integer start_col, Integer max_width) -> String
```
### load_file_into_buffer

```ruby
instance.load_file_into_buffer(untyped filepath) -> bool
```
### refresh

```ruby
instance.refresh-> void
```
### refresh_current_line

```ruby
instance.refresh_current_line-> void
```
### refresh_cursor

```ruby
instance.refresh_cursor() { (self) -> void } -> void
```
### refresh_cursor_and_footer

```ruby
instance.refresh_cursor_and_footer-> void
```
### refresh_footer

```ruby
instance.refresh_footer() { (self) -> void } -> void
```
### refresh_footer_only

```ruby
instance.refresh_footer_only-> void
```
### save_file_from_buffer

```ruby
instance.save_file_from_buffer(untyped filepath) -> String
```
### show_cursor

```ruby
instance.show_cursor-> untyped
```
### smart_refresh

```ruby
instance.smart_refresh-> void
```
### start

```ruby
instance.start() { (self, Editor::Buffer, Integer, String?) -> void }  -> void
```
### update_cursor_line_wraps

```ruby
instance.update_cursor_line_wraps-> void
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
### redraw_mode (accessor)
```ruby
instance.redraw_mode -> Symbol?
```
