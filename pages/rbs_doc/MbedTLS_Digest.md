---
title: class MbedTLS::Digest
keywords: MbedTLS::Digest
tags: [class]
summary: MbedTLS::Digest class of PicoRuby
sidebar: picoruby_sidebar
permalink: MbedTLS_Digest.html
folder: rbs_doc
---
## Type aliases
### algorithm_t
```ruby
:none | :sha256
```
## Singleton methods
### new

```ruby
MbedTLS::Digest.new(algorithm_t algorithm) -> void
```
## Instance methods
### finish

```ruby
instance.finish() -> String
```
### free

```ruby
instance.free() -> self
```
### update

```ruby
instance.update(String input) -> MbedTLS::Digest
```
