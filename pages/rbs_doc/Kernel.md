---
title: module Kernel
keywords: Kernel
tags: [module]
summary: Kernel module of PicoRuby
sidebar: picoruby_sidebar
permalink: Kernel.html
folder: rbs_doc
---
## Instance methods (picoruby-eval)
### eval

```ruby
instance.eval(String code) -> Object
```
## Instance methods (picoruby-metaprog)
### caller

```ruby
instance.caller(?Integer start, ?Integer length) -> Array[String]
```
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
### gets

```ruby
instance.gets() -> String?
```
### system

```ruby
instance.system(String command) -> bool
```
## Instance methods
### each_line_from_files_or_stdin

```ruby
instance.each_line_from_files_or_stdin() { (String line) -> void } -> void
```
