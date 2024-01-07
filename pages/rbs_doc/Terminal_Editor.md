---
title: Terminal::Editor
sidebar: picoruby_sidebar
permalink: Terminal_Editor.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Terminal::Editor.new-> void
```
## Instance methods
### calculate_visual_cursor

```ruby
calculate_visual_cursor-> void
```
### load_file_into_buffer

```ruby
load_file_into_buffer(untyped filepath) -> bool
```
### refresh

```ruby
refresh-> void
```
### refresh_cursor

```ruby
refresh_cursor() { (self) -> void } -> void
```
### refresh_footer

```ruby
refresh_footer() { (self) -> void } -> void
```
### save_file_from_buffer

```ruby
save_file_from_buffer(untyped filepath) -> String
```
### show_cursor

```ruby
show_cursor-> untyped
```
### start

```ruby
start() { (self, Terminal::Buffer, Integer) -> void }  -> void
```
## Attr accessors
### footer_height (accessor)
```ruby
Integer
```
### quit_by_ctrl_c (accessor)
```ruby
bool
```
