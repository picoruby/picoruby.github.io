---
title: class PSG::Keyboard
keywords: PSG::Keyboard
tags: [class]
summary: PSG::Keyboard class of PicoRuby
sidebar: picoruby_sidebar
permalink: PSG_Keyboard.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
PSG::Keyboard.new(PSG::Driver driver, ?channel: Integer) -> void
```
### note_to_period

```ruby
PSG::Keyboard.note_to_period(Integer note) -> Integer
```
## Instance methods
### note_off

```ruby
instance.note_off() -> bool
```
### note_on

```ruby
instance.note_on(Integer period) -> bool
```
### start

```ruby
instance.start() -> void
```
