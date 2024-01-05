---
title: Sounder
sidebar: picoruby_sidebar
permalink: Sounder.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Sounder.new(Integer) -> void
```
## Instance methods
### add_note

```ruby
add_note(Float frequency, Integer duration) -> bool
```
### add_song

```ruby
add_song(Symbol name, *String measures) -> void
```
### clear_song

```ruby
clear_song() -> void
```
### compile

```ruby
compile(*String | Symbol) -> void
```
### lock

```ruby
lock() -> void
```
### play

```ruby
play(*String | Symbol) -> void
```
### replay

```ruby
replay() -> void
```
### replay_if_key_pressed

```ruby
replay_if_key_pressed() -> void
```
### sounder_init

```ruby
sounder_init(Integer) -> void
```
### sounder_replay

```ruby
sounder_replay() -> void
```
### unlock

```ruby
unlock() -> void
```
