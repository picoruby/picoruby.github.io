---
title: class DRb::DRbTCPServer
keywords: DRb::DRbTCPServer
tags: [class]
summary: DRb::DRbTCPServer class of PicoRuby
sidebar: picoruby_sidebar
permalink: DRb_DRbTCPServer.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
DRb::DRbTCPServer.new(String uri, untyped front, ?Hash[untyped, untyped] config) -> DRb::DRbTCPServer
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
