---
title: class Funicular::Store::Scope
keywords: Funicular::Store::Scope
tags: [class]
summary: Funicular::Store::Scope class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Store_Scope.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::Store::Scope.new(singleton(Funicular::Store) store_class, Hash[Symbol, untyped] scope_kwargs) -> void
```
## Instance methods
### method_missing

```ruby
instance.method_missing(Symbol name, *untyped args) -> untyped
```
### off_change

```ruby
instance.off_change(Integer id) -> nil
```
### on_change

```ruby
instance.on_change() { (untyped) -> void } -> Integer
```
### respond_to_missing?

```ruby
instance.respond_to_missing?(Symbol name, ?bool include_private) -> bool
```
### subscribe!

```ruby
instance.subscribe!() -> Funicular::Store::Subscription
```
### subscribed?

```ruby
instance.subscribed?() -> bool
```
### subscription

```ruby
instance.subscription() -> Funicular::Store::Subscription?
```
### unsubscribe!

```ruby
instance.unsubscribe!() -> nil
```
## Attr accessors
### store_class (reader)
```ruby
instance.store_class -> singleton(Funicular::Store)
```
### scope_kwargs (reader)
```ruby
instance.scope_kwargs -> Hash[Symbol, untyped]
```
