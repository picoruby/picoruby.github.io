---
title: module PSG
keywords: PSG
tags: [module]
summary: PSG module of PicoRuby
sidebar: picoruby_sidebar
permalink: PSG.html
folder: rbs_doc
---
## Type aliases
### voice_program_step_t
```ruby
[Integer, Integer, Integer, Integer]
```
### voice_program_t
```ruby
Array[voice_program_step_t]
```
## Singleton methods
### assign_drum_program

```ruby
PSG.assign_drum_program(Integer note, Symbol? program_name) -> Symbol?
```
### define_voice_program

```ruby
PSG.define_voice_program(Symbol name, voice_program_t steps) -> voice_program_t
```
### drum_program

```ruby
PSG.drum_program(Integer note) -> voice_program_t?
```
### note_to_period

```ruby
PSG.note_to_period(Integer | Float note, ?round: bool) -> Integer
```
### set_tuning

```ruby
PSG.set_tuning(?Symbol tuning, ?pitch: Integer | Float) -> Symbol
```
### voice_program

```ruby
PSG.voice_program(Symbol name) -> voice_program_t
```
