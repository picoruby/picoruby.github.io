---
title: module IndexedDB
keywords: IndexedDB
tags: [module]
summary: IndexedDB module of PicoRuby
sidebar: picoruby_sidebar
permalink: IndexedDB.html
folder: rbs_doc
---
## Type aliases
### db_like
```ruby
Database | InMemoryDatabase
```
### store_like
```ruby
Store | InMemoryStore
```
## Singleton methods
### available?

```ruby
IndexedDB.available?() -> bool
```
### open

```ruby
IndexedDB.open(String name, ?version: Integer, ?fallback: bool) ?{ (db_like, Integer, Integer) -> void } -> db_like
```
