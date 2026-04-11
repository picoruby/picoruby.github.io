---
title: class Keyboard
keywords: Keyboard
tags: [class]
summary: Keyboard class of PicoRuby
sidebar: picoruby_sidebar
permalink: Keyboard.html
folder: rbs_doc
---
## Include
[LayerKeycode](LayerKeycode.html)
## Type aliases
### key_event_t
```ruby
{
    row: Integer,
    col: Integer,
    keycode: Integer,
    modifier: Integer,
    pressed: bool
  }
```
### combo_entry_t
```ruby
{
    keycodes: Array[Integer],
    action: Integer
  }
```
### combo_buffer_entry_t
```ruby
{
    key_pos: [Integer, Integer],
    pressed_at: Integer,
    keycode: Integer
  }
```
### injected_event_t
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
Keyboard.new(Array[Integer] row_pins, Array[Integer] col_pins, ?debounce_ms: Integer, ?keymap_rows: Integer?, ?keymap_cols: Integer?) -> void
```
## Instance methods
### add_combo

```ruby
instance.add_combo(Array[Integer] keycodes, Integer action) -> void
```
### add_macro

```ruby
instance.add_macro(String string) -> Integer
```
### combo_reference_layer=

```ruby
instance.combo_reference_layer=(Symbol? layer_name) -> (Integer | nil)
```
### combo_term_ms=

```ruby
instance.combo_term_ms=(Integer value) -> Integer
```
### default_layer=

```ruby
instance.default_layer=(Symbol name) -> void
```
### get_layer

```ruby
instance.get_layer(Symbol name) -> Array[Integer]?
```
### inject_event

```ruby
instance.inject_event(Integer row, Integer col, bool pressed) -> void
```
### layer

```ruby
instance.layer(?Symbol name) { (self) -> untyped } -> void
```
### on_tick

```ruby
instance.on_tick() { (Keyboard) -> void } -> void
```
### repush_threshold_ms=

```ruby
instance.repush_threshold_ms=(Integer value) -> Integer
```
### start

```ruby
instance.start() { (key_event_t) -> void } -> void
```
### tap_threshold_ms=

```ruby
instance.tap_threshold_ms=(Integer value) -> Integer
```
## Attr accessors
### layer_names (reader)
```ruby
instance.layer_names -> Array[Symbol]
```
### layout (reader)
```ruby
instance.layout -> Array[Array[Integer]]
```
### keys_pressed (reader)
```ruby
instance.keys_pressed -> Hash[[Integer, Integer], bool]
```
