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
Sandbox.new(?bool suppress_error) -> instance
```
## Instance methods
### compile

```ruby
instance.compile(String) -> bool
```
### exec_mrb

```ruby
instance.exec_mrb(String) -> bool
```
### execute

```ruby
instance.execute() -> bool
```
### free_parser

```ruby
instance.free_parser() -> nil
```
### interrupt

```ruby
instance.interrupt() -> void
```
### load_file

```ruby
instance.load_file(String path, ?signal: bool) -> void
```
### result

```ruby
instance.result() -> untyped
```
### state

```ruby
instance.state() -> Integer
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
instance.wait(?timeout: (Integer|nil), ?signal: bool) -> bool
```
## Attr accessors
### error (accessor)
```ruby
instance.error -> Exception?
```
