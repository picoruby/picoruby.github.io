---
title: class JSON::Digger
keywords: JSON::Digger
tags: [class]
summary: JSON::Digger class of PicoRuby
sidebar: picoruby_sidebar
permalink: JSON_Digger.html
folder: rbs_doc
---
## Include
[Common](Common.html)
## Type aliases
### dig_key_t
```ruby
String | Integer
```
### stack_t
```ruby
:array | :object
```
## Singleton methods
### new

```ruby
JSON::Digger.new(String) -> void
```
## Instance methods
### dig

```ruby
instance.dig(*dig_key_t) -> self
```
### parse

```ruby
instance.parse() -> untyped
```
