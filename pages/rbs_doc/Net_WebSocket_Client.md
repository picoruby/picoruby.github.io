---
title: class Net::WebSocket::Client
keywords: Net::WebSocket::Client
tags: [class]
summary: Net::WebSocket::Client class of PicoRuby
sidebar: picoruby_sidebar
permalink: Net_WebSocket_Client.html
folder: rbs_doc
---
## Singleton methods
### connect

```ruby
Net::WebSocket::Client.connect(String) { (Client) -> void } -> void
Net::WebSocket::Client.connect(String) -> Client
```
### new

```ruby
Net::WebSocket::Client.new(String url) -> void
```
## Instance methods
### add_header

```ruby
instance.add_header(String, String) -> void
```
### close

```ruby
instance.close(?Integer, ?String) -> void
```
### connect

```ruby
instance.connect() -> bool
```
### connected?

```ruby
instance.connected?() -> bool
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
## Attr accessors
### url (reader)
```ruby
instance.url -> String
```
### host (reader)
```ruby
instance.host -> String
```
### port (reader)
```ruby
instance.port -> Integer
```
### path (reader)
```ruby
instance.path -> String
```
### ssl_context (accessor)
```ruby
instance.ssl_context -> SSLContext
```
