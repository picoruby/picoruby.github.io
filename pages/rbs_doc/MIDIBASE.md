---
title: module MIDIBASE
keywords: MIDIBASE
tags: [module]
summary: MIDIBASE module of PicoRuby
sidebar: picoruby_sidebar
permalink: MIDIBASE.html
folder: rbs_doc
---
## Type aliases
### event_value_t
```ruby
untyped
```
### event_t
```ruby
Array[event_value_t]
```
### context_value_t
```ruby
untyped
```
### midi_write_result_t
```ruby
untyped
```
## Singleton methods
### channel_event

```ruby
MIDIBASE.channel_event(Integer status, Array[Integer | String] values, Integer count) -> Array[Integer]
```
### channel_value

```ruby
MIDIBASE.channel_value(Integer | String value) -> Integer
```
### data_value

```ruby
MIDIBASE.data_value(Integer | String value) -> Integer
```
### encode

```ruby
MIDIBASE.encode(Symbol command, *(Integer | String) values) -> Array[Integer]
```
### fourteen_bit_value

```ruby
MIDIBASE.fourteen_bit_value(Integer | String value) -> Integer
```
### no_value_event

```ruby
MIDIBASE.no_value_event(Array[Integer | String] values, Integer status) -> Array[Integer]
```
### require_values

```ruby
MIDIBASE.require_values(Array[Integer | String] values, Integer count) -> void
```
### single_value

```ruby
MIDIBASE.single_value(Array[Integer | String] values) -> (Integer | String)
```
## Instance methods
### bar

```ruby
instance.bar() -> Integer
```
### beat

```ruby
instance.beat() -> Integer
```
### bpm

```ruby
instance.bpm() -> Float?
```
### clock_running?

```ruby
instance.clock_running?() -> boolish
```
### getevent

```ruby
instance.getevent() -> event_t
```
### handle

```ruby
instance.handle(event_t event, **context_value_t context) -> Integer
```
### handle_midi

```ruby
instance.handle_midi(event_t event, Router::source_t source, Integer priority, Integer timestamp_us) -> Integer
```
### initialize_midibase

```ruby
instance.initialize_midibase(?time_signature: Array[Integer], ?max_sysex_bytes: Integer) -> self
```
### position

```ruby
instance.position() -> Array[Integer]
```
### putevent

```ruby
instance.putevent(Symbol command, *(Integer | String) values) -> Integer
```
### tick

```ruby
instance.tick() -> Integer
```
### time_signature

```ruby
instance.time_signature() -> Array[Integer]?
```
### time_signature=

```ruby
instance.time_signature=(Array[Integer] signature) -> Array[Integer]
```
