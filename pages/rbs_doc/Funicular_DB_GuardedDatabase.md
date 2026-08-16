---
title: class Funicular::DB::GuardedDatabase
keywords: Funicular::DB::GuardedDatabase
tags: [class]
summary: Funicular::DB::GuardedDatabase class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_DB_GuardedDatabase.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::DB::GuardedDatabase.new(untyped db, ?Symbol role, ?bool read_only) -> void
```
## Instance methods
### __become_read_only

```ruby
instance.__become_read_only() -> void
```
### commit

```ruby
instance.commit() -> bool
```
### execute

```ruby
instance.execute(String sql, ?Array[untyped] bind_vars) ?{ (untyped row) -> void } -> untyped
```
### get_first_row

```ruby
instance.get_first_row(String sql, ?Array[untyped] bind_vars) -> untyped
```
### get_first_value

```ruby
instance.get_first_value(String sql, ?Array[untyped] bind_vars) -> untyped
```
### prepare

```ruby
instance.prepare(String sql) ?{ (GuardedStatement stmt) -> untyped } -> untyped
```
### query

```ruby
instance.query(String sql, ?Array[untyped] bind_vars) ?{ (GuardedResultSet result) -> untyped } -> untyped
```
### read_only?

```ruby
instance.read_only?() -> bool
```
### role

```ruby
instance.role() -> Symbol
```
### rollback

```ruby
instance.rollback() -> bool
```
### transaction

```ruby
instance.transaction(?Symbol mode) ?{ (GuardedDatabase proxy) -> untyped } -> untyped
```
