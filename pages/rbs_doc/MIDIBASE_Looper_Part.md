---
title: class MIDIBASE::Looper::Part
keywords: MIDIBASE::Looper::Part
tags: [class]
summary: MIDIBASE::Looper::Part class of PicoRuby
sidebar: picoruby_sidebar
permalink: MIDIBASE_Looper_Part.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
MIDIBASE::Looper::Part.new(Symbol id, bars: Integer) -> void
```
## Instance methods
### copy

```ruby
instance.copy(Symbol id) -> Part
```
## Attr accessors
### id (reader)
```ruby
instance.id -> Symbol
```
### tracks (reader)
```ruby
instance.tracks -> Array[Track]
```
### bars (accessor)
```ruby
instance.bars -> Integer
```
