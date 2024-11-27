---
title: class Editor::Base
keywords: Editor::Base
tags: [class]
summary: Editor::Base class of PicoRuby
sidebar: picoruby_sidebar
permalink: Editor_Base.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Editor::Base.new-> void
```
## Instance methods
### clear

```ruby
instance.clear() -> void
```
### clear_buffer

```ruby
instance.clear_buffer() -> void
```
### debug

```ruby
instance.debug(untyped text) -> Integer?
```
### dump_buffer

```ruby
instance.dump_buffer() -> String
```
### home

```ruby
instance.home() -> void
```
### next_head

```ruby
instance.next_head() -> void
```
### physical_line_count

```ruby
instance.physical_line_count() -> Integer
```
### put_buffer

```ruby
instance.put_buffer(String | Symbol chr) -> void
```
### system

```ruby
instance.system(untyped command) -> Integer
```
## Attr accessors
### width (reader)
```ruby
instance.width -> Integer
```
### height (reader)
```ruby
instance.height -> Integer
```
### debug_tty (accessor)
```ruby
instance.debug_tty -> String?
```
