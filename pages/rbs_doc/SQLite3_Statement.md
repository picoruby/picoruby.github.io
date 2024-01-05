---
title: SQLite3::Statement
sidebar: picoruby_sidebar
permalink: SQLite3_Statement.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
SQLite3::Statement.new(SQLite3::Database db, String sql) -> void
```
## Instance methods
### active?

```ruby
active?-> bool
```
### bind_param

```ruby
bind_param(Integer|Symbol|String key, var_t var) -> self
```
### bind_params

```ruby
bind_params(*(var_t | Hash[Symbol, var_t]) bind_vars) -> Array[var_t | Hash[Symbol, var_t]]
```
### close

```ruby
close-> self
```
### closed?

```ruby
closed?-> bool
```
### column_count

```ruby
column_count-> Integer
```
### column_decltype

```ruby
column_decltype(Integer index) -> String
```
### column_name

```ruby
column_name(Integer index) -> String
```
### columns

```ruby
columns-> Array[String]
```
### done?

```ruby
done?-> bool
```
### execute

```ruby
execute(*var_t bind_vars) -> SQLite3::ResultSet
execute(*var_t bind_vars) { (SQLite3::ResultSet) -> nil } -> nil
```
### get_metadata

```ruby
get_metadata-> void
```
### must_be_open!

```ruby
must_be_open!-> nil
```
### reset!

```ruby
reset!-> self
```
### step

```ruby
step-> (Array[var_t] | nil)
```
### types

```ruby
types-> Array[String]
```
