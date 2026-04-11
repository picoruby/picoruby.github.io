---
title: class JS::WebSocket
keywords: JS::WebSocket
tags: [class]
summary: JS::WebSocket class of PicoRuby
sidebar: picoruby_sidebar
permalink: JS_WebSocket.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
JS::WebSocket.new(String url) -> void
```
## Instance methods
### binary_type

```ruby
instance.binary_type() -> String?
```
### binary_type=

```ruby
instance.binary_type=(String type) -> String
```
### close

```ruby
instance.close() -> nil
```
### closed?

```ruby
instance.closed?() -> bool
```
### closing?

```ruby
instance.closing?() -> bool
```
### connecting?

```ruby
instance.connecting?() -> bool
```
### onclose

```ruby
instance.onclose() { (JS::Object event) -> void } -> void
```
### onerror

```ruby
instance.onerror() { (JS::Object event) -> void } -> void
```
### onmessage

```ruby
instance.onmessage() { (JS::Object event) -> void } -> void
```
### onopen

```ruby
instance.onopen() { (JS::Object event) -> void } -> void
```
### open?

```ruby
instance.open?() -> bool
```
### ready_state

```ruby
instance.ready_state() -> Integer
```
### send

```ruby
instance.send(String data) -> nil
```
### send_binary

```ruby
instance.send_binary(String bytes) -> nil
```
