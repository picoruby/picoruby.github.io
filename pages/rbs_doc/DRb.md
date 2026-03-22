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
### _base_create_server

```ruby
DRb._base_create_server(String uri, untyped front, Hash[untyped, untyped] config) -> DRbServer
```
### _base_create_socket

```ruby
DRb._base_create_socket(String uri) -> TCPSocket
```
### create_server

```ruby
DRb.create_server(String uri, untyped front, Hash[untyped, untyped] config) -> untyped
```
### create_socket

```ruby
DRb.create_socket(String uri) -> untyped
```
### front

```ruby
DRb.front() -> untyped
```
### parse_druby_uri

```ruby
DRb.parse_druby_uri(String uri) -> [String, Integer]
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
DRb.start_service(?String uri, ?untyped front, ?Hash[untyped, untyped] config) -> void
```
### stop_service

```ruby
DRb.stop_service() -> void
```
### thread

```ruby
DRb.thread() -> Task
```
### uri

```ruby
DRb.uri() -> String?
```
## Singleton methods
### _ws_base_create_server

```ruby
DRb._ws_base_create_server(String uri, untyped front, Hash[untyped, untyped] config) -> untyped
```
### _ws_base_create_socket

```ruby
DRb._ws_base_create_socket(String uri) -> untyped
```
### parse_ws_uri

```ruby
DRb.parse_ws_uri(String uri) -> ([String, Integer] | String)
```
