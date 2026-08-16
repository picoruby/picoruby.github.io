---
title: class Funicular::DB::TableBuilder
keywords: Funicular::DB::TableBuilder
tags: [class]
summary: Funicular::DB::TableBuilder class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_DB_TableBuilder.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::DB::TableBuilder.new() -> void
```
## Instance methods
### boolean

```ruby
instance.boolean(untyped name, ?default: untyped, ?null: bool) -> void
```
### datetime

```ruby
instance.datetime(untyped name, ?default: untyped, ?null: bool) -> void
```
### execute

```ruby
instance.execute(String sql) -> void
```
### float

```ruby
instance.float(untyped name, ?default: untyped, ?null: bool) -> void
```
### index

```ruby
instance.index(*untyped columns) -> void
```
### integer

```ruby
instance.integer(untyped name, ?default: untyped, ?null: bool) -> void
```
### remove

```ruby
instance.remove(untyped name) -> void
```
### remove_index

```ruby
instance.remove_index(*untyped columns) -> void
```
### rename

```ruby
instance.rename(untyped old_name, untyped new_name) -> void
```
### string

```ruby
instance.string(untyped name, ?default: untyped, ?null: bool) -> void
```
### text

```ruby
instance.text(untyped name, ?default: untyped, ?null: bool) -> void
```
### timestamps

```ruby
instance.timestamps() -> void
```
## Attr accessors
### ops (reader)
```ruby
instance.ops -> Array[untyped]
```
