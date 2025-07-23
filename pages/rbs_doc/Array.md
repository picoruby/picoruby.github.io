---
title: class Array
keywords: Array
tags: [class]
summary: Array class of PicoRuby
sidebar: picoruby_sidebar
permalink: Array.html
folder: rbs_doc
---
## Instance methods (picoruby-editor)
### insert

```ruby
instance.insert(Integer index, *Elem) -> void
```
## Instance methods (picoruby-pack)
### pack

```ruby
instance.pack(String format) -> String
```
## Include
[Enumerable](Enumerable.html)
## Singleton methods
### new

```ruby
Array.new() -> instance
Array.new(::Array[Elem] ary) -> instance
Array.new(int size, ?Elem val) -> instance
```
## Instance methods
### &

```ruby
instance.&(::Array[untyped]) -> ::Array[Elem]
```
### *

```ruby
instance.*(string str) -> ::String
instance.*(int int) -> ::Array[Elem]
```
### +

```ruby
instance.+[U] (Array[U]) -> ::Array[Elem | U]
```
### -

```ruby
instance.-[U] (Array[U]) -> ::Array[Elem]
```
### <<

```ruby
instance.<<(Elem) -> self
```
### <=>

```ruby
instance.<=>(untyped) -> ::Integer?
```
### ==

```ruby
instance.==(untyped other) -> bool
```
### []

```ruby
instance.[](int index) -> Elem
instance.[](int start, int length) -> ::Array[Elem]?
instance.[](::Range[::Integer?]) -> ::Array[Elem]?
```
### []=

```ruby
instance.[]=(int index, Elem obj) -> Elem
instance.[]=(int start, int length, Elem obj) -> Elem
instance.[]=(int start, int length, ::Array[Elem]) -> ::Array[Elem]
instance.[]=(int start, int length, nil) -> nil
instance.[]=(::Range[::Integer?], Elem obj) -> Elem
instance.[]=(::Range[::Integer?], ::Array[Elem]) -> ::Array[Elem]
instance.[]=(::Range[::Integer?], nil) -> nil
```
### all?

```ruby
instance.all?() -> bool
instance.all?() { (Elem obj) -> boolish } -> bool
```
### at

```ruby
instance.at(int index) -> Elem?
```
### clear

```ruby
instance.clear() -> self
```
### collect!

```ruby
instance.collect!() { (Elem item) -> Elem } -> self
```
### count

```ruby
instance.count() -> ::Integer
instance.count(Elem obj) -> ::Integer
instance.count() { (Elem) -> boolish } -> ::Integer
```
### delete_at

```ruby
instance.delete_at(int index) -> Elem?
```
### delete_if

```ruby
instance.delete_if() { (Elem item) -> boolish } -> self
```
### each

```ruby
instance.each() { (Elem item) -> void } -> self
```
### each_index

```ruby
instance.each_index() { (::Integer index) -> void } -> self
```
### empty?

```ruby
instance.empty?() -> bool
```
### find_index

```ruby
instance.find_index(untyped obj) -> ::Integer?
instance.find_index() { (Elem item) -> boolish } -> ::Integer?
```
### first

```ruby
instance.first() -> Elem?
instance.first(int n) -> ::Array[Elem]
```
### flatten

```ruby
instance.flatten() -> ::Array[Elem]
```
### include?

```ruby
instance.include?(Elem object) -> bool
```
### inspect

```ruby
instance.inspect() -> String
```
### join

```ruby
instance.join(?string separator) -> String
```
### last

```ruby
instance.last() -> Elem?
instance.last(int n) -> ::Array[Elem]
```
### length

```ruby
instance.length() -> ::Integer
```
### max

```ruby
instance.max() -> Elem?
instance.max() { (Elem a, Elem b) -> ::Integer? } -> Elem?
instance.max(int n) -> ::Array[Elem]
instance.max(int n) { (Elem a, Elem b) -> ::Integer? } -> ::Array[Elem]
```
### pop

```ruby
instance.pop() -> Elem?
instance.pop(int n) -> ::Array[Elem]
```
### push

```ruby
instance.push(*Elem obj) -> self
```
### reject

```ruby
instance.reject() { (Elem item) -> boolish } -> ::Array[Elem]
```
### reject!

```ruby
instance.reject!() { (Elem item) -> boolish } -> self
```
### shift

```ruby
instance.shift() -> Elem?
instance.shift(int n) -> ::Array[Elem]
```
### sort

```ruby
instance.sort() -> ::Array[Elem]
instance.sort() { (Elem a, Elem b) -> ::Integer } -> ::Array[Elem]
```
### sort!

```ruby
instance.sort!() -> self
instance.sort!() { (Elem a, Elem b) -> ::Integer } -> self
```
### uniq

```ruby
instance.uniq() -> ::Array[Elem]
```
### uniq!

```ruby
instance.uniq!() -> self
```
### unshift

```ruby
instance.unshift(*Elem obj) -> self
```
### |

```ruby
instance.|[T] (::Array[T] other_ary) -> ::Array[Elem | T]
```
