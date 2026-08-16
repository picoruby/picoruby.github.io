---
title: class Funicular::StyleBuilder
keywords: Funicular::StyleBuilder
tags: [class]
summary: Funicular::StyleBuilder class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_StyleBuilder.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::StyleBuilder.new() -> void
```
## Instance methods
### define

```ruby
instance.define(Symbol name, ?(String | Hash[Symbol, untyped])? value, **untyped options) -> self
```
### method_missing

```ruby
instance.method_missing(Symbol name, ?untyped value, **untyped options) -> self
```
### respond_to_missing?

```ruby
instance.respond_to_missing?(Symbol name, ?bool include_private) -> bool
```
### to_definitions

```ruby
instance.to_definitions() -> Hash[Symbol, Hash[Symbol, untyped]]
```
### validate_options

```ruby
instance.validate_options(Symbol name, Hash[Symbol, untyped] options) -> Hash[Symbol, untyped]
```
