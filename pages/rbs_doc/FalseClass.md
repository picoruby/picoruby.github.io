---
title: FalseClass
sidebar: picoruby_sidebar
permalink: FalseClass.html
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
===(false) -> true
===(untyped obj) -> bool
```
### ^

```ruby
^(false | nil) -> false
^(untyped obj) -> bool
```
### to_s

```ruby
to_s() -> "false"
```
### |

```ruby
|(nil | false) -> false
|(untyped obj) -> bool
```
