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
### cert_file=

```ruby
instance.cert_file=(String path) -> String
```
### key_file=

```ruby
instance.key_file=(String path) -> String
```
### set_ca

```ruby
instance.set_ca(Integer addr, Integer size) -> nil
```
### set_cert

```ruby
instance.set_cert(Integer addr, Integer size) -> nil
```
### set_key

```ruby
instance.set_key(Integer addr, Integer size) -> nil
```
### verify_mode

```ruby
instance.verify_mode() -> Integer
```
### verify_mode=

```ruby
instance.verify_mode=(Integer mode) -> Integer
```
