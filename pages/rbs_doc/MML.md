---
title: class MML
keywords: MML
tags: [class]
summary: MML class of PicoRuby
sidebar: picoruby_sidebar
permalink: MML.html
folder: rbs_doc
---
## Type aliases
### command_t
```ruby
:volume | :env_shape | :env_period | :legato | :lfo | :pan | :timbre | :mixer | :noise | :mute
```
### play_t
```ruby
:play
```
### segno_t
```ruby
:segno
```
### event_t
```ruby
[(play_t | segno_t | command_t), Integer, Integer]
```
## Singleton methods
### compile_multi

```ruby
MML.compile_multi(Array[String] tracks, ?exception: bool, ?loop: bool) { (Integer delta, Integer channel, command_t | play_t | segno_t command, *Integer args) -> untyped } -> Integer
```
### new

```ruby
MML.new(Integer track_id, String track, ?exception: bool, ?loop: bool) -> void
```
## Instance methods
### reduce_next

```ruby
instance.reduce_next() -> (event_t | nil)
```
## Attr accessors
### track_id (reader)
```ruby
instance.track_id -> Integer
```
