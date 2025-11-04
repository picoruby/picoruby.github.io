---
title: class RotateLogger
keywords: RotateLogger
tags: [class]
summary: RotateLogger class of PicoRuby
sidebar: picoruby_sidebar
permalink: RotateLogger.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
RotateLogger.new(dir: String, ?basename: String, ?ext: String, ?interval: Integer, ?keep_size: Integer | nil) -> void
```
## Instance methods
### flush_level=

```ruby
instance.flush_level=(Logger::level_t level) -> Integer
```
### level=

```ruby
instance.level=(Logger::level_t level) -> Integer
```
### trailing_lines=

```ruby
instance.trailing_lines=(Integer lines) -> Integer
```
