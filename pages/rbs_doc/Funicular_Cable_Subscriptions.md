---
title: class Funicular::Cable::Subscriptions
keywords: Funicular::Cable::Subscriptions
tags: [class]
summary: Funicular::Cable::Subscriptions class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Cable_Subscriptions.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::Cable::Subscriptions.new(Consumer consumer) -> Subscriptions
```
## Instance methods
### create

```ruby
instance.create(Hash[Symbol, untyped] params) ?{ (untyped message) -> void } -> Subscription
```
### find

```ruby
instance.find(String identifier) -> Subscription?
```
### notify_message

```ruby
instance.notify_message(String identifier, untyped message) -> void
```
### notify_subscription_confirmed

```ruby
instance.notify_subscription_confirmed(String identifier) -> void
```
### notify_subscription_rejected

```ruby
instance.notify_subscription_rejected(String identifier) -> void
```
### remove

```ruby
instance.remove(Subscription subscription) -> void
```
