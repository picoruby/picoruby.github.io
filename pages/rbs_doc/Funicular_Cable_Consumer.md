---
title: class Funicular::Cable::Consumer
keywords: Funicular::Cable::Consumer
tags: [class]
summary: Funicular::Cable::Consumer class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Cable_Consumer.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::Cable::Consumer.new(String url) -> void
```
## Instance methods
### cleanup

```ruby
instance.cleanup() -> void
```
### cleanup_event_listeners

```ruby
instance.cleanup_event_listeners() -> void
```
### connect

```ruby
instance.connect() -> void
```
### disconnect

```ruby
instance.disconnect() -> void
```
### send_command

```ruby
instance.send_command(Hash[Symbol, untyped] command) -> void
```
## Attr accessors
### url (reader)
```ruby
instance.url -> String
```
### subscriptions (reader)
```ruby
instance.subscriptions -> Subscriptions
```
