---
title: class UDPSocket
keywords: UDPSocket
tags: [class]
summary: UDPSocket class of PicoRuby
sidebar: picoruby_sidebar
permalink: UDPSocket.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
UDPSocket.new(?Integer port) -> UDPSocket
```
## Instance methods
### bind

```ruby
instance.bind(String host, Integer port) -> void
```
### connect

```ruby
instance.connect(String host, Integer port) -> void
```
### read

```ruby
instance.read(Integer maxlen) -> String?
```
### recvfrom

```ruby
instance.recvfrom(Integer maxlen, ?Integer flags) -> [String, Array[String | Integer]]
```
### recvfrom_nonblock

```ruby
instance.recvfrom_nonblock(Integer maxlen, ?Integer flags) -> ([String, Array[String | Integer]] | nil)
```
### send

```ruby
instance.send(String data, Integer flags, ?String? host, ?Integer? port) -> Integer
```
