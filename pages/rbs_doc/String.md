---
title: class String
keywords: String
tags: [class]
summary: String class of PicoRuby
sidebar: picoruby_sidebar
permalink: String.html
folder: rbs_doc
---
## Instance methods
### prettyprint

```ruby
instance.prettyprint() -> nil
```
## Instance methods (picoruby-regexp)
### __charlen_at

```ruby
instance.__charlen_at(String str, Integer byte_pos) -> Integer
```
### __regexp_for

```ruby
instance.__regexp_for(untyped pattern) -> Regexp
```
### __scan

```ruby
instance.__scan(Regexp re) -> Array[untyped]
```
### __split

```ruby
instance.__split(Regexp re, Integer limit) -> Array[String]
```
### __split_str

```ruby
instance.__split_str(*untyped args) -> Array[String]
```
### __sub

```ruby
instance.__sub(Regexp re, String replacement, bool global) -> String?
```
### __sub_common

```ruby
instance.__sub_common(untyped pattern, Array[untyped] args, Proc? block, bool global) -> String?
```
### __sub_each

```ruby
instance.__sub_each(Regexp re, bool global) { (String matched) -> String } -> String?
```
## Instance methods
### bit_clear

```ruby
instance.bit_clear(Integer offset, ?lsb_first: bool) -> String
```
### bit_count

```ruby
instance.bit_count() -> Integer
```
### bit_flip

```ruby
instance.bit_flip(Integer offset, ?lsb_first: bool) -> String
```
### bit_get

```ruby
instance.bit_get(Integer offset, ?lsb_first: bool) -> Integer?
```
### bit_set

```ruby
instance.bit_set(Integer offset, ?lsb_first: bool) -> String
```
### bit_set?

```ruby
instance.bit_set?(Integer offset, ?lsb_first: bool) -> bool?
```
### bitwise_and

```ruby
instance.bitwise_and(String other) -> String
```
### bitwise_and!

```ruby
instance.bitwise_and!(String other) -> String
```
### bitwise_not

```ruby
instance.bitwise_not() -> String
```
### bitwise_not!

```ruby
instance.bitwise_not!() -> String
```
### bitwise_or

```ruby
instance.bitwise_or(String other) -> String
```
### bitwise_or!

```ruby
instance.bitwise_or!(String other) -> String
```
### bitwise_xor

```ruby
instance.bitwise_xor(String other) -> String
```
### bitwise_xor!

```ruby
instance.bitwise_xor!(String other) -> String
```
