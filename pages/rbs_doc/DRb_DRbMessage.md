---
title: class DRb::DRbMessage
keywords: DRb::DRbMessage
tags: [class]
summary: DRb::DRbMessage class of PicoRuby
sidebar: picoruby_sidebar
permalink: DRb_DRbMessage.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
DRb::DRbMessage.new(TCPSocket socket) -> DRbMessage
```
## Instance methods
### recv_reply

```ruby
instance.recv_reply() -> ::Marshal::marshallable
```
### recv_request

```ruby
instance.recv_request() -> ::Marshal::marshallable
```
### send_reply

```ruby
instance.send_reply(bool success, untyped result) -> void
```
### send_request

```ruby
instance.send_request(untyped ref, Symbol msg_id, Array[untyped] args, ?Proc? block) -> void
```
