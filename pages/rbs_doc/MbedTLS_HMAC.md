---
title: class MbedTLS::HMAC
keywords: MbedTLS::HMAC
tags: [class]
summary: MbedTLS::HMAC class of PicoRuby
sidebar: picoruby_sidebar
permalink: MbedTLS_HMAC.html
folder: rbs_doc
---
## Type aliases
### digest_t
```ruby
"SHA256" | "sha256"
```
## Instance methods
### digest

```ruby
instance.digest() -> String
```
### hexdigest

```ruby
instance.hexdigest() -> String
```
### initialze

```ruby
instance.initialze(String key, digest_t digest) -> void
```
### reset

```ruby
instance.reset() -> MbedTLS::HMAC
```
### update

```ruby
instance.update(String input) -> MbedTLS::HMAC
```
## Attr accessors
### _digest (accessor)
```ruby
instance._digest -> String
```
