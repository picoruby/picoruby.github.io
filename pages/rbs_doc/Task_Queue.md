---
title: class Task::Queue
keywords: Task::Queue
tags: [class]
summary: Task::Queue class of PicoRuby
sidebar: picoruby_sidebar
permalink: Task_Queue.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Task::Queue.new() -> Task::Queue
```
## Instance methods
### clear

```ruby
instance.clear() -> self
```
### close

```ruby
instance.close() -> self
```
### closed?

```ruby
instance.closed?() -> bool
```
### empty?

```ruby
instance.empty?() -> bool
```
### num_waiting

```ruby
instance.num_waiting() -> Integer
```
### pop

```ruby
instance.pop(?bool non_block) -> untyped
```
### push

```ruby
instance.push(untyped obj) -> self
```
### size

```ruby
instance.size() -> Integer
```
