---
title: class Vim
keywords: Vim
tags: [class]
summary: Vim class of PicoRuby
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
instance.exec_command(Editor::Buffer buffer) -> (:quit | String | nil)
```
### save_file

```ruby
instance.save_file-> String
```
### start

```ruby
instance.start-> void
```
