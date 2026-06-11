---
title: module Funicular
keywords: Funicular
tags: [module]
summary: Funicular module of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular.html
folder: rbs_doc
---
## Singleton methods
### configure_debug

```ruby
Funicular.configure_debug() ?{ (self) -> void } -> void
```
### configure_forms

```ruby
Funicular.configure_forms() ?{ (Hash[Symbol, String]) -> void } -> void
```
### env

```ruby
Funicular.env() -> EnvironmentInquirer
```
### env=

```ruby
Funicular.env=(EnvironmentInquirer | String environment) -> EnvironmentInquirer?
```
### export_debug_config

```ruby
Funicular.export_debug_config() -> void
```
### first_element_child

```ruby
Funicular.first_element_child(JS::Element container_element) -> JS::Element?
```
### form_builder_config

```ruby
Funicular.form_builder_config() -> Hash[Symbol, String]?
```
### form_builder_config=

```ruby
Funicular.form_builder_config=(Hash[Symbol, String] config) -> Hash[Symbol, String]
```
### has_ssr_state?

```ruby
Funicular.has_ssr_state?() -> bool
```
### load_schemas

```ruby
Funicular.load_schemas(Hash[singleton(Model), String] models) ?{ () -> void } -> void
```
### router

```ruby
Funicular.router() -> Router?
```
### server=

```ruby
Funicular.server=(untyped value) -> bool
```
### server?

```ruby
Funicular.server?() -> bool
```
### start

```ruby
Funicular.start(?singleton(Component)? component_class, ?container: String | JS::Element, ?props: Hash[Symbol, untyped], ?hydrate: bool) ?{ (Router router) -> void } -> (Component | Router | nil)
```
### version

```ruby
Funicular.version() -> String
```
### window_state

```ruby
Funicular.window_state() -> Hash[String, untyped]
```
## Type aliases
### route_constraints_t
```ruby
Hash[Symbol, Regexp]
```
### route_definition_t
```ruby
{ method: Symbol, path: String, component: singleton(Component), name: String?, pattern_segments: Array[String], constraints: route_constraints_t }
```
