---
title: class Funicular::DB::GuardedResultSet
keywords: Funicular::DB::GuardedResultSet
tags: [class]
summary: Funicular::DB::GuardedResultSet class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_DB_GuardedResultSet.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::DB::GuardedResultSet.new(untyped rs, untyped stmt, GuardedDatabase guard) -> void
```
## Instance methods
### close

```ruby
instance.close() -> untyped
```
### closed?

```ruby
instance.closed?() -> bool
```
### columns

```ruby
instance.columns() -> untyped
```
### each

```ruby
instance.each() { (untyped row) -> void } -> GuardedResultSet
```
### eof?

```ruby
instance.eof?() -> bool
```
### next

```ruby
instance.next() -> untyped
```
### reset

```ruby
instance.reset(*untyped bind_params) -> untyped
```
### to_a

```ruby
instance.to_a() -> Array[untyped]
```
### types

```ruby
instance.types() -> untyped
```
