---
title: class Module
keywords: Module
tags: [class]
summary: Module class of PicoRuby
sidebar: picoruby_sidebar
permalink: Module.html
folder: rbs_doc
---
## Instance methods
### const_defined?

```ruby
instance.const_defined?(String | Symbol name) -> bool
```
### const_set

```ruby
instance.const_set(String | Symbol name, untyped value) -> untyped
```
### define_method

```ruby
instance.define_method(String | Symbol symbol, ^() [self: instance] -> untyped method) -> Symbol
instance.define_method(String | Symbol symbol) { () [self: instance] -> untyped } -> Symbol
```
### include?

```ruby
instance.include?(Module mod) -> bool
```
