---
title: class TCPServer
keywords: TCPServer
tags: [class]
summary: TCPServer class of PicoRuby
sidebar: picoruby_sidebar
permalink: TCPServer.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
TCPServer.new(String? host, Integer service, ?Integer backlog) -> TCPServer
```
## Instance methods
### accept

```ruby
instance.accept() -> TCPSocket
```
### accept_loop

```ruby
instance.accept_loop() { (TCPSocket) -> void } -> void
```
### accept_nonblock

```ruby
instance.accept_nonblock() -> (TCPSocket | nil)
```
### close

```ruby
instance.close() -> nil
```
