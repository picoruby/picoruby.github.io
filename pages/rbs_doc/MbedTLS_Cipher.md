---
title: MbedTLS::Cipher
keywords: MbedTLS::Cipher
tags: [class]
summary: MbedTLS::Cipher class of PicoRuby
sidebar: picoruby_sidebar
permalink: MbedTLS_Cipher.html
folder: rbs_doc
---
## Singleton methods
### _init_ctx

```ruby
MbedTLS::Cipher._init_ctx(Integer, String, Integer) -> MbedTLS::Cipher
```
### new

```ruby
MbedTLS::Cipher.new(untyped cipher_suite, untyped key, untyped operation) -> MbedTLS::Cipher
```
## Instance methods
### check_tag

```ruby
instance.check_tag(String) -> bool
```
### finish

```ruby
instance.finish() -> String
```
### update

```ruby
instance.update(String) -> String
```
### update_ad

```ruby
instance.update_ad(String) -> MbedTLS::Cipher
```
### write_tag

```ruby
instance.write_tag() -> String
```
