---
title: class Shell::Pipeline
keywords: Shell::Pipeline
tags: [class]
summary: Shell::Pipeline class of PicoRuby
sidebar: picoruby_sidebar
permalink: Shell_Pipeline.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Shell::Pipeline.new(Array[Array[String]] commands) -> void
```
### parse

```ruby
Shell::Pipeline.parse(String command_line) -> Array[Array[String]]
```
## Instance methods
### exec

```ruby
instance.exec() -> void
```
### execute_with_redirect

```ruby
instance.execute_with_redirect(Array[String] cmd_args, PipeIO? input, PipeIO? output) -> void
```
