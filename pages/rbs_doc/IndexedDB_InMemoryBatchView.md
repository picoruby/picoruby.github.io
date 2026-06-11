---
title: class IndexedDB::InMemoryBatchView
keywords: IndexedDB::InMemoryBatchView
tags: [class]
summary: IndexedDB::InMemoryBatchView class of PicoRuby
sidebar: picoruby_sidebar
permalink: IndexedDB_InMemoryBatchView.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
IndexedDB::InMemoryBatchView.new(InMemoryDatabase database, String name) -> void
```
## Instance methods
### add

```ruby
instance.add(untyped value, ?key: untyped?) -> nil
```
### clear

```ruby
instance.clear() -> nil
```
### count

```ruby
instance.count(?untyped? key_or_range) -> Integer
```
### delete

```ruby
instance.delete(untyped key) -> nil
```
### each

```ruby
instance.each(*untyped) -> untyped
```
### get

```ruby
instance.get(untyped key) -> untyped
```
### index

```ruby
instance.index(untyped name) -> untyped
```
### keys

```ruby
instance.keys(?untyped? range) -> Array[untyped]
```
### put

```ruby
instance.put(untyped value, ?key: untyped?) -> nil
```
### to_a

```ruby
instance.to_a(?untyped? range) -> Array[untyped]
```
## Attr accessors
### name (reader)
```ruby
instance.name -> String
```
