---
title: class DRb::DRbObject
keywords: DRb::DRbObject
tags: [class]
summary: DRb::DRbObject class of PicoRuby
sidebar: picoruby_sidebar
permalink: DRb_DRbObject.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
DRb::DRbObject.new(String uri, ?untyped? ref) -> void
```
### new_with_uri

```ruby
DRb::DRbObject.new_with_uri(String uri) -> DRbObject
```
## Instance methods
### ==

```ruby
instance.==(untyped other) -> bool
```
### eql?

```ruby
instance.eql?(untyped other) -> bool
```
### hash

```ruby
instance.hash() -> Integer
```
### method_missing

```ruby
instance.method_missing(Symbol msg_id, *untyped args) ?{ (*untyped) -> untyped } -> untyped
```
### respond_to_missing?

```ruby
instance.respond_to_missing?(Symbol msg_id, ?bool include_private) -> bool
```
## Attr accessors
### uri (reader)
```ruby
instance.uri -> String
```
### ref (reader)
```ruby
instance.ref -> untyped
```
