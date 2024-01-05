---
title: SQLite3::Database
sidebar: picoruby_sidebar
permalink: SQLite3_Database.html
folder: rbs_doc
---
## Type aliases
### row_t
```ruby
Hash[String, String] | Array[String]
```
## Singleton methods
### _open

```ruby
SQLite3::Database._open(String filename) -> SQLite3::Database
```
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
close-> void
```
### closed?

```ruby
closed?-> bool
```
### execute

```ruby
execute(String sql, ?Array[var_t] bind_vars) -> Array[Array[var_t] | Hash[String, var_t]]
execute(String sql, ?Array[var_t] bind_vars) { (Array[var_t])        -> Array[var_t]        } -> nil
execute(String sql, ?Array[var_t] bind_vars) { (Hash[String, var_t]) -> Hash[String, var_t] } -> nil
execute(String sql, ?Array[var_t] bind_vars) { (untyped) -> untyped } -> nil
```
### prepare

```ruby
prepare(String sql) { (SQLite3::Statement) -> untyped } -> nil
prepare(String sql) -> SQLite3::Statement
```
