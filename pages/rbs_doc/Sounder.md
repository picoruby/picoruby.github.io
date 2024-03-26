---
title: Sounder
keywords: Sounder
tags: [class]
summary: Sounder class of PicoRuby
sidebar: picoruby_sidebar
permalink: Sounder.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Sounder.new(Integer pin) -> instance
```
## Instance methods
### add_note

```ruby
instance.add_note(Float frequency, Integer duration) -> bool
```
### add_song

```ruby
instance.add_song(Symbol name, *String measures) -> void
```
### clear_song

```ruby
instance.clear_song() -> void
```
### compile

```ruby
instance.compile(*String | Symbol measures) -> void
```
### lock

```ruby
instance.lock() -> void
```
### play

```ruby
instance.play(*String | Symbol measures) -> void
```
### replay

```ruby
instance.replay() -> void
```
### replay_if_key_pressed

```ruby
instance.replay_if_key_pressed() -> void
```
### unlock

```ruby
instance.unlock() -> void
```
