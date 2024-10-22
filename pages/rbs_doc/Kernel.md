---
title: module Kernel
keywords: Kernel
tags: [module]
summary: Kernel module of PicoRuby
sidebar: picoruby_sidebar
permalink: Kernel.html
folder: rbs_doc
---
## Instance methods
### p

```ruby
instance.p[T < _Inspect] (T arg0) -> T
instance.p(_Inspect arg0, _Inspect arg1, *_Inspect rest) -> _Inspect
instance.p() -> nil
```
### print

```ruby
instance.print(*_ToS args) -> nil
```
### printf

```ruby
instance.printf() -> nil
instance.printf(String fmt, *untyped args) -> nil
```
### puts

```ruby
instance.puts(*_ToS objects) -> nil
```
## Instance methods
### system

```ruby
instance.system(String command) -> bool
```
