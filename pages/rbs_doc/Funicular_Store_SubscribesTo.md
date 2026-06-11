---
title: class Funicular::Store::SubscribesTo
keywords: Funicular::Store::SubscribesTo
tags: [class]
summary: Funicular::Store::SubscribesTo class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Store_SubscribesTo.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::Store::SubscribesTo.new(String channel_name, ^(Funicular::Store::Scope) -> Hash[Symbol, untyped] params_proc, Proc handler_block) -> instance
```
## Attr accessors
### channel_name (reader)
```ruby
instance.channel_name -> String
```
### params_proc (reader)
```ruby
instance.params_proc -> ^(Funicular::Store::Scope) -> Hash[Symbol, untyped]
```
### handler_block (reader)
```ruby
instance.handler_block -> Proc
```
