---
title: class Funicular::Cable::Subscription
keywords: Funicular::Cable::Subscription
tags: [class]
summary: Funicular::Cable::Subscription class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Cable_Subscription.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::Cable::Subscription.new(Consumer consumer, String identifier, Hash[Symbol, untyped] params) ?{ (untyped message) -> void } -> void
```
## Instance methods
### notify_connected

```ruby
instance.notify_connected() -> void
```
### notify_received

```ruby
instance.notify_received(untyped message) -> void
```
### notify_rejected

```ruby
instance.notify_rejected() -> void
```
### on_connected

```ruby
instance.on_connected() { () -> void } -> void
```
### on_disconnected

```ruby
instance.on_disconnected() { () -> void } -> void
```
### on_rejected

```ruby
instance.on_rejected() { () -> void } -> void
```
### perform

```ruby
instance.perform(String action, ?Hash[Symbol, untyped] data) -> void
```
### subscribe

```ruby
instance.subscribe() -> void
```
### unsubscribe

```ruby
instance.unsubscribe() -> void
```
## Attr accessors
### consumer (reader)
```ruby
instance.consumer -> Consumer
```
### identifier (reader)
```ruby
instance.identifier -> String
```
### params (reader)
```ruby
instance.params -> Hash[Symbol, untyped]
```
