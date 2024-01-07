---
title: Sandbox
sidebar: picoruby_sidebar
permalink: Sandbox.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Sandbox.new(?bool suppress_error) -> void
```
## Instance methods
### compile

```ruby
compile(String) -> bool
```
### exec_mrb

```ruby
exec_mrb(String) -> bool
```
### execute

```ruby
execute() -> bool
```
### free_parser

```ruby
free_parser() -> void
```
### interrupt

```ruby
interrupt() -> void
```
### load_file

```ruby
load_file(String, ?signal: bool) -> void
```
### result

```ruby
result() -> untyped
```
### state

```ruby
state() -> Integer
```
### suspend

```ruby
suspend() -> void
```
### wait

```ruby
wait(?timeout: (Integer|nil), ?signal: bool) -> bool
```
## Attr accessors
### error (accessor)
```ruby
Exception?
```
