---
title: class URI::URIClass
keywords: URI::URIClass
tags: [class]
summary: URI::URIClass class of PicoRuby
sidebar: picoruby_sidebar
permalink: URI_URIClass.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
URI::URIClass.new(String scheme, String host, Integer port, String path, ?String? query, ?String? fragment) -> void
```
## Instance methods
### default_port

```ruby
instance.default_port() -> Integer?
```
### request_uri

```ruby
instance.request_uri() -> String
```
### to_s

```ruby
instance.to_s() -> String
```
## Attr accessors
### scheme (reader)
```ruby
instance.scheme -> String
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
### query (reader)
```ruby
instance.query -> String?
```
### fragment (reader)
```ruby
instance.fragment -> String?
```
