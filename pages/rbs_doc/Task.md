---
title: class Task
keywords: Task
tags: [class]
summary: Task class of PicoRuby
sidebar: picoruby_sidebar
permalink: Task.html
folder: rbs_doc
---
## Singleton methods
### current

```ruby
Task.current() -> Task
```
### get

```ruby
Task.get(String name) -> Task?
```
### list

```ruby
Task.list() -> Array[Task]
```
### new

```ruby
Task.new(?name: String, ?priority: Integer) {() -> void} -> Task
```
### pass

```ruby
Task.pass() -> nil
```
### pp_status

```ruby
Task.pp_status() -> void
```
### stat

```ruby
Task.stat() -> Task::Stat
```
## Instance methods
### join

```ruby
instance.join() -> self
```
### name

```ruby
instance.name() -> (String | nil)
```
### name=

```ruby
instance.name=(String name) -> String
```
### priority

```ruby
instance.priority() -> Integer
```
### priority=

```ruby
instance.priority=(Integer priority) -> Integer
```
### resume

```ruby
instance.resume() -> self
```
### status

```ruby
instance.status() -> Symbol
```
### suspend

```ruby
instance.suspend() -> self
```
### terminate

```ruby
instance.terminate() -> self
```
## Singleton methods
### name_list

```ruby
Task.name_list() -> Array[String]
```
## Instance methods
### rewind

```ruby
instance.rewind() -> self
```
### run

```ruby
instance.run() -> void
```
