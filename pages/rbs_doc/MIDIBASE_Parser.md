---
title: class MIDIBASE::Parser
keywords: MIDIBASE::Parser
tags: [class]
summary: MIDIBASE::Parser class of PicoRuby
sidebar: picoruby_sidebar
permalink: MIDIBASE_Parser.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
MIDIBASE::Parser.new(?max_sysex_bytes: Integer) -> void
```
## Instance methods
### feed

```ruby
instance.feed(Integer byte) -> event_t?
```
### reset

```ruby
instance.reset() -> self
```
