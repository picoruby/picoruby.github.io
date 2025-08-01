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
## Instance methods (picoruby-metaprog)
### caller

```ruby
instance.caller(?Integer start, ?Integer length) -> Array[String]
```
### eval

```ruby
instance.eval(String code) -> nil
```
## Instance methods (picoruby-require)
### load

```ruby
instance.load(String path) -> bool
```
### require

```ruby
instance.require(String name) -> bool
```
## Instance methods
### system

```ruby
instance.system(String command) -> bool
```
