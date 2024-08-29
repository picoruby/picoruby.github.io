---
title: class FAT::Stat
keywords: FAT::Stat
tags: [class]
summary: FAT::Stat class of PicoRuby
sidebar: picoruby_sidebar
permalink: FAT_Stat.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
FAT::Stat.new(String device, String path) -> instance
```
## Instance methods
### birthtime

```ruby
instance.birthtime() -> untyped
```
### directory?

```ruby
instance.directory?() -> bool
```
### mode

```ruby
instance.mode() -> Integer
```
### mode_str

```ruby
instance.mode_str() -> String
```
### mtime

```ruby
instance.mtime() -> Time
```
### size

```ruby
instance.size() -> Integer
```
### writable?

```ruby
instance.writable?() -> bool
```
