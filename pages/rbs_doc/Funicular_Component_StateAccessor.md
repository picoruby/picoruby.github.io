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
### fetch

```ruby
instance.fetch(Symbol key, ?untyped default) -> untyped
```
### key?

```ruby
instance.key?(Symbol key) -> bool
```
### to_h

```ruby
instance.to_h() -> Hash[Symbol, untyped]
```
