---
title: class SSLContext
keywords: SSLContext
tags: [class]
summary: SSLContext class of PicoRuby
sidebar: picoruby_sidebar
permalink: SSLContext.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
SSLContext.new() -> SSLContext
```
## Instance methods
### ca_file=

```ruby
instance.ca_file=(String path) -> String
```
### set_ca_cert

```ruby
instance.set_ca_cert(Integer addr, Integer size) -> nil
```
### verify_mode

```ruby
instance.verify_mode() -> Integer
```
### verify_mode=

```ruby
instance.verify_mode=(Integer mode) -> Integer
```
