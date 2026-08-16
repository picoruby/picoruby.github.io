---
title: class MIDIBASE::MML::Player
keywords: MIDIBASE::MML::Player
tags: [class]
summary: MIDIBASE::MML::Player class of PicoRuby
sidebar: picoruby_sidebar
permalink: MIDIBASE_MML_Player.html
folder: rbs_doc
---
## Type aliases
### clock_t
```ruby
untyped
```
### output_t
```ruby
untyped
```
## Singleton methods
### new

```ruby
MIDIBASE::MML::Player.new(Sequence sequence, ?clock: clock_t, output: output_t, ?source: MIDIBASE::Router::source_t) -> void
```
## Instance methods
### join

```ruby
instance.join() -> self
```
### pause

```ruby
instance.pause() -> self
```
### paused?

```ruby
instance.paused?() -> bool
```
### position

```ruby
instance.position() -> Array[Integer]
```
### resume

```ruby
instance.resume() -> self
```
### rewind

```ruby
instance.rewind() -> self
```
### run

```ruby
instance.run() -> void
```
### start

```ruby
instance.start() -> self
```
### stop

```ruby
instance.stop() -> self
```
### stopped?

```ruby
instance.stopped?() -> bool
```
## Attr accessors
### sequence (reader)
```ruby
instance.sequence -> Sequence
```
### clock (reader)
```ruby
instance.clock -> clock_t
```
