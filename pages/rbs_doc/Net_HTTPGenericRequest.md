---
title: class Net::HTTPGenericRequest
keywords: Net::HTTPGenericRequest
tags: [class]
summary: Net::HTTPGenericRequest class of PicoRuby
sidebar: picoruby_sidebar
permalink: Net_HTTPGenericRequest.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Net::HTTPGenericRequest.new(String method, String path, ?Hash[String, String]? initheader) -> HTTPGenericRequest
```
## Instance methods
### []

```ruby
instance.[](String key) -> String?
```
### []=

```ruby
instance.[]=(String key, String value) -> String
```
### delete

```ruby
instance.delete(String key) -> String?
```
### each_header

```ruby
instance.each_header() { (String, String) -> void } -> void
```
### request_body_permitted?

```ruby
instance.request_body_permitted?() -> bool
```
### response_body_permitted?

```ruby
instance.response_body_permitted?() -> bool
```
### set_default_headers

```ruby
instance.set_default_headers(String host, Integer port) -> void
```
### to_s

```ruby
instance.to_s() -> String
```
## Attr accessors
### method (reader)
```ruby
instance.method -> String
```
### path (reader)
```ruby
instance.path -> String
```
### body (accessor)
```ruby
instance.body -> String?
```
