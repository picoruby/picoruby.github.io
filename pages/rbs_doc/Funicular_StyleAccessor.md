---
title: class Funicular::StyleAccessor
keywords: Funicular::StyleAccessor
tags: [class]
summary: Funicular::StyleAccessor class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_StyleAccessor.html
folder: rbs_doc
---
## Singleton methods
### accessor_for

```ruby
Funicular::StyleAccessor.accessor_for(Hash[Symbol, Hash[Symbol, untyped]] definitions) -> singleton(StyleAccessor)
```
### new

```ruby
Funicular::StyleAccessor.new(Hash[Symbol, Hash[Symbol, untyped]] definitions) -> void
```
## Instance methods
### []

```ruby
instance.[](Symbol name, ?(Symbol | bool) variant) -> StyleValue
```
### method_missing

```ruby
instance.method_missing(Symbol name, *untyped args) -> bot
```
### respond_to_missing?

```ruby
instance.respond_to_missing?(Symbol name, ?bool include_private) -> bool
```
