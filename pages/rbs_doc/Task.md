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
### stat

```ruby
Task.stat() -> String
```
## Singleton methods
### create

```ruby
Task.create(String) -> Task
```
### current

```ruby
Task.current() -> Task
```
### get

```ruby
Task.get(String) -> Task
```
### list

```ruby
Task.list() -> Array[Task]
```
### name=

```ruby
Task.name=(String) -> String
```
### name_list

```ruby
Task.name_list() -> Array[String]
```
### pass

```ruby
Task.pass() -> Task
```
### priority=

```ruby
Task.priority=(Integer) -> Task
```
### status

```ruby
Task.status() -> Task
```
### suspend

```ruby
Task.suspend() -> Task
```
### terminate

```ruby
Task.terminate() -> Task
```
## Instance methods
### join

```ruby
instance.join() -> void
```
### name

```ruby
instance.name() -> String
```
### name=

```ruby
instance.name=(String) -> self
```
### priority=

```ruby
instance.priority=(Integer) -> self
```
### resume

```ruby
instance.resume() -> self
```
### rewind

```ruby
instance.rewind() -> self
```
### run

```ruby
instance.run() -> void
```
### status

```ruby
instance.status() -> String
```
### suspend

```ruby
instance.suspend() -> void
```
### terminate

```ruby
instance.terminate() -> self
```
