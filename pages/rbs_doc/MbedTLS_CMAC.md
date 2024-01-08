---
title: MbedTLS::CMAC
sidebar: picoruby_sidebar
permalink: MbedTLS_CMAC.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
MbedTLS::CMAC.new(untyped key, String digest) -> MbedTLS::CMAC
```
## Instance methods
### digest

```ruby
instance.digest-> String
```
### reset

```ruby
instance.reset-> MbedTLS::CMAC
```
### update

```ruby
instance.update(String) -> MbedTLS::CMAC
```
## Attr accessors
### _digest (accessor)
```ruby
instance._digest -> String
```
