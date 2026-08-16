---
title: class MIDIBASE::MML::MIDIClock
keywords: MIDIBASE::MML::MIDIClock
tags: [class]
summary: MIDIBASE::MML::MIDIClock class of PicoRuby
sidebar: picoruby_sidebar
permalink: MIDIBASE_MML_MIDIClock.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
MIDIBASE::MML::MIDIClock.new() -> void
```
## Instance methods
### external?

```ruby
instance.external?() -> true
```
### generation

```ruby
instance.generation() -> Integer
```
### handle

```ruby
instance.handle(MIDIBASE::event_t event, ?timestamp_us: Integer?, **MIDIBASE::context_value_t context) -> self
```
### wait_for_restart

```ruby
instance.wait_for_restart(Player player, Integer generation) -> Integer
```
### wait_until

```ruby
instance.wait_until(Integer target_tick, Player player, Integer generation) -> Symbol
```
### wait_until_running

```ruby
instance.wait_until_running(Player player) -> Integer
```
