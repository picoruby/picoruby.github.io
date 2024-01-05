---
title: Terminal::Line
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
feed_at_bottom-> Integer
```
### history_head

```ruby
history_head-> Integer
```
### load_history

```ruby
load_history(:down | :up dir) -> void
```
### prompt=

```ruby
prompt=(String word) -> Integer
```
### refresh

```ruby
refresh-> void
```
### save_history

```ruby
save_history-> Integer
```
### start

```ruby
start() { (self, Terminal::Buffer, Integer) -> void }  -> void
```
