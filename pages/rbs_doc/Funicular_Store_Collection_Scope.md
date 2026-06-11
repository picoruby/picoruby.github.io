---
title: class Funicular::Store::Collection::Scope
keywords: Funicular::Store::Collection::Scope
tags: [class]
summary: Funicular::Store::Collection::Scope class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Store_Collection_Scope.html
folder: rbs_doc
---
## Instance methods
### all

```ruby
instance.all() -> Array[untyped]
```
### append

```ruby
instance.append(untyped item) -> Array[untyped]
```
### clear

```ruby
instance.clear() -> nil
```
### expired?

```ruby
instance.expired?() -> bool
```
### last

```ruby
instance.last() -> untyped
```
### last_id

```ruby
instance.last_id() -> untyped
```
### remove

```ruby
instance.remove(untyped id) -> Array[untyped]
```
### replace

```ruby
instance.replace(untyped arr) -> Array[untyped]
```
### same_tail?

```ruby
instance.same_tail?(untyped other) -> bool
```
### size

```ruby
instance.size() -> Integer
```
## Attr accessors
### store_class (reader)
```ruby
instance.store_class -> singleton(Funicular::Store::Collection)
```
