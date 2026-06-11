---
title: class Funicular::Store
keywords: Funicular::Store
tags: [class]
summary: Funicular::Store class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Store.html
folder: rbs_doc
---
## Singleton methods
### __belongs_to

```ruby
Funicular::Store.__belongs_to() -> Symbol?
```
### __cable_binding

```ruby
Funicular::Store.__cable_binding() -> SubscribesTo?
```
### __cable_url

```ruby
Funicular::Store.__cable_url() -> String?
```
### __clear_all!

```ruby
Funicular::Store.__clear_all!() -> nil
```
### __cleared_handlers

```ruby
Funicular::Store.__cleared_handlers() -> Hash[Symbol, Proc?]?
```
### __consumer

```ruby
Funicular::Store.__consumer() -> Funicular::Cable::Consumer
```
### __database

```ruby
Funicular::Store.__database() -> String?
```
### __expires_in

```ruby
Funicular::Store.__expires_in() -> Integer?
```
### __handle_dispatch

```ruby
Funicular::Store.__handle_dispatch(Symbol event, untyped payload) -> void
```
### __kvs

```ruby
Funicular::Store.__kvs() -> IndexedDB::KVS
```
### __kvs_store_name

```ruby
Funicular::Store.__kvs_store_name() -> String?
```
### __scope_keys

```ruby
Funicular::Store.__scope_keys() -> Array[Symbol]?
```
### __source

```ruby
Funicular::Store.__source() -> untyped
```
### belongs_to

```ruby
Funicular::Store.belongs_to(Symbol name) -> Symbol
```
### cable_url

```ruby
Funicular::Store.cable_url(String url) -> String
```
### cleared_on

```ruby
Funicular::Store.cleared_on(*Symbol event_names) ?{ (untyped) -> void } -> void
```
### database

```ruby
Funicular::Store.database(String name) -> String
```
### dispatch

```ruby
Funicular::Store.dispatch(Symbol | String event, ?untyped payload) -> nil
```
### expires_in

```ruby
Funicular::Store.expires_in(Integer seconds) -> Integer
```
### kvs_store

```ruby
Funicular::Store.kvs_store(String name) -> String
```
### scope

```ruby
Funicular::Store.scope(*Symbol keys) -> Array[Symbol]
```
### scope_class

```ruby
Funicular::Store.scope_class() -> singleton(Funicular::Store::Scope)
```
### source

```ruby
Funicular::Store.source(untyped model_class) -> untyped
```
### subscribes_to

```ruby
Funicular::Store.subscribes_to(String channel_name, params: ^(Funicular::Store::Scope) -> Hash[Symbol, untyped]) { (untyped, Funicular::Store::Scope) -> void } -> SubscribesTo
```
### where

```ruby
Funicular::Store.where(**untyped scope_kwargs) -> Funicular::Store::Scope
```
