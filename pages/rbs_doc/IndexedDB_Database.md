---
title: class IndexedDB::Database
keywords: IndexedDB::Database
tags: [class]
summary: IndexedDB::Database class of PicoRuby
sidebar: picoruby_sidebar
permalink: IndexedDB_Database.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
IndexedDB::Database.new(untyped js_db, name: String, upgrading: bool) -> void
```
## Instance methods
### batch

```ruby
instance.batch(String | Array[String] store_names, ?mode: Symbol | String) { (Batch) -> void } -> nil
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
instance.create_store(String name, ?key_path: String?, ?auto_increment: bool) -> Store
```
### delete_store

```ruby
instance.delete_store(String name) -> nil
```
### has_store?

```ruby
instance.has_store?(String name) -> bool
```
### js_db

```ruby
instance.js_db() -> untyped
```
### mark_upgrade_done

```ruby
instance.mark_upgrade_done() -> void
```
### store

```ruby
instance.store(String name) -> Store
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
## Attr accessors
### name (reader)
```ruby
instance.name -> String
```
