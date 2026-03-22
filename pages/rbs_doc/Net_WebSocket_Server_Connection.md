---
title: class Net::WebSocket::Server::Connection
keywords: Net::WebSocket::Server::Connection
tags: [class]
summary: Net::WebSocket::Server::Connection class of PicoRuby
sidebar: picoruby_sidebar
permalink: Net_WebSocket_Server_Connection.html
folder: rbs_doc
---
## Instance methods
### close

```ruby
instance.close(?Integer, ?String) -> void
```
### closed?

```ruby
instance.closed?() -> bool
```
### ping

```ruby
instance.ping(?String) -> Integer
```
### receive

```ruby
instance.receive(?timeout: Integer?) -> String?
```
### send

```ruby
instance.send(String, ?type: Symbol) -> Integer
```
### send_binary

```ruby
instance.send_binary(String) -> Integer
```
### send_text

```ruby
instance.send_text(String) -> Integer
```
