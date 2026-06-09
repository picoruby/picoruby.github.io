---
title: class IndexedDB::InMemoryStore
keywords: IndexedDB::InMemoryStore
tags: [class]
summary: IndexedDB::InMemoryStore class of PicoRuby
sidebar: picoruby_sidebar
permalink: IndexedDB_InMemoryStore.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
IndexedDB::InMemoryStore.new(InMemoryDatabase database, String name, ?upgrading: bool) -> void
```
## Instance methods
### clear

```ruby
instance.clear() -> nil
```
### count

```ruby
instance.count(?untyped? key_or_range) -> Integer
```
### create_index

```ruby
instance.create_index(String index_name, String key_path, ?unique: bool, ?multi_entry: bool) -> nil
```
### data

```ruby
instance.data() -> Hash[untyped, untyped]
```
### delete

```ruby
instance.delete(untyped key) -> nil
```
### delete_index

```ruby
instance.delete_index(String index_name) -> nil
```
### each

```ruby
instance.each(?untyped? range, ?direction: Symbol) ?{ ([untyped, untyped]) -> void } -> (Enumerator[[untyped, untyped], void] | void)
```
### get

```ruby
instance.get(untyped key) -> untyped
```
### index

```ruby
instance.index(String index_name) -> InMemoryIndex
```
### index_names

```ruby
instance.index_names() -> Array[String]
```
### keys

```ruby
instance.keys(?untyped? range) -> Array[untyped]
```
### meta

```ruby
instance.meta() -> Hash[Symbol, untyped]
```
### put

```ruby
instance.put(untyped value, ?key: untyped?) -> untyped
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
