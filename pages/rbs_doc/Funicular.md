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
### load_schemas

```ruby
Funicular.load_schemas(Hash[singleton(Model), String] models) ?{ () -> void } -> void
```
### router

```ruby
Funicular.router() -> Router?
```
### start

```ruby
Funicular.start(?singleton(Component)? component_class, ?container: String | JS::Object, ?props: Hash[Symbol, untyped]) ?{ (Router router) -> void } -> (Component | Router)
```
### version

```ruby
Funicular.version() -> String
```
## Type aliases
### route_definition_t
```ruby
{ method: Symbol, path: String, component: singleton(Component), name: String?, pattern_segments: Array[String] }
```
