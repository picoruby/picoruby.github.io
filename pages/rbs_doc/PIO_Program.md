---
title: class PIO::Program
keywords: PIO::Program
tags: [class]
summary: PIO::Program class of PicoRuby
sidebar: picoruby_sidebar
permalink: PIO_Program.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
PIO::Program.new(Array[Integer] instructions, Integer side_set_count, bool side_set_optional, Integer wrap_target_idx, Integer wrap_idx) -> void
```
## Instance methods
### length

```ruby
instance.length() -> Integer
```
## Attr accessors
### instructions (reader)
```ruby
instance.instructions -> Array[Integer]
```
### side_set_count (reader)
```ruby
instance.side_set_count -> Integer
```
### side_set_optional (reader)
```ruby
instance.side_set_optional -> bool
```
### wrap_target_idx (reader)
```ruby
instance.wrap_target_idx -> Integer
```
### wrap_idx (reader)
```ruby
instance.wrap_idx -> Integer
```
