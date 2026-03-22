---
title: class Net::WebSocket::Server
keywords: Net::WebSocket::Server
tags: [class]
summary: Net::WebSocket::Server class of PicoRuby
sidebar: picoruby_sidebar
permalink: Net_WebSocket_Server.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Net::WebSocket::Server.new(?host: String, ?port: Integer) -> Server
```
## Instance methods
### accept

```ruby
instance.accept() -> Server::Connection
```
### accept_loop

```ruby
instance.accept_loop() { (Server::Connection) -> void } -> void
```
### close

```ruby
instance.close() -> void
```
### start

```ruby
instance.start() -> bool
```
## Attr accessors
### host (reader)
```ruby
instance.host -> String
```
### port (reader)
```ruby
instance.port -> Integer
```
