---
title: module Funicular::Debug
keywords: Funicular::Debug
tags: [module]
summary: Funicular::Debug module of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Debug.html
folder: rbs_doc
---
## Singleton methods
### all_components

```ruby
Funicular::Debug.all_components() -> Array[Funicular::Component]
```
### component_registry

```ruby
Funicular::Debug.component_registry() -> Hash[Integer, Funicular::Component]
```
### component_tree

```ruby
Funicular::Debug.component_tree() -> String
```
### enabled?

```ruby
Funicular::Debug.enabled?() -> bool
```
### expose_to_global

```ruby
Funicular::Debug.expose_to_global() -> void
```
### get_component

```ruby
Funicular::Debug.get_component(Integer) -> Funicular::Component?
```
### get_component_instance_variables

```ruby
Funicular::Debug.get_component_instance_variables(Integer) -> String
```
### get_component_state

```ruby
Funicular::Debug.get_component_state(Integer) -> String
```
### register_component

```ruby
Funicular::Debug.register_component(Funicular::Component) -> Integer?
```
### report_error

```ruby
Funicular::Debug.report_error(ErrorBoundary boundary, Exception error, ?(Hash[Symbol, Component] | nil) error_info) -> Hash[Symbol, untyped]?
```
### unregister_component

```ruby
Funicular::Debug.unregister_component(Integer) -> void
```
