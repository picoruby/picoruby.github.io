---
title: class Funicular::ErrorBoundary
keywords: Funicular::ErrorBoundary
tags: [class]
summary: Funicular::ErrorBoundary class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_ErrorBoundary.html
folder: rbs_doc
---
## Instance methods
### catch_error

```ruby
instance.catch_error(Exception error, ?Hash[Symbol, untyped]? error_info) -> bool
```
### initialize_state

```ruby
instance.initialize_state() -> Hash[Symbol, untyped]
```
### render

```ruby
instance.render() -> (VDOM::VNode | String | Integer | Float | Array[untyped] | nil)
```
### reset

```ruby
instance.reset() -> void
```
## Attr accessors
### error_caught_during_render (accessor)
```ruby
instance.error_caught_during_render -> bool?
```
