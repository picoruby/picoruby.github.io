---
title: Sounder
sidebar: picoruby_sidebar
permalink: Sounder.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Sounder.new(Integer) -> instance
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
instance.compile(*String | Symbol) -> void
```
### lock

```ruby
instance.lock() -> void
```
### play

```ruby
instance.play(*String | Symbol) -> void
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
