---
title: class DRb::WebSocket::Server
keywords: DRb::WebSocket::Server
tags: [class]
summary: DRb::WebSocket::Server class of PicoRuby
sidebar: picoruby_sidebar
permalink: DRb_WebSocket_Server.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
DRb::WebSocket::Server.new(String uri, untyped front, Hash[untyped, untyped] config) -> DRb::WebSocket::Server
```
## Instance methods
### accept

```ruby
instance.accept-> untyped?
```
### alive?

```ruby
instance.alive?-> bool
```
### run

```ruby
instance.run-> void
```
### start

```ruby
instance.start-> self
```
### stop

```ruby
instance.stop-> void
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
