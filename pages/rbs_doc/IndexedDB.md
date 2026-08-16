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
### __unwrap

```ruby
IndexedDB.__unwrap(untyped tagged) -> untyped
```
### available?

```ruby
IndexedDB.available?() -> bool
```
### error_for

```ruby
IndexedDB.error_for(String name, String message) -> RequestError
```
### open

```ruby
IndexedDB.open(String name, ?version: Integer, ?fallback: bool, ?blocked_timeout_ms: Integer) ?{ (db_like, Integer, Integer) -> void } -> db_like
```
