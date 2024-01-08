---
title: SQLite3::Database
sidebar: picoruby_sidebar
permalink: SQLite3_Database.html
folder: rbs_doc
---
## Type aliases
### sqlite3_row_t
```ruby
Hash[String, String] | Array[String]
```
## Singleton methods
### new

```ruby
SQLite3::Database.new(String filename, ?results_as_hash: bool) ?{ (SQLite3::Database) -> void } -> SQLite3::Database
```
### open

```ruby
SQLite3::Database.open(String filename) ?{ (SQLite3::Database) -> void } -> SQLite3::Database
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
### execute

```ruby
instance.execute(String sql, ?Array[sqlite3_var_t] bind_vars) -> Array[Array[sqlite3_var_t] | Hash[String, sqlite3_var_t]]
instance.execute(String sql, ?Array[sqlite3_var_t] bind_vars) { (Array[sqlite3_var_t])        -> Array[sqlite3_var_t]        } -> nil
instance.execute(String sql, ?Array[sqlite3_var_t] bind_vars) { (Hash[String, sqlite3_var_t]) -> Hash[String, sqlite3_var_t] } -> nil
instance.execute(String sql, ?Array[sqlite3_var_t] bind_vars) { (untyped) -> untyped } -> nil
```
### prepare

```ruby
instance.prepare(String sql) { (SQLite3::Statement) -> untyped } -> nil
instance.prepare(String sql) -> SQLite3::Statement
```
## Attr accessors
### results_as_hash (accessor)
```ruby
instance.results_as_hash -> bool
```
