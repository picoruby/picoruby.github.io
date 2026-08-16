---
title: class PSG::MIDIController
keywords: PSG::MIDIController
tags: [class]
summary: PSG::MIDIController class of PicoRuby
sidebar: picoruby_sidebar
permalink: PSG_MIDIController.html
folder: rbs_doc
---
## Type aliases
### synth_t
```ruby
untyped
```
### logger_t
```ruby
untyped
```
### report_value_t
```ruby
Integer | String
```
### report_t
```ruby
[Symbol, Symbol, report_value_t]
```
### mapping_t
```ruby
[MIDIBASE::event_t, report_t?]
```
### report_key_t
```ruby
[MIDIBASE::Router::source_t, Symbol, Integer?, Symbol]
```
## Singleton methods
### new

```ruby
PSG::MIDIController.new(synth_t synth, ?logger: logger_t) -> void
```
## Instance methods
### handle

```ruby
instance.handle(MIDIBASE::event_t event, ?source: MIDIBASE::Router::source_t, ?priority: Integer, ?timestamp_us: Integer?, **MIDIBASE::context_value_t context) -> bool
```
### handle_midi

```ruby
instance.handle_midi(MIDIBASE::event_t event, MIDIBASE::Router::source_t source, Integer priority, Integer? timestamp_us) -> bool
```
