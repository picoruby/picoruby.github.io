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
### create

```ruby
Task.create(String bytecode) -> Task
```
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
### tick

```ruby
Task.tick() -> Integer
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
### run

```ruby
instance.run() -> self
```
### status

```ruby
instance.status() -> String
```
### suspend

```ruby
instance.suspend() -> self
```
### terminate

```ruby
instance.terminate() -> self
```
