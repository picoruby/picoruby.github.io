---
title: class Sandbox
keywords: Sandbox
tags: [class]
summary: Sandbox class of PicoRuby
sidebar: picoruby_sidebar
permalink: Sandbox.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Sandbox.new(?String name) -> instance
```
## Instance methods
### compile

```ruby
instance.compile(String script, ?remove_lv: bool) -> bool
```
### compile_from_memory

```ruby
instance.compile_from_memory(Integer address, Integer size, ?remove_lv: bool) -> bool
```
### exec_mrb

```ruby
instance.exec_mrb(String mrb) -> bool
```
### exec_mrb_from_memory

```ruby
instance.exec_mrb_from_memory(Integer address) -> bool
```
### execute

```ruby
instance.execute() -> bool
```
### free_parser

```ruby
instance.free_parser() -> nil
```
### load_file

```ruby
instance.load_file(String path, ?join: bool) -> void
```
### result

```ruby
instance.result() -> untyped
```
### state

```ruby
instance.state() -> (Integer | Symbol)
```
### stop

```ruby
instance.stop() -> void
```
### suspend

```ruby
instance.suspend() -> nil
```
### terminate

```ruby
instance.terminate() -> nil
```
### wait

```ruby
instance.wait(?timeout: (Integer|nil)) -> bool
```
## Attr accessors
### error (accessor)
```ruby
instance.error -> Exception?
```
