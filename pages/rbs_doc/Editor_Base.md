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
instance.clear-> untyped
```
### debug

```ruby
instance.debug(untyped text) -> Integer?
```
### home

```ruby
instance.home-> untyped
```
### next_head

```ruby
instance.next_head-> untyped
```
### physical_line_count

```ruby
instance.physical_line_count-> Integer
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
