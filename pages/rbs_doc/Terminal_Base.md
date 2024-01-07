---
title: Terminal::Base
sidebar: picoruby_sidebar
permalink: Terminal_Base.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Terminal::Base.new-> void
```
## Instance methods
### clear

```ruby
clear-> untyped
```
### debug

```ruby
debug(untyped text) -> Integer?
```
### home

```ruby
home-> untyped
```
### next_head

```ruby
next_head-> untyped
```
### physical_line_count

```ruby
physical_line_count-> Integer
```
### system

```ruby
system(untyped command) -> Integer
```
## Attr accessors
### width (reader)
```ruby
Integer
```
### height (reader)
```ruby
Integer
```
### debug_tty (accessor)
```ruby
String?
```
