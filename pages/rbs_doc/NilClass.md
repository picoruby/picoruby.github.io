---
title: NilClass
sidebar: picoruby_sidebar
permalink: NilClass.html
folder: rbs_doc
---
## Instance methods
### !

```ruby
!() -> true
```
### &

```ruby
&(untyped obj) -> false
```
### ===

```ruby
===(nil) -> true
===(untyped obj) -> bool
```
### ^

```ruby
^(false | nil) -> false
^(untyped obj) -> bool
```
### inspect

```ruby
inspect() -> "nil"
```
### nil?

```ruby
nil?() -> true
```
### to_f

```ruby
to_f() -> Float
```
### to_h

```ruby
to_h() -> {}
```
### to_i

```ruby
to_i() -> 0
```
### to_s

```ruby
to_s() -> ""
```
### |

```ruby
|(nil | false) -> false
|(untyped obj) -> bool
```
