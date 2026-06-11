---
title: class IndexedDB::InMemoryDatabase
keywords: IndexedDB::InMemoryDatabase
tags: [class]
summary: IndexedDB::InMemoryDatabase class of PicoRuby
sidebar: picoruby_sidebar
permalink: IndexedDB_InMemoryDatabase.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
IndexedDB::InMemoryDatabase.new(String name, Integer version) -> void
```
### meta

```ruby
IndexedDB::InMemoryDatabase.meta() -> Hash[String, Hash[Symbol, untyped]]
```
### meta=

```ruby
IndexedDB::InMemoryDatabase.meta=(Hash[String, Hash[Symbol, untyped]]) -> Hash[String, Hash[Symbol, untyped]]
```
### open

```ruby
IndexedDB::InMemoryDatabase.open(String name, Integer version) ?{ (db_like, Integer, Integer) -> void } -> InMemoryDatabase
```
### stores

```ruby
IndexedDB::InMemoryDatabase.stores() -> Hash[[String, String], Hash[untyped, untyped]]
```
### stores=

```ruby
IndexedDB::InMemoryDatabase.stores=(Hash[[String, String], Hash[untyped, untyped]]) -> Hash[[String, String], Hash[untyped, untyped]]
```
## Instance methods
### batch

```ruby
instance.batch(String | Array[String] store_names, ?mode: Symbol | String) { (InMemoryBatch) -> void } -> nil
```
### close

```ruby
instance.close() -> void
```
### closed?

```ruby
instance.closed?() -> bool
```
### create_store

```ruby
instance.create_store(String name, ?key_path: String?, ?auto_increment: bool) -> InMemoryStore
```
### delete_store

```ruby
instance.delete_store(String name) -> nil
```
### has_store?

```ruby
instance.has_store?(String name) -> bool
```
### mark_upgrade_done

```ruby
instance.mark_upgrade_done() -> void
```
### name

```ruby
instance.name() -> String
```
### store

```ruby
instance.store(String name) -> InMemoryStore?
```
### store_data

```ruby
instance.store_data(String store_name) -> Hash[untyped, untyped]
```
### store_meta

```ruby
instance.store_meta(String store_name) -> Hash[Symbol, untyped]
```
### store_names

```ruby
instance.store_names() -> Array[String]
```
### upgrading?

```ruby
instance.upgrading?() -> bool
```
### version

```ruby
instance.version() -> Integer
```
