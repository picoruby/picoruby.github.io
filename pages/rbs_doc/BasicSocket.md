---
title: class BasicSocket
keywords: BasicSocket
tags: [class]
summary: BasicSocket class of PicoRuby
sidebar: picoruby_sidebar
permalink: BasicSocket.html
folder: rbs_doc
---
## Instance methods
### close

```ruby
instance.close() -> void
```
### closed?

```ruby
instance.closed?() -> bool
```
### eof?

```ruby
instance.eof?() -> bool
```
### gets

```ruby
instance.gets(?String sep) -> String?
```
### local_address

```ruby
instance.local_address() -> nil
```
### peeraddr

```ruby
instance.peeraddr() -> Array[String | Integer]
```
### print

```ruby
instance.print(*untyped args) -> nil
```
### puts

```ruby
instance.puts(*untyped args) -> nil
```
### read

```ruby
instance.read(Integer maxlen) -> String?
```
### recv

```ruby
instance.recv(Integer maxlen, ?Integer flags) -> String?
```
### remote_address

```ruby
instance.remote_address() -> String
```
### remote_host

```ruby
instance.remote_host() -> String
```
### remote_port

```ruby
instance.remote_port() -> Integer
```
### send

```ruby
instance.send(String data, Integer flags) -> Integer
```
### write

```ruby
instance.write(String data) -> Integer
```
