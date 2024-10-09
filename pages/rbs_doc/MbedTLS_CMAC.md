---
title: class MbedTLS::CMAC
keywords: MbedTLS::CMAC
tags: [class]
summary: MbedTLS::CMAC class of PicoRuby
sidebar: picoruby_sidebar
permalink: MbedTLS_CMAC.html
folder: rbs_doc
---
## Type aliases
### digest_t
```ruby
"AES" | "aes"
```
## Singleton methods
### new

```ruby
MbedTLS::CMAC.new(String key, digest_t digest) -> MbedTLS::CMAC
```
## Instance methods
### digest

```ruby
instance.digest() -> String
```
### reset

```ruby
instance.reset() -> MbedTLS::CMAC
```
### update

```ruby
instance.update(String input) -> MbedTLS::CMAC
```
## Attr accessors
### _digest (accessor)
```ruby
instance._digest -> String
```
