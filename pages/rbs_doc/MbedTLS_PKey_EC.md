---
title: class MbedTLS::PKey::EC
keywords: MbedTLS::PKey::EC
tags: [class]
summary: MbedTLS::PKey::EC class of PicoRuby
sidebar: picoruby_sidebar
permalink: MbedTLS_PKey_EC.html
folder: rbs_doc
---
## Singleton methods
### generate

```ruby
MbedTLS::PKey::EC.generate(?String curve) -> MbedTLS::PKey::EC
```
### new

```ruby
MbedTLS::PKey::EC.new(String key) -> MbedTLS::PKey::EC
```
## Instance methods
### free

```ruby
instance.free() -> nil
```
### private?

```ruby
instance.private?() -> bool
```
### public?

```ruby
instance.public?() -> bool
```
### public_key

```ruby
instance.public_key() -> MbedTLS::PKey::PKeyBase
```
### to_pem

```ruby
instance.to_pem() -> String
```
