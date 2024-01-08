---
title: Range
sidebar: picoruby_sidebar
permalink: Range.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Range.new(Elem from, Elem to, ?boolish exclude_end) -> void
```
## Instance methods
### ==

```ruby
instance.==(untyped obj) -> bool
```
### ===

```ruby
instance.===(untyped obj) -> bool
```
### each

```ruby
instance.each[Elem] () { (Elem arg0) -> untyped } -> self
```
### exclude_end?

```ruby
instance.exclude_end?() -> bool
```
### first

```ruby
instance.first() -> Elem
instance.first(Integer n) -> ::Array[Elem]
```
### inspect

```ruby
instance.inspect() -> String
```
### last

```ruby
instance.last() -> Elem
instance.last(Integer n) -> ::Array[Elem]
```
### to_s

```ruby
instance.to_s() -> String
```
