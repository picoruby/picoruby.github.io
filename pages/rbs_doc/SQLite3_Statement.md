---
title: SQLite3::Statement
sidebar: picoruby_sidebar
permalink: SQLite3_Statement.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
SQLite3::Statement.new(SQLite3::Database db, String sql) -> instance
```
## Instance methods
### active?

```ruby
instance.active?-> bool
```
### bind_param

```ruby
instance.bind_param(Integer|Symbol|String key, sqlite3_var_t var) -> self
```
### bind_params

```ruby
instance.bind_params(*(sqlite3_var_t | Hash[Symbol, sqlite3_var_t]) bind_vars) -> Array[sqlite3_var_t | Hash[Symbol, sqlite3_var_t]]
```
### close

```ruby
instance.close-> self
```
### closed?

```ruby
instance.closed?-> bool
```
### column_count

```ruby
instance.column_count-> Integer
```
### column_decltype

```ruby
instance.column_decltype(Integer index) -> String
```
### column_name

```ruby
instance.column_name(Integer index) -> String
```
### columns

```ruby
instance.columns-> Array[String]
```
### done?

```ruby
instance.done?-> bool
```
### execute

```ruby
instance.execute(*sqlite3_var_t bind_vars) -> SQLite3::ResultSet
instance.execute(*sqlite3_var_t bind_vars) { (SQLite3::ResultSet) -> nil } -> nil
```
### get_metadata

```ruby
instance.get_metadata-> void
```
### must_be_open!

```ruby
instance.must_be_open!-> nil
```
### reset!

```ruby
instance.reset!-> self
```
### step

```ruby
instance.step-> (Array[sqlite3_var_t] | nil)
```
### types

```ruby
instance.types-> Array[String]
```
