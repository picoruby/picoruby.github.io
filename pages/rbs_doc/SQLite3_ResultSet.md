---
title: class SQLite3::ResultSet
keywords: SQLite3::ResultSet
tags: [class]
summary: SQLite3::ResultSet class of PicoRuby
sidebar: picoruby_sidebar
permalink: SQLite3_ResultSet.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
SQLite3::ResultSet.new(SQLite3::Database db, SQLite3::Statement stmt) -> void
```
## Instance methods
### close

```ruby
instance.close() -> void
```
### closed?

```ruby
instance.closed?() -> bool
```
### columns

```ruby
instance.columns() -> Array[String]
```
### each

```ruby
instance.each() { (Array[sqlite3_var_t] | Hash[String, sqlite3_var_t]) -> void } -> nil
```
### eof?

```ruby
instance.eof?() -> bool
```
### next

```ruby
instance.next() -> (Array[sqlite3_var_t] | Hash[String, sqlite3_var_t] | nil)
```
### reset

```ruby
instance.reset(*untyped bind_params) -> void
```
### to_a

```ruby
instance.to_a() -> Array[Array[sqlite3_var_t]]
```
### types

```ruby
instance.types() -> Array[String]
```
