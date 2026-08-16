---
title: class Funicular::Relation
keywords: Funicular::Relation
tags: [class]
summary: Funicular::Relation class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Relation.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::Relation.new(untyped model, ?Array[String] where_sql,
                     ?Array[untyped] where_binds, ?Array[String] order_sql,
                     ?Integer? limit, ?Integer? offset) -> void
```
## Instance methods
### __event_source

```ruby
instance.__event_source() -> [Symbol, String]
```
### count

```ruby
instance.count() -> Integer
```
### delete_all

```ruby
instance.delete_all() -> Integer
```
### each

```ruby
instance.each() { (untyped record) -> void } -> Array[untyped]
```
### exists?

```ruby
instance.exists?() -> bool
```
### find

```ruby
instance.find(untyped id) -> untyped
```
### find_by

```ruby
instance.find_by(Hash[untyped, untyped] conditions) -> untyped
```
### first

```ruby
instance.first() -> untyped
```
### limit

```ruby
instance.limit(Integer? n) -> Relation
```
### offset

```ruby
instance.offset(Integer? n) -> Relation
```
### order

```ruby
instance.order(*untyped args) -> Relation
```
### to_a

```ruby
instance.to_a() -> Array[untyped]
```
### to_sql

```ruby
instance.to_sql() -> String
```
### where

```ruby
instance.where(?Hash[untyped, untyped] | String | nil conditions, *untyped binds) -> Relation
```
