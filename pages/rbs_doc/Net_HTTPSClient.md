---
title: class Net::HTTPSClient
keywords: Net::HTTPSClient
tags: [class]
summary: Net::HTTPSClient class of PicoRuby
sidebar: picoruby_sidebar
permalink: Net_HTTPSClient.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Net::HTTPSClient.new(String host) -> void
```
## Instance methods
### get

```ruby
instance.get(String path) -> (httpreturn | nil)
```
### get_with_headers

```ruby
instance.get_with_headers(String path, header_t headers) -> (httpreturn | nil)
```
### post

```ruby
instance.post(String path, header_t headers, String body) -> (httpreturn | nil)
```
### put

```ruby
instance.put(String path, header_t headers, String body) -> (httpreturn | nil)
```
