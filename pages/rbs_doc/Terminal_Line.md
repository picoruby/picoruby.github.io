---
title: class Terminal::Line
keywords: Terminal::Line
tags: [class]
summary: Terminal::Line class of PicoRuby
sidebar: picoruby_sidebar
permalink: Terminal_Line.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Terminal::Line.new-> void
```
## Instance methods
### feed_at_bottom

```ruby
instance.feed_at_bottom-> Integer
```
### history_head

```ruby
instance.history_head-> Integer
```
### load_history

```ruby
instance.load_history(:down | :up dir) -> void
```
### prompt=

```ruby
instance.prompt=(String word) -> Integer
```
### refresh

```ruby
instance.refresh-> void
```
### save_history

```ruby
instance.save_history-> Integer
```
### start

```ruby
instance.start() { (self, Terminal::Buffer, Integer) -> void }  -> void
```
