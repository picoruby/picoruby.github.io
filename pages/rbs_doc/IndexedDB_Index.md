---
title: class IndexedDB::Index
keywords: IndexedDB::Index
tags: [class]
summary: IndexedDB::Index class of PicoRuby
sidebar: picoruby_sidebar
permalink: IndexedDB_Index.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
IndexedDB::Index.new(Store store, String name) -> void
```
## Instance methods
### count

```ruby
instance.count(?untyped? key_or_range) -> Integer
```
### each

```ruby
instance.each(?untyped? range, ?direction: Symbol) ?{ ([untyped, untyped]) -> void } -> (Enumerator[[untyped, untyped], void] | void)
```
### get

```ruby
instance.get(untyped key) -> untyped
```
### get_all

```ruby
instance.get_all(?untyped? key_or_range, ?count: Integer?) -> Array[untyped]
```
### keys

```ruby
instance.keys(?untyped? range) -> Array[untyped]
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
