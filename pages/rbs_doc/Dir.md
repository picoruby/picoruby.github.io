---
title: Dir
keywords: Dir
tags: [class]
summary: Dir class of PicoRuby
sidebar: picoruby_sidebar
permalink: Dir.html
folder: rbs_doc
---
## Singleton methods
### chdir

```ruby
Dir.chdir(?path dir) -> 0
Dir.chdir[U] (?path dir) { (String dir) -> U } -> U
```
### delete

```ruby
Dir.delete(path dirname) -> 0
```
### empty?

```ruby
Dir.empty?(path path_name) -> bool
```
### exist?

```ruby
Dir.exist?(path) -> bool
```
### getwd

```ruby
Dir.getwd() -> String
```
### glob

```ruby
Dir.glob(path pattern, ?int flags, ?base: path?) -> Array[String]
Dir.glob(path pattern, ?int flags, ?base: path?) { (String pathname) -> void } -> nil
```
### mkdir

```ruby
Dir.mkdir(path) -> 0
```
### new

```ruby
Dir.new(path dir) -> VFS::dir_t
```
### open

```ruby
Dir.open(path dirname) -> VFS::dir_t
Dir.open[U] (path dirname) { (VFS::dir_t) -> U } -> VFS::dir_t
```
## Instance methods
### close

```ruby
instance.close() -> nil
```
### each

```ruby
instance.each() { (String) -> void } -> self
```
### findnext

```ruby
instance.findnext() -> String?
```
### pat=

```ruby
instance.pat=(path) -> path
```
### path

```ruby
instance.path() -> String?
```
### read

```ruby
instance.read() -> String?
```
### rewind

```ruby
instance.rewind() -> self
```
