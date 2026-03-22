---
title: class DRb::WebSocket::BrowserSocket
keywords: DRb::WebSocket::BrowserSocket
tags: [class]
summary: DRb::WebSocket::BrowserSocket class of PicoRuby
sidebar: picoruby_sidebar
permalink: DRb_WebSocket_BrowserSocket.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
DRb::WebSocket::BrowserSocket.new(String url) -> DRb::WebSocket::BrowserSocket
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
### write

```ruby
instance.write(String data) -> void
```
