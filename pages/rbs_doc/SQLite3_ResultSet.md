---
title: SQLite3::ResultSet
sidebar: picoruby_sidebar
permalink: SQLite3_ResultSet.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
SQLite3::ResultSet.new(SQLite3::Database, SQLite3::Statement) -> instance
```
## Instance methods
### each

```ruby
instance.each() { (Array[sqlite3_var_t] | Hash[String, sqlite3_var_t]) -> void } -> nil
```
### next

```ruby
instance.next() -> (Array[sqlite3_var_t] | Hash[String, sqlite3_var_t] | nil)
```
### to_a

```ruby
instance.to_a() -> Array[Array[sqlite3_var_t]]
```
