---
title: class JWT::Decoder
keywords: JWT::Decoder
tags: [class]
summary: JWT::Decoder class of PicoRuby
sidebar: picoruby_sidebar
permalink: JWT_Decoder.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
JWT::Decoder.new(String token, key_t key, String algorithm) -> void
```
## Instance methods
### verify_hmac

```ruby
instance.verify_hmac() -> nil
```
### verify_rsa

```ruby
instance.verify_rsa() -> nil
```
## Attr accessors
### header (reader)
```ruby
instance.header -> Hash[String, Object]
```
### payload (reader)
```ruby
instance.payload -> Hash[String, Object]
```
