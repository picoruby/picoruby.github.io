---
title: Task
keywords: Task
tags: [class]
summary: Task class of PicoRuby
sidebar: picoruby_sidebar
permalink: Task.html
folder: rbs_doc
---
## Singleton methods
### list

```ruby
Task.list() -> Array[Task]
```
### new

```ruby
Task.new(*untyped) { (*untyped) -> void } -> instance
```
## Instance methods
### join

```ruby
instance.join(?Integer|nil) -> (self | nil)
```
### name=

```ruby
instance.name=(String) -> String
```
### suspend

```ruby
instance.suspend() -> self
```
### terminate

```ruby
instance.terminate() -> self
```
## Attr accessors
### name (reader)
```ruby
instance.name -> String | nil
```
