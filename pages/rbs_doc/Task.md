---
title: Task
sidebar: picoruby_sidebar
permalink: Task.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Task.new(*untyped) { (*untyped) -> void } -> void
```
### list

```ruby
Task.list() -> Array[Task]
```
## Instance methods
### _start

```ruby
_start() -> void
```
### join

```ruby
join(?Integer|nil) -> (self | nil)
```
### name=

```ruby
name=(String) -> String
```
### suspend

```ruby
suspend() -> self
```
### terminate

```ruby
terminate() -> self
```
## Attr accessors
### name (reader)
```ruby
String | nil
```
