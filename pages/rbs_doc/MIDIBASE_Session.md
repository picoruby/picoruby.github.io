---
title: class MIDIBASE::Session
keywords: MIDIBASE::Session
tags: [class]
summary: MIDIBASE::Session class of PicoRuby
sidebar: picoruby_sidebar
permalink: MIDIBASE_Session.html
folder: rbs_doc
---
## Type aliases
### resource_t
```ruby
untyped
```
### signal_handler_t
```ruby
untyped
```
### run_result_t
```ruby
untyped
```
## Singleton methods
### new

```ruby
MIDIBASE::Session.new(*resource_t resources) -> void
```
## Instance methods
### run

```ruby
instance.run() { () -> run_result_t } -> self
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
### shutdown_error (reader)
```ruby
instance.shutdown_error -> Exception?
```
