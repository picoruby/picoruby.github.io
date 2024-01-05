---
title: SQLite3::ResultSet
sidebar: picoruby_sidebar
permalink: SQLite3_ResultSet.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
SQLite3::ResultSet.new(SQLite3::Database, SQLite3::Statement) -> void
```
## Instance methods
### each

```ruby
each() { (Array[var_t] | Hash[String, var_t]) -> void } -> nil
```
### next

```ruby
next() -> (Array[var_t] | Hash[String, var_t] | nil)
```
### to_a

```ruby
to_a() -> Array[Array[var_t]]
```
