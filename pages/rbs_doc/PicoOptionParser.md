---
title: class PicoOptionParser
keywords: PicoOptionParser
tags: [class]
summary: PicoOptionParser class of PicoRuby
sidebar: picoruby_sidebar
permalink: PicoOptionParser.html
folder: rbs_doc
---
## Type aliases
### opt_type
```ruby
:string | :integer | :symbol | :boolean
```
## Singleton methods
### new

```ruby
PicoOptionParser.new() -> void
```
## Instance methods
### flag

```ruby
instance.flag(*String names, ?default: untyped, ?desc: String?, ?help: bool, ?key: Symbol?) -> void
```
### on

```ruby
instance.on(*String names, ?type: opt_type, ?choices: Array[untyped]?, ?default: untyped, ?desc: String?, ?key: Symbol?) -> void
```
### parse

```ruby
instance.parse(Array[String] args) -> (Result | Symbol)
```
### usage

```ruby
instance.usage(String program) -> String
```
