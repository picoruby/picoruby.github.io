---
title: class DRb::DRbServer
keywords: DRb::DRbServer
tags: [class]
summary: DRb::DRbServer class of PicoRuby
sidebar: picoruby_sidebar
permalink: DRb_DRbServer.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
DRb::DRbServer.new(String uri, untyped front, ?Hash[untyped, untyped] config) -> void
```
## Instance methods
### accept

```ruby
instance.accept() -> void
```
### alive?

```ruby
instance.alive?() -> bool
```
### run

```ruby
instance.run() -> void
```
### start

```ruby
instance.start() -> self
```
### stop

```ruby
instance.stop() -> void
```
## Attr accessors
### uri (reader)
```ruby
instance.uri -> String
```
### front (reader)
```ruby
instance.front -> untyped
```
