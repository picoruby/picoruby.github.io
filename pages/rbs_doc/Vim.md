---
title: class Vim
keywords: Vim
tags: [class]
summary: Vim class of PicoRuby
sidebar: picoruby_sidebar
permalink: Vim.html
folder: rbs_doc
---
## Type aliases
### mode_t
```ruby
:command | :insert | :normal | :visual | :visual_line | :visual_block | :cut
```
## Singleton methods
### new

```ruby
Vim.new(String | nil filepath) -> instance
```
## Instance methods
### clear_command_buffer

```ruby
instance.clear_command_buffer() -> void
```
### exec_command

```ruby
instance.exec_command(Editor::Buffer buffer) -> (:quit | String | nil)
```
### save_file

```ruby
instance.save_file() -> String
```
### start

```ruby
instance.start() -> void
```
