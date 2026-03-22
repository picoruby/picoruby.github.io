---
title: class KeyboardMatrix
keywords: KeyboardMatrix
tags: [class]
summary: KeyboardMatrix class of PicoRuby
sidebar: picoruby_sidebar
permalink: KeyboardMatrix.html
folder: rbs_doc
---
## Type aliases
### key_event
```ruby
{
    row: Integer,
    col: Integer,
    pressed: bool
  }
```
## Singleton methods
### new

```ruby
KeyboardMatrix.new(Array[Integer] row_pins, ?Array[Integer] col_pins) -> KeyboardMatrix
```
## Instance methods
### debounce_ms

```ruby
instance.debounce_ms() -> Integer
```
### debounce_ms=

```ruby
instance.debounce_ms=(Integer ms) -> Integer
```
### scan

```ruby
instance.scan() -> key_event?
```
### start

```ruby
instance.start() { (key_event) -> void } -> void
```
