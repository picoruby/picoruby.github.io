---
title: class Funicular::HTTP::Response
keywords: Funicular::HTTP::Response
tags: [class]
summary: Funicular::HTTP::Response class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_HTTP_Response.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::HTTP::Response.new(Integer status, untyped data) -> Response
```
## Instance methods
### error?

```ruby
instance.error?() -> bool
```
### error_message

```ruby
instance.error_message() -> String?
```
## Attr accessors
### data (reader)
```ruby
instance.data -> untyped
```
### status (reader)
```ruby
instance.status -> Integer
```
### ok (reader)
```ruby
instance.ok -> bool
```
