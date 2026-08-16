---
title: class SQLite3::Database
keywords: SQLite3::Database
tags: [class]
summary: SQLite3::Database class of PicoRuby
sidebar: picoruby_sidebar
permalink: SQLite3_Database.html
folder: rbs_doc
---
## Include
[Pragmas](Pragmas.html)
## Type aliases
### sqlite3_row_t
```ruby
Hash[String, String] | Array[String]
```
## Singleton methods
### __store

```ruby
SQLite3::Database.__store() -> untyped
```
### new

```ruby
SQLite3::Database.new(String filename, ?results_as_hash: bool) ?{ (SQLite3::Database) -> void } -> void
```
### open

```ruby
SQLite3::Database.open(String filename) ?{ (SQLite3::Database) -> void } -> SQLite3::Database
```
## Instance methods
### _restore_from_store

```ruby
instance._restore_from_store(String name) -> SQLite3::Database
```
### backup

```ruby
instance.backup(SQLite3::Database dst, ?srcname: String, ?dstname: String) -> bool
```
### changes

```ruby
instance.changes() -> Integer
```
### close

```ruby
instance.close() -> void
```
### closed?

```ruby
instance.closed?() -> bool
```
### commit

```ruby
instance.commit() -> bool
```
### deserialize

```ruby
instance.deserialize(String bytes) -> SQLite3::Database
```
### execute

```ruby
instance.execute(String sql, ?Array[sqlite3_bind_t] bind_vars) -> Array[Array[sqlite3_var_t] | Hash[String, sqlite3_var_t]]
instance.execute(String sql, ?Array[sqlite3_bind_t] bind_vars) { (Array[sqlite3_var_t])        -> Array[sqlite3_var_t]        } -> nil
instance.execute(String sql, ?Array[sqlite3_bind_t] bind_vars) { (Hash[String, sqlite3_var_t]) -> Hash[String, sqlite3_var_t] } -> nil
instance.execute(String sql, ?Array[sqlite3_bind_t] bind_vars) { (untyped) -> untyped } -> nil
```
### execute_batch

```ruby
instance.execute_batch(String sql) -> nil
```
### filename

```ruby
instance.filename() -> String?
```
### get_first_row

```ruby
instance.get_first_row(String sql, ?Array[sqlite3_bind_t] bind_vars) -> (Array[sqlite3_var_t] | Hash[String, sqlite3_var_t])?
```
### get_first_value

```ruby
instance.get_first_value(String sql, ?Array[sqlite3_bind_t] bind_vars) -> sqlite3_var_t
```
### last_insert_row_id

```ruby
instance.last_insert_row_id() -> Integer
```
### persist

```ruby
instance.persist() -> bool
```
### prepare

```ruby
instance.prepare(String sql) { (SQLite3::Statement) -> untyped } -> nil
instance.prepare(String sql) -> SQLite3::Statement
```
### query

```ruby
instance.query(String sql, ?Array[sqlite3_bind_t] bind_vars) -> SQLite3::ResultSet
instance.query(String sql, ?Array[sqlite3_bind_t] bind_vars) { (SQLite3::ResultSet) -> untyped } -> untyped
```
### readonly?

```ruby
instance.readonly?() -> bool
```
### rollback

```ruby
instance.rollback() -> bool
```
### serialize

```ruby
instance.serialize() -> String
```
### total_changes

```ruby
instance.total_changes() -> Integer
```
### transaction

```ruby
instance.transaction(?Symbol mode) -> bool
instance.transaction(?Symbol mode) { (SQLite3::Database) -> untyped } -> untyped
```
### transaction_active?

```ruby
instance.transaction_active?() -> bool
```
## Attr accessors
### results_as_hash (accessor)
```ruby
instance.results_as_hash -> bool
```
