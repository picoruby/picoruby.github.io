---
title: class Funicular::Component::ResourceAccessor
keywords: Funicular::Component::ResourceAccessor
tags: [class]
summary: Funicular::Component::ResourceAccessor class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Component_ResourceAccessor.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::Component::ResourceAccessor.new(Hash[Symbol, untyped] data, Hash[Symbol, Symbol] states, Hash[Symbol, untyped] errors) -> void
```
## Instance methods
### []

```ruby
instance.[](Symbol key) -> untyped
```
### error

```ruby
instance.error(Symbol key) -> untyped
```
### error?

```ruby
instance.error?(Symbol key) -> bool
```
### fetch

```ruby
instance.fetch(Symbol key, ?untyped default) -> untyped
```
### loading?

```ruby
instance.loading?(Symbol key) -> bool
```
