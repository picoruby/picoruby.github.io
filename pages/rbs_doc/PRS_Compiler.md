---
title: class PRS::Compiler
keywords: PRS::Compiler
tags: [class]
summary: PRS::Compiler class of PicoRuby
sidebar: picoruby_sidebar
permalink: PRS_Compiler.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
PRS::Compiler.new() -> void
```
### save

```ruby
PRS::Compiler.save(Array[String] tracks, String filename, ?songname: String) -> void
```
## Instance methods
### save_to

```ruby
instance.save_to(String filename) -> void
```
### songname=

```ruby
instance.songname=(String name) -> String
```
## Attr accessors
### tracks (accessor)
```ruby
instance.tracks -> Array[String]
```
### songname (reader)
```ruby
instance.songname -> String
```
