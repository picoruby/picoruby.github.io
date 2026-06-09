---
title: class IndexedDB::InMemoryIndex
keywords: IndexedDB::InMemoryIndex
tags: [class]
summary: IndexedDB::InMemoryIndex class of PicoRuby
sidebar: picoruby_sidebar
permalink: IndexedDB_InMemoryIndex.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
IndexedDB::InMemoryIndex.new(InMemoryStore store, String name) -> void
```
## Instance methods
### each

```ruby
instance.each() ?{ ([untyped, untyped]) -> void } -> (Enumerator[[untyped, untyped], void] | void)
```
### get

```ruby
instance.get(untyped key) -> untyped
```
### to_a

```ruby
instance.to_a() -> Array[untyped]
```
## Attr accessors
### name (reader)
```ruby
instance.name -> String
```
