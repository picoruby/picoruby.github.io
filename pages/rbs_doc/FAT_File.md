---
title: FAT::File
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
close() -> nil
```
### each_line

```ruby
each_line() { (String) -> void } -> nil
```
### eof?

```ruby
eof?() -> bool
```
### expand

```ruby
expand(Integer size) -> Integer
```
### fsync

```ruby
fsync() -> 0
```
### gets

```ruby
gets() -> String?
```
### puts

```ruby
puts(*String) -> nil
```
### read

```ruby
read(?Integer size) -> String
```
### seek

```ruby
seek(Integer offset, ?Integer whence) -> 0
```
### size

```ruby
size() -> Integer
```
### tell

```ruby
tell() -> Integer
```
### write

```ruby
write(String data) -> Integer
```
