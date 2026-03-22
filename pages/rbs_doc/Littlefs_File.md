---
title: class Littlefs::File
keywords: Littlefs::File
tags: [class]
summary: Littlefs::File class of PicoRuby
sidebar: picoruby_sidebar
permalink: Littlefs_File.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Littlefs::File.new(String path, String mode) -> File
```
## Instance methods
### close

```ruby
instance.close() -> nil
```
### each_line

```ruby
instance.each_line() { (String) -> void } -> nil
```
### eof?

```ruby
instance.eof?() -> bool
```
### fsync

```ruby
instance.fsync() -> 0
```
### getbyte

```ruby
instance.getbyte() -> (Integer | nil)
```
### gets

```ruby
instance.gets() -> String?
```
### puts

```ruby
instance.puts(*String) -> nil
```
### read

```ruby
instance.read(?Integer size) -> String?
```
### sector_size

```ruby
instance.sector_size() -> Integer
```
### seek

```ruby
instance.seek(Integer offset, ?Integer whence) -> 0
```
### size

```ruby
instance.size() -> Integer
```
### tell

```ruby
instance.tell() -> Integer
```
### write

```ruby
instance.write(String data) -> Integer
```
