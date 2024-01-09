---
title: Hash
sidebar: picoruby_sidebar
permalink: Hash.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Hash.new() -> instance
Hash.new(untyped default) -> instance
```
## Instance methods
### <

```ruby
instance.<[A, B] (::Hash[A, B]) -> bool
```
### <=

```ruby
instance.<=[A, B] (::Hash[A, B]) -> bool
```
### ==

```ruby
instance.==(untyped other) -> bool
```
### >

```ruby
instance.>[A, B] (::Hash[A, B]) -> bool
```
### >=

```ruby
instance.>=[A, B] (::Hash[A, B]) -> bool
```
### []

```ruby
instance.[](K arg0) -> V
```
### []=

```ruby
instance.[]=(K arg0, V arg1) -> V
```
### clear

```ruby
instance.clear() -> self
```
### delete

```ruby
instance.delete(K arg0) -> V?
```
### each

```ruby
instance.each() { (K key, V val) -> untyped } -> self
```
### empty?

```ruby
instance.empty?() -> bool
```
### has_key?

```ruby
instance.has_key?(K arg0) -> bool
```
### has_value?

```ruby
instance.has_value?(V arg0) -> bool
```
### inspect

```ruby
instance.inspect() -> String
```
### key

```ruby
instance.key(V) -> K?
```
### keys

```ruby
instance.keys() -> ::Array[K]
```
### length

```ruby
instance.length() -> Integer
```
### merge

```ruby
instance.merge[A, B] (*::Hash[A, B] other_hashes) -> ::Hash[A | K, B | V]
instance.merge[A, B, C] (*::Hash[A, B] other_hashes) { (K key, V oldval, B newval) -> C } -> ::Hash[A | K, B | V | C]
```
### merge!

```ruby
instance.merge!(*::Hash[K, V] other_hashes) -> self
instance.merge!(*::Hash[K, V] other_hashes) { (K key, V oldval, V newval) -> V } -> self
```
### shift

```ruby
instance.shift() -> [ K, V ]?
```
### to_h

```ruby
instance.to_h() -> Hash[K, V]
instance.to_h[A, B] () { (K, V) -> [ A, B ] } -> Hash[A, B]
```
### values

```ruby
instance.values() -> ::Array[V]
```
