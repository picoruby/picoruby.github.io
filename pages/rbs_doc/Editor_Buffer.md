---
title: class Editor::Buffer
keywords: Editor::Buffer
tags: [class]
summary: Editor::Buffer class of PicoRuby
sidebar: picoruby_sidebar
permalink: Editor_Buffer.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Editor::Buffer.new() -> instance
```
## Instance methods
### bottom

```ruby
instance.bottom() -> void
```
### clear

```ruby
instance.clear() -> void
```
### clear_dirty

```ruby
instance.clear_dirty() -> void
```
### clear_selection

```ruby
instance.clear_selection() -> void
```
### current_char

```ruby
instance.current_char() -> String?
```
### current_line

```ruby
instance.current_line() -> String
```
### current_tail

```ruby
instance.current_tail(?Integer n) -> String
```
### delete

```ruby
instance.delete() -> void
```
### delete_line

```ruby
instance.delete_line() -> (String | nil)
```
### delete_selected_text

```ruby
instance.delete_selected_text() -> (String | nil)
```
### down

```ruby
instance.down() -> void
```
### dump

```ruby
instance.dump() -> String
```
### empty?

```ruby
instance.empty?() -> bool
```
### has_selection?

```ruby
instance.has_selection?() -> bool
```
### head

```ruby
instance.head() -> void
```
### home

```ruby
instance.home() -> void
```
### insert_line

```ruby
instance.insert_line(String | nil line) -> void
```
### insert_lines_below

```ruby
instance.insert_lines_below(Array[String] | nil lines_to_insert) -> void
```
### insert_string_after_cursor

```ruby
instance.insert_string_after_cursor(String | nil str) -> void
```
### left

```ruby
instance.left() -> void
```
### mark_dirty

```ruby
instance.mark_dirty(Symbol level) -> void
```
### move_to

```ruby
instance.move_to(Integer x, Integer y) -> void
```
### put

```ruby
instance.put(String | Symbol c) -> void
```
### replace_char

```ruby
instance.replace_char(String ch) -> void
```
### right

```ruby
instance.right() -> void
```
### selected_text

```ruby
instance.selected_text() -> (String | nil)
```
### selection_range

```ruby
instance.selection_range() -> ([Integer, Integer, Integer, Integer] | nil)
```
### start_selection

```ruby
instance.start_selection(Symbol mode) -> void
```
### tail

```ruby
instance.tail() -> void
```
### up

```ruby
instance.up() -> void
```
### word_backward

```ruby
instance.word_backward() -> void
```
### word_char?

```ruby
instance.word_char?(String? ch) -> bool
```
### word_end

```ruby
instance.word_end() -> void
```
### word_forward

```ruby
instance.word_forward() -> void
```
## Attr accessors
### lines (accessor)
```ruby
instance.lines -> Array[String]
```
### changed (accessor)
```ruby
instance.changed -> bool
```
### cursor_x (reader)
```ruby
instance.cursor_x -> Integer
```
### cursor_y (reader)
```ruby
instance.cursor_y -> Integer
```
### dirty (reader)
```ruby
instance.dirty -> Symbol
```
### selection_start_x (reader)
```ruby
instance.selection_start_x -> Integer?
```
### selection_start_y (reader)
```ruby
instance.selection_start_y -> Integer?
```
### selection_mode (reader)
```ruby
instance.selection_mode -> Symbol?
```
