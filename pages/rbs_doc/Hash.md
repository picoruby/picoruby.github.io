---
title: Hash
sidebar: picoruby_sidebar
permalink: Hash.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Hash.new() -> void
Hash.new(untyped default) -> void
Hash.new[A, B] () { (Hash[A, B] hash, A key) -> B } -> void
```
## Instance methods
### <

```ruby
<[A, B] (::Hash[A, B]) -> bool
```
### <=

```ruby
<=[A, B] (::Hash[A, B]) -> bool
```
### ==

```ruby
==(untyped other) -> bool
```
### >

```ruby
>[A, B] (::Hash[A, B]) -> bool
```
### >=

```ruby
>=[A, B] (::Hash[A, B]) -> bool
```
### []

```ruby
[](K arg0) -> V
```
### []=

```ruby
[]=(K arg0, V arg1) -> V
```
### clear

```ruby
clear() -> self
```
### delete

```ruby
delete(K arg0) -> V?
```
### each

```ruby
each() { (K key, V val) -> untyped } -> self
```
### empty?

```ruby
empty?() -> bool
```
### has_key?

```ruby
has_key?(K arg0) -> bool
```
### has_value?

```ruby
has_value?(V arg0) -> bool
```
### inspect

```ruby
inspect() -> String
```
### key

```ruby
key(V) -> K?
```
### keys

```ruby
keys() -> ::Array[K]
```
### length

```ruby
length() -> Integer
```
### merge

```ruby
merge[A, B] (*::Hash[A, B] other_hashes) -> ::Hash[A | K, B | V]
merge[A, B, C] (*::Hash[A, B] other_hashes) { (K key, V oldval, B newval) -> C } -> ::Hash[A | K, B | V | C]
```
### merge!

```ruby
merge!(*::Hash[K, V] other_hashes) -> self
merge!(*::Hash[K, V] other_hashes) { (K key, V oldval, V newval) -> V } -> self
```
### shift

```ruby
shift() -> [ K, V ]?
```
### to_h

```ruby
to_h() -> Hash[K, V]
to_h[A, B] () { (K, V) -> [ A, B ] } -> Hash[A, B]
```
### values

```ruby
values() -> ::Array[V]
```
