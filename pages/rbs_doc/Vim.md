---
title: Vim
sidebar: picoruby_sidebar
permalink: Vim.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Vim.new(String filepath) -> instance
```
## Instance methods
### exec_command

```ruby
instance.exec_command(Terminal::Buffer buffer) -> (:quit | String | nil)
```
### save_file

```ruby
instance.save_file-> String
```
### start

```ruby
instance.start-> void
```
