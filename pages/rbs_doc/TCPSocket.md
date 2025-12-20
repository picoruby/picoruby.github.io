---
title: class TCPSocket
keywords: TCPSocket
tags: [class]
summary: TCPSocket class of PicoRuby
sidebar: picoruby_sidebar
permalink: TCPSocket.html
folder: rbs_doc
---
## Singleton methods
### gethostbyname

```ruby
TCPSocket.gethostbyname(String host) -> [String, Array[String], Integer, String]
```
### new

```ruby
TCPSocket.new(String host, Integer port) -> void
```
### open

```ruby
TCPSocket.open(String host, Integer port) -> TCPSocket
```
## Instance methods
### addr

```ruby
instance.addr() -> Array[String | Integer]
```
### connected?

```ruby
instance.connected?() -> bool
```
