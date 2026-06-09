---
title: class IndexedDB::InMemoryBatch
keywords: IndexedDB::InMemoryBatch
tags: [class]
summary: IndexedDB::InMemoryBatch class of PicoRuby
sidebar: picoruby_sidebar
permalink: IndexedDB_InMemoryBatch.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
IndexedDB::InMemoryBatch.new(InMemoryDatabase database, Array[String] store_names, Symbol | String mode) -> void
```
## Instance methods
### []

```ruby
instance.[](String | Symbol store_name) -> InMemoryBatchView
```
