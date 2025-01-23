---
title: class MbedTLS::PKey::RSA
keywords: MbedTLS::PKey::RSA
tags: [class]
summary: MbedTLS::PKey::RSA class of PicoRuby
sidebar: picoruby_sidebar
permalink: MbedTLS_PKey_RSA.html
folder: rbs_doc
---
## Singleton methods
### generate

```ruby
MbedTLS::PKey::RSA.generate(Integer bits, ?Integer exponent) -> MbedTLS::PKey::RSA
```
### new

```ruby
MbedTLS::PKey::RSA.new(String key) -> MbedTLS::PKey::RSA
MbedTLS::PKey::RSA.new(Integer bits, ?Integer exponent) -> MbedTLS::PKey::RSA
```
## Instance methods
### private?

```ruby
instance.private?-> bool
```
### public?

```ruby
instance.public?-> bool
```
### public_key

```ruby
instance.public_key-> MbedTLS::PKey::PKeyBase
```
### to_pem

```ruby
instance.to_pem-> String
```
