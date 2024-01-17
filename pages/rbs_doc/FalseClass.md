---
title: FalseClass
keywords: FalseClass
tags: [class]
summary: FalseClass class of PicoRuby
sidebar: picoruby_sidebar
permalink: FalseClass.html
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
instance.===(false) -> true
instance.===(untyped obj) -> bool
```
### ^

```ruby
instance.^(false | nil) -> false
instance.^(untyped obj) -> bool
```
### to_s

```ruby
instance.to_s() -> "false"
```
### |

```ruby
instance.|(nil | false) -> false
instance.|(untyped obj) -> bool
```
