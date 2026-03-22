---
title: class SSLSocket
keywords: SSLSocket
tags: [class]
summary: SSLSocket class of PicoRuby
sidebar: picoruby_sidebar
permalink: SSLSocket.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
SSLSocket.new(TCPSocket tcp_socket, SSLContext ssl_context) -> SSLSocket
```
### open

```ruby
SSLSocket.open(String hostname, Integer port, SSLContext ssl_context) -> SSLSocket
```
## Instance methods
### addr

```ruby
instance.addr() -> Array[String | Integer]
```
### cipher

```ruby
instance.cipher() -> nil
```
### connect

```ruby
instance.connect() -> self
```
### connected?

```ruby
instance.connected?() -> bool
```
### peer_cert

```ruby
instance.peer_cert() -> nil
```
### peer_cert_chain

```ruby
instance.peer_cert_chain() -> Array[untyped]
```
### ssl_version

```ruby
instance.ssl_version() -> String
```
### state

```ruby
instance.state() -> String
```
## Attr accessors
### tcp_socket (reader)
```ruby
instance.tcp_socket -> TCPSocket
```
### ssl_context (reader)
```ruby
instance.ssl_context -> SSLContext
```
