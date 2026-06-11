---
title: class IndexedDB::Batch::StoreView
keywords: IndexedDB::Batch::StoreView
tags: [class]
summary: IndexedDB::Batch::StoreView class of PicoRuby
sidebar: picoruby_sidebar
permalink: IndexedDB_Batch_StoreView.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
IndexedDB::Batch::StoreView.new(untyped js_store, String name) -> void
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
