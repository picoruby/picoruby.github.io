---
title: class Funicular::VDOM::Component
keywords: Funicular::VDOM::Component
tags: [class]
summary: Funicular::VDOM::Component class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_VDOM_Component.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::VDOM::Component.new(untyped component_class, ?Hash[Symbol, untyped] props, ?Array[child_t] children) -> void
```
## Instance methods
### ==

```ruby
instance.==(untyped other) -> bool
```
## Attr accessors
### component_class (reader)
```ruby
instance.component_class -> untyped
```
### props (reader)
```ruby
instance.props -> Hash[Symbol, untyped]
```
### children (reader)
```ruby
instance.children -> Array[child_t]
```
### instance (accessor)
```ruby
instance.instance -> untyped
```
### runtime (accessor)
```ruby
instance.runtime -> Runtime?
```
