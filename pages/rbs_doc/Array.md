---
title: Array
sidebar: picoruby_sidebar
permalink: Array.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Array.new() -> void
Array.new(::Array[Elem] ary) -> void
Array.new(int size, ?Elem val) -> void
Array.new(int size) { (::Integer index) -> Elem } -> void
```
## Instance methods
### &

```ruby
&(::Array[untyped]) -> ::Array[Elem]
```
### *

```ruby
*(string str) -> ::String
*(int int) -> ::Array[Elem]
```
### +

```ruby
+[U] (Array[U]) -> ::Array[Elem | U]
```
### -

```ruby
-[U] (Array[U]) -> ::Array[Elem]
```
### <<

```ruby
<<(Elem) -> self
```
### <=>

```ruby
<=>(untyped) -> ::Integer?
```
### ==

```ruby
==(untyped other) -> bool
```
### []

```ruby
[](int index) -> Elem
[](int start, int length) -> ::Array[Elem]?
```
### []=

```ruby
[]=(int index, Elem obj) -> Elem
[]=(int start, int length, Elem obj) -> Elem
[]=(int start, int length, ::Array[Elem]) -> ::Array[Elem]
[]=(int start, int length, nil) -> nil
[]=(::Range[::Integer?], Elem obj) -> Elem
[]=(::Range[::Integer?], ::Array[Elem]) -> ::Array[Elem]
[]=(::Range[::Integer?], nil) -> nil
```
### all?

```ruby
all?() -> bool
all?() { (Elem obj) -> boolish } -> bool
```
### at

```ruby
at(int index) -> Elem?
```
### clear

```ruby
clear() -> self
```
### collect

```ruby
collect[U] () { (Elem item) -> U } -> ::Array[U]
```
### collect!

```ruby
collect!() { (Elem item) -> Elem } -> self
```
### count

```ruby
count() -> ::Integer
count(Elem obj) -> ::Integer
count() { (Elem) -> boolish } -> ::Integer
```
### delete_at

```ruby
delete_at(int index) -> Elem?
```
### delete_if

```ruby
delete_if() { (Elem item) -> boolish } -> self
```
### each

```ruby
each() { (Elem item) -> void } -> self
```
### each_index

```ruby
each_index() { (::Integer index) -> void } -> self
```
### each_with_index

```ruby
each_with_index() { (Elem item, ::Integer index) -> void } -> self
```
### empty?

```ruby
empty?() -> bool
```
### fetch

```ruby
fetch(int index) -> Elem
```
### find_index

```ruby
find_index(untyped obj) -> ::Integer?
find_index() { (Elem item) -> boolish } -> ::Integer?
```
### first

```ruby
first() -> Elem?
first(int n) -> ::Array[Elem]
```
### flatten

```ruby
flatten() -> ::Array[Elem]
```
### include?

```ruby
include?(Elem object) -> bool
```
### insert

```ruby
insert(Integer index, *Elem) -> void
```
### inspect

```ruby
inspect() -> String
```
### join

```ruby
join(?string separator) -> String
```
### last

```ruby
last() -> Elem?
last(int n) -> ::Array[Elem]
```
### length

```ruby
length() -> ::Integer
```
### max

```ruby
max() -> Elem?
max() { (Elem a, Elem b) -> ::Integer? } -> Elem?
max(int n) -> ::Array[Elem]
max(int n) { (Elem a, Elem b) -> ::Integer? } -> ::Array[Elem]
```
### pop

```ruby
pop() -> Elem?
pop(int n) -> ::Array[Elem]
```
### push

```ruby
push(*Elem obj) -> self
```
### shift

```ruby
shift() -> Elem?
shift(int n) -> ::Array[Elem]
```
### sort

```ruby
sort() -> ::Array[Elem]
sort() { (Elem a, Elem b) -> ::Integer } -> ::Array[Elem]
```
### sort!

```ruby
sort!() -> self
sort!() { (Elem a, Elem b) -> ::Integer } -> self
```
### unshift

```ruby
unshift(*Elem obj) -> self
```
### |

```ruby
|[T] (::Array[T] other_ary) -> ::Array[Elem | T]
```
