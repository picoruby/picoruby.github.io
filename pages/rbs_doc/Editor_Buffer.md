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
### down

```ruby
instance.down() -> void
```
### dump

```ruby
instance.dump() -> String
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
### left

```ruby
instance.left() -> void
```
### put

```ruby
instance.put(String | Symbol c) -> void
```
### right

```ruby
instance.right() -> void
```
### tail

```ruby
instance.tail() -> void
```
### up

```ruby
instance.up() -> void
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
