---
title: class Shell::Pipeline::PipeIO
keywords: Shell::Pipeline::PipeIO
tags: [class]
summary: Shell::Pipeline::PipeIO class of PicoRuby
sidebar: picoruby_sidebar
permalink: Shell_Pipeline_PipeIO.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Shell::Pipeline::PipeIO.new() -> void
```
## Instance methods
### clear

```ruby
instance.clear() -> void
```
### each_line

```ruby
instance.each_line() { (String line) -> void } -> void
```
### empty?

```ruby
instance.empty?() -> bool
```
### flush

```ruby
instance.flush() -> self
```
### gets

```ruby
instance.gets() -> String?
```
### print

```ruby
instance.print(String str) -> void
```
### puts

```ruby
instance.puts(?String str) -> void
```
### write

```ruby
instance.write(String str) -> Integer
```
