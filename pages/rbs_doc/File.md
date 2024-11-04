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
### basename

```ruby
File.basename(String filename) -> String
```
### chmod

```ruby
File.chmod(Integer mode, *string) -> Integer
```
### directory?

```ruby
File.directory?(string) -> bool
```
### dirname

```ruby
File.dirname(String filename) -> String
```
### exist?

```ruby
File.exist?(string) -> bool
```
### expand_path

```ruby
File.expand_path(string, ?string) -> String
```
### file?

```ruby
File.file?(string) -> bool
```
### join

```ruby
File.join(*String parts) -> String
```
### new

```ruby
File.new(string fd_or_path, ?string mode, ?int perm) -> File
File.new[T] (string fd_or_path, ?string mode, ?int perm) { (untyped) -> T } -> untyped
```
### open

```ruby
File.open(string, ?string) -> File
File.open[T] (string, ?string) { (untyped) -> T } -> untyped
```
### rename

```ruby
File.rename(string, string) -> 0
```
### unlink

```ruby
File.unlink(*string) -> Integer
```
### utime

```ruby
File.utime(Time atime, Time mtime, *string) -> Integer
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
instance.fsync() -> Integer
```
### gets

```ruby
instance.gets(*(Integer|String) args, ?chomp: bool) -> String?
```
### path

```ruby
instance.path() -> String
```
### printf

```ruby
instance.printf(String format, *String string) -> nil
```
### putc

```ruby
instance.putc(String | Integer ch) -> (String | Integer)
```
### puts

```ruby
instance.puts(*String string) -> nil
```
### read

```ruby
instance.read(?Integer length, ?String outbuf) -> String?
```
### rewind

```ruby
instance.rewind() -> Integer
```
### seek

```ruby
instance.seek(Integer offset, ?Integer whence) -> Integer
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
instance.write(*String string) -> Integer
```
