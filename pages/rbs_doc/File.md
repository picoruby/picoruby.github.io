---
title: class File
keywords: File
tags: [class]
summary: File class of PicoRuby
sidebar: picoruby_sidebar
permalink: File.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
File.new(String | Integer fd_or_path, ?String mode, ?Integer perm) -> File
File.new[T] (String | Integer fd_or_path, ?String mode, ?Integer perm) { (File) -> T } -> T
```
## Singleton methods
### contiguous?

```ruby
File.contiguous?(String path) -> bool
```
## Instance methods
### expand

```ruby
instance.expand(Integer size) -> Integer
```
### physical_address

```ruby
instance.physical_address() -> Integer
```
### sector_size

```ruby
instance.sector_size() -> Integer
```
