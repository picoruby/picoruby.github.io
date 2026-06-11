---
title: class IndexedDB::Batch
keywords: IndexedDB::Batch
tags: [class]
summary: IndexedDB::Batch class of PicoRuby
sidebar: picoruby_sidebar
permalink: IndexedDB_Batch.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
IndexedDB::Batch.new(Database database, Array[String] store_names, Symbol | String mode) -> void
```
## Instance methods
### []

```ruby
instance.[](String | Symbol store_name) -> StoreView
```
### await_complete

```ruby
instance.await_complete() -> nil
```
