---
title: class Dir
keywords: Dir
tags: [class]
summary: Dir class of PicoRuby
sidebar: picoruby_sidebar
permalink: Dir.html
folder: rbs_doc
---
## Type aliases
### path_t
```ruby
String
```
## Singleton methods
### chdir

```ruby
Dir.chdir(?path_t dir) -> 0
Dir.chdir[U] (?path_t dir) { (path_t dir) -> U } -> U
```
### delete

```ruby
Dir.delete(path_t dirname) -> 0
```
### entries

```ruby
Dir.entries(String dir) -> Array[String]
```
### exist?

```ruby
Dir.exist?(path_t dirname) -> bool
```
### foreach

```ruby
Dir.foreach(String path) { (String path) -> untyped } -> nil
```
### getwd

```ruby
Dir.getwd() -> String
```
### glob

```ruby
Dir.glob(path_t pattern, ?int flags, ?base: path?) -> Array[String]
Dir.glob(path_t pattern, ?int flags, ?base: path?) { (String pathname) -> void } -> nil
```
### mkdir

```ruby
Dir.mkdir(path_t dirname, ?Integer mode) -> 0
```
### open

```ruby
Dir.open(path_t dirname) -> untyped
Dir.open[U] (path_t dirname) { (Dir dir) -> U } -> Dir
```
## Instance methods
### close

```ruby
instance.close() -> nil
```
### each

```ruby
instance.each() { (String item) -> untyped} -> self
```
### empty?

```ruby
instance.empty?() -> bool
```
### findnext

```ruby
instance.findnext() -> Dir
```
### pat=

```ruby
instance.pat=(String) -> String
```
### read

```ruby
instance.read() -> String?
```
### rewind

```ruby
instance.rewind() -> self
```
### seek

```ruby
instance.seek(Integer pos) -> 0
```
### tell

```ruby
instance.tell() -> Integer
```
