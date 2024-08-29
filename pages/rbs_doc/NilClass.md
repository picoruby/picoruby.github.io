---
title: class NilClass
keywords: NilClass
tags: [class]
summary: NilClass class of PicoRuby
sidebar: picoruby_sidebar
permalink: NilClass.html
folder: rbs_doc
---
## Instance methods
### !

```ruby
instance.!() -> true
```
### &

```ruby
instance.&(untyped obj) -> false
```
### ===

```ruby
instance.===(nil) -> true
instance.===(untyped obj) -> bool
```
### ^

```ruby
instance.^(false | nil) -> false
instance.^(untyped obj) -> bool
```
### inspect

```ruby
instance.inspect() -> "nil"
```
### nil?

```ruby
instance.nil?() -> true
```
### to_f

```ruby
instance.to_f() -> Float
```
### to_h

```ruby
instance.to_h() -> {}
```
### to_i

```ruby
instance.to_i() -> 0
```
### to_s

```ruby
instance.to_s() -> ""
```
### |

```ruby
instance.|(nil | false) -> false
instance.|(untyped obj) -> bool
```
