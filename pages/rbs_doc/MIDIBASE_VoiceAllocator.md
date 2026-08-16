---
title: class MIDIBASE::VoiceAllocator
keywords: MIDIBASE::VoiceAllocator
tags: [class]
summary: MIDIBASE::VoiceAllocator class of PicoRuby
sidebar: picoruby_sidebar
permalink: MIDIBASE_VoiceAllocator.html
folder: rbs_doc
---
## Type aliases
### voice_t
```ruby
[Router::source_t, Integer, Integer, Integer, Integer]
```
## Singleton methods
### new

```ruby
MIDIBASE::VoiceAllocator.new(?Integer voice_count) -> void
```
## Instance methods
### allocate

```ruby
instance.allocate(Integer channel, Integer note, ?source: Router::source_t, ?priority: Integer, ?voice_ids: Array[Integer]?) -> Integer?
```
### entry

```ruby
instance.entry(Integer id) -> voice_t?
```
### release

```ruby
instance.release(Integer channel, Integer note, ?source: Router::source_t) -> Integer?
```
### release_all

```ruby
instance.release_all() -> self
```
### reserve

```ruby
instance.reserve(Integer id, Integer channel, Integer note, ?source: Router::source_t, ?priority: Integer) -> Integer?
```
### voice_for

```ruby
instance.voice_for(Integer channel, Integer note, ?source: Router::source_t) -> Integer?
```
## Attr accessors
### voice_count (reader)
```ruby
instance.voice_count -> Integer
```
### last_stolen (reader)
```ruby
instance.last_stolen -> voice_t?
```
