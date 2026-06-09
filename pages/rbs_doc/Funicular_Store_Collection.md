---
title: class Funicular::Store::Collection
keywords: Funicular::Store::Collection
tags: [class]
summary: Funicular::Store::Collection class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Store_Collection.html
folder: rbs_doc
---
## Singleton methods
### __key_proc

```ruby
Funicular::Store::Collection.__key_proc() -> (^(untyped) -> untyped | nil)
```
### __limit

```ruby
Funicular::Store::Collection.__limit() -> Integer?
```
### __order

```ruby
Funicular::Store::Collection.__order() -> Symbol?
```
### key

```ruby
Funicular::Store::Collection.key(^(untyped) -> untyped proc) -> (^(untyped) -> untyped)
```
### limit

```ruby
Funicular::Store::Collection.limit(Integer n) -> Integer
```
### order

```ruby
Funicular::Store::Collection.order(Symbol direction) -> Symbol
```
### scope_class

```ruby
Funicular::Store::Collection.scope_class() -> singleton(Funicular::Store::Collection::Scope)
```
