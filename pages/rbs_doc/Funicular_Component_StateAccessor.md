---
title: class Funicular::Component::StateAccessor
keywords: Funicular::Component::StateAccessor
tags: [class]
summary: Funicular::Component::StateAccessor class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Component_StateAccessor.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::Component::StateAccessor.new(Hash[Symbol, untyped] state_hash) -> void
```
## Instance methods
### []

```ruby
instance.[](Symbol key) -> untyped
```
### errors

```ruby
instance.errors() -> Hash[Symbol, String]
```
### method_missing

```ruby
instance.method_missing(Symbol method, *untyped args) -> untyped
```
### respond_to_missing?

```ruby
instance.respond_to_missing?(Symbol method, ?bool include_private) -> bool
```
