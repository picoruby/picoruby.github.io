---
title: module DRb
keywords: DRb
tags: [module]
summary: DRb module of PicoRuby
sidebar: picoruby_sidebar
permalink: DRb.html
folder: rbs_doc
---
## Singleton methods
### front

```ruby
DRb.front() -> untyped
```
### primary_server

```ruby
DRb.primary_server() -> DRbServer?
```
### primary_server=

```ruby
DRb.primary_server=(DRbServer? server) -> DRbServer?
```
### ref_object

```ruby
DRb.ref_object(String uri) -> DRbObject
```
### send_message

```ruby
DRb.send_message(String uri, untyped ref, Symbol msg_id, Array[untyped] args, ?Proc? block) -> untyped
```
### start_service

```ruby
DRb.start_service(String uri, untyped front, ?Hash[untyped, untyped] config) -> void
```
### stop_service

```ruby
DRb.stop_service() -> void
```
### thread

```ruby
DRb.thread() -> void
```
### uri

```ruby
DRb.uri() -> String?
```
