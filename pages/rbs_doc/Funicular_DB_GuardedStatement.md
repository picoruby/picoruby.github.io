---
title: class Funicular::DB::GuardedStatement
keywords: Funicular::DB::GuardedStatement
tags: [class]
summary: Funicular::DB::GuardedStatement class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_DB_GuardedStatement.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::DB::GuardedStatement.new(untyped stmt, GuardedDatabase guard) -> void
```
## Instance methods
### bind_params

```ruby
instance.bind_params(*untyped bind_vars) -> untyped
```
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
### execute

```ruby
instance.execute(*untyped bind_vars) -> Array[untyped]
```
### readonly?

```ruby
instance.readonly?() -> bool
```
### step

```ruby
instance.step() -> untyped
```
