---
title: class MIDIBASE::MML::Sequence
keywords: MIDIBASE::MML::Sequence
tags: [class]
summary: MIDIBASE::MML::Sequence class of PicoRuby
sidebar: picoruby_sidebar
permalink: MIDIBASE_MML_Sequence.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
MIDIBASE::MML::Sequence.new(Array[String] tracks, ?channels: Array[Integer]?, ?loop: bool, ?ppqn: Integer, ?time_signature: Array[Integer], ?exception: bool) -> void
```
## Instance methods
### next_event

```ruby
instance.next_event() -> timed_event_t?
```
### reset

```ruby
instance.reset() -> self
```
## Attr accessors
### ppqn (reader)
```ruby
instance.ppqn -> Integer
```
### time_signature (reader)
```ruby
instance.time_signature -> Array[Integer]
```
