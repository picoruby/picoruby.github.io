---
title: FAT::Dir
sidebar: picoruby_sidebar
permalink: FAT_Dir.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
FAT::Dir.new(String path) -> void
```
## Instance methods
### close

```ruby
instance.close-> nil
```
### findnext

```ruby
instance.findnext-> String?
```
### fullpath

```ruby
instance.fullpath-> String
```
### read

```ruby
instance.read-> String?
```
### rewind

```ruby
instance.rewind-> self
```
## Attr accessors
### pat (accessor)
```ruby
instance.pat -> String
```
