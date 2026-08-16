---
title: class PSG::PRS::Compiler
keywords: PSG::PRS::Compiler
tags: [class]
summary: PSG::PRS::Compiler class of PicoRuby
sidebar: picoruby_sidebar
permalink: PSG_PRS_Compiler.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
PSG::PRS::Compiler.new(sequence_t sequence) -> void
```
### save

```ruby
PSG::PRS::Compiler.save(sequence_t sequence, String filename, ?songname: String) -> void
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
### sequence (reader)
```ruby
instance.sequence -> sequence_t
```
### songname (reader)
```ruby
instance.songname -> String
```
