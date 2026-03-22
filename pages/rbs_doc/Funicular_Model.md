---
title: class Funicular::Model
keywords: Funicular::Model
tags: [class]
summary: Funicular::Model class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Model.html
folder: rbs_doc
---
## Singleton methods
### all

```ruby
Funicular::Model.all(?Hash[untyped, untyped] params) ?{ (Array[Model]? instances, String? error) -> void } -> void
```
### create

```ruby
Funicular::Model.create(Hash[untyped, untyped] attrs, ?model_class: singleton(Model)) ?{ (Model? instance, String? error) -> void } -> void
```
### destroy

```ruby
Funicular::Model.destroy(?untyped id) ?{ (bool success, untyped result) -> void } -> void
```
### endpoints

```ruby
Funicular::Model.endpoints() -> Hash[String, Hash[String, String]]
```
### endpoints=

```ruby
Funicular::Model.endpoints=(Hash[String, Hash[String, String]] endpoints) -> Hash[String, Hash[String, String]]
```
### find

```ruby
Funicular::Model.find(?untyped id, ?endpoint_name: String, ?model_class: singleton(Model)) ?{ (Model? instance, String? error) -> void } -> void
```
### load_schema

```ruby
Funicular::Model.load_schema(Hash[String, untyped] schema_data) -> void
```
### new

```ruby
Funicular::Model.new(?Hash[untyped, untyped] attributes) -> Model
```
### schema

```ruby
Funicular::Model.schema() -> Hash[String, Hash[String, untyped]]
```
### schema=

```ruby
Funicular::Model.schema=(Hash[String, Hash[String, untyped]] schema) -> Hash[String, Hash[String, untyped]]
```
## Instance methods
### destroy

```ruby
instance.destroy() ?{ (bool success, untyped result) -> void } -> void
```
### reload

```ruby
instance.reload() ?{ (Model? instance, String? error) -> void } -> void
```
### update

```ruby
instance.update(?Hash[untyped, untyped]? attrs) ?{ (bool success, untyped result) -> void } -> void
```
## Attr accessors
### id (reader)
```ruby
instance.id -> untyped
```
