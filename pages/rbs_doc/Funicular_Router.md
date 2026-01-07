---
title: class Funicular::Router
keywords: Funicular::Router
tags: [class]
summary: Funicular::Router class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Router.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::Router.new(JS::Object container) -> Router
```
## Instance methods
### add_route

```ruby
instance.add_route(String path, singleton(Component) component_class, ?as: String?) -> void
```
### current_hash_path

```ruby
instance.current_hash_path() -> String
```
### current_location_path

```ruby
instance.current_location_path() -> String
```
### delete

```ruby
instance.delete(String path, to: singleton(Component), ?as: String?) -> void
```
### get

```ruby
instance.get(String path, to: singleton(Component), ?as: String?) -> void
```
### navigate

```ruby
instance.navigate(String path) -> void
```
### patch

```ruby
instance.patch(String path, to: singleton(Component), ?as: String?) -> void
```
### post

```ruby
instance.post(String path, to: singleton(Component), ?as: String?) -> void
```
### put

```ruby
instance.put(String path, to: singleton(Component), ?as: String?) -> void
```
### set_default

```ruby
instance.set_default(String path) -> void
```
### start

```ruby
instance.start() -> void
```
### stop

```ruby
instance.stop() -> void
```
## Attr accessors
### routes (reader)
```ruby
instance.routes -> Array[route_definition_t]
```
### current_component (reader)
```ruby
instance.current_component -> Component?
```
### current_path (reader)
```ruby
instance.current_path -> String?
```
