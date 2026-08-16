---
title: class MIDIBASE::MML::Parser
keywords: MIDIBASE::MML::Parser
tags: [class]
summary: MIDIBASE::MML::Parser class of PicoRuby
sidebar: picoruby_sidebar
permalink: MIDIBASE_MML_Parser.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
MIDIBASE::MML::Parser.new(String track, channel: Integer, ?ppqn: Integer, ?loop: bool, ?exception: bool) -> void
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
