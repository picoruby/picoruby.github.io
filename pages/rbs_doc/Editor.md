---
title: module Editor
keywords: Editor
tags: [module]
summary: Editor module of PicoRuby
sidebar: picoruby_sidebar
permalink: Editor.html
folder: rbs_doc
---
## Singleton methods
### byte_to_display_col

```ruby
Editor.byte_to_display_col(String str, Integer byte_pos) -> Integer
```
### char_at_bytepos

```ruby
Editor.char_at_bytepos(String str, Integer byte_pos) -> String?
```
### char_bytesize_at

```ruby
Editor.char_bytesize_at(String str, Integer byte_pos) -> Integer
```
### char_display_width

```ruby
Editor.char_display_width(String? ch) -> Integer
```
### display_col_to_byte

```ruby
Editor.display_col_to_byte(String str, Integer col) -> Integer
```
### display_slice

```ruby
Editor.display_slice(String str, Integer start_col, Integer max_width) -> String
```
### display_width

```ruby
Editor.display_width(String str) -> Integer
```
### get_screen_size

```ruby
Editor.get_screen_size-> [Integer, Integer]
```
### prev_char_byte_pos

```ruby
Editor.prev_char_byte_pos(String str, Integer byte_pos) -> Integer
```
### utf8_byte_length

```ruby
Editor.utf8_byte_length(Integer | nil lead_byte) -> Integer
```
