---
title: class File::Stat
keywords: File::Stat
tags: [class]
summary: File::Stat class of PicoRuby
sidebar: picoruby_sidebar
permalink: File_Stat.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
File::Stat.new(String file) -> instance
```
## Instance methods
### birthtime

```ruby
instance.birthtime() -> (Time | nil)
```
### directory?

```ruby
instance.directory?() -> bool
```
### mode

```ruby
instance.mode() -> (Integer | nil)
```
### mode_str

```ruby
instance.mode_str() -> (String | nil)
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
instance.writable?() -> boolish
```
