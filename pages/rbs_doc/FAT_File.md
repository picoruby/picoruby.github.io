---
title: class FAT::File
keywords: FAT::File
tags: [class]
summary: FAT::File class of PicoRuby
sidebar: picoruby_sidebar
permalink: FAT_File.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
FAT::File.new(String path, String mode) -> void
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
### expand

```ruby
instance.expand(Integer size) -> Integer
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
### physical_address

```ruby
instance.physical_address() -> Integer
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
