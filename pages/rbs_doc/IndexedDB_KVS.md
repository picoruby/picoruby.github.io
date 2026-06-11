---
title: class IndexedDB::KVS
keywords: IndexedDB::KVS
tags: [class]
summary: IndexedDB::KVS class of PicoRuby
sidebar: picoruby_sidebar
permalink: IndexedDB_KVS.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
IndexedDB::KVS.new(db_like database, String store_name) -> void
```
### open

```ruby
IndexedDB::KVS.open(String name, ?store: String | Symbol, ?fallback: bool) -> KVS
```
## Instance methods
### []

```ruby
instance.[](String | Symbol key) -> untyped
```
### []=

```ruby
instance.[]=(String | Symbol key, untyped value) -> untyped
```
### clear

```ruby
instance.clear() -> nil
```
### close

```ruby
instance.close() -> void
```
### database

```ruby
instance.database() -> db_like
```
### delete

```ruby
instance.delete(String | Symbol key) -> nil
```
### each

```ruby
instance.each() ?{ ([untyped, untyped]) -> void } -> (Enumerator[[untyped, untyped], void] | void)
```
### empty?

```ruby
instance.empty?() -> bool
```
### has_key?

```ruby
instance.has_key?(String | Symbol key) -> bool
```
### keys

```ruby
instance.keys() -> Array[String]
```
### size

```ruby
instance.size() -> Integer
```
### to_h

```ruby
instance.to_h() -> Hash[String, untyped]
```
### values

```ruby
instance.values() -> Array[untyped]
```
## Attr accessors
### name (reader)
```ruby
instance.name -> String
```
