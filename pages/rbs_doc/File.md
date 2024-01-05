---
title: File
sidebar: picoruby_sidebar
permalink: File.html
folder: rbs_doc
---
## Singleton methods
### chmod

```ruby
File.chmod(Integer mode, *string) -> Integer
```
### directory?

```ruby
File.directory?(string) -> bool
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
### new

```ruby
File.new(string, ?string mode) -> void
```
### open

```ruby
File.open(string, ?string | int mode) -> VFS::file_t
File.open[T] (string, ?string | int mode) { (VFS::file_t) -> T } -> VFS::file_t
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
fsync() -> Integer
```
### gets

```ruby
gets(*(Integer|String) args, ?chomp: bool) -> String?
```
### path

```ruby
path() -> String
```
### printf

```ruby
printf(String format, *String string) -> nil
```
### putc

```ruby
putc(String | Integer ch) -> (String | Integer)
```
### puts

```ruby
puts(*String string) -> nil
```
### read

```ruby
read(?Integer length, ?String outbuf) -> String?
```
### rewind

```ruby
rewind() -> Integer
```
### seek

```ruby
seek(Integer offset, ?Integer whence) -> Integer
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
write(*String string) -> Integer
```
