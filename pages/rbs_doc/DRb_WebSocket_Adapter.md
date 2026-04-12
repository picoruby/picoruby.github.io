---
title: class DRb::WebSocket::Adapter
keywords: DRb::WebSocket::Adapter
tags: [class]
summary: DRb::WebSocket::Adapter class of PicoRuby
sidebar: picoruby_sidebar
permalink: DRb_WebSocket_Adapter.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
DRb::WebSocket::Adapter.new(untyped ws, ?read_timeout: Integer?) -> void
```
## Instance methods
### close

```ruby
instance.close-> void
```
### closed?

```ruby
instance.closed?-> bool
```
### read

```ruby
instance.read(Integer n) -> String
```
### real_close

```ruby
instance.real_close-> void
```
### write

```ruby
instance.write(String data) -> void
```
