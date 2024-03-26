---
title: Keyboard
keywords: Keyboard
tags: [class]
summary: Keyboard class of PicoRuby
sidebar: picoruby_sidebar
permalink: Keyboard.html
folder: rbs_doc
---
## Type aliases
### debounce_type
```ruby
:none
                     | :per_row
                     | :per_key
```
### debouncer_type
```ruby
DebounceNone
                      | DebouncePerRow
                      | DebouncePerKey
```
### scan_mode_type
```ruby
:matrix
                      | :direct
```
### append_type
```ruby
RGB
                   | RotaryEncoder
                   | VIA
                   | Joystick
                   | Mouse
                   | Sounder
                   | DebounceNone
                   | DebouncePerRow
                   | DebouncePerKey
```
### anchor_type
```ruby
:left
                   | :right
```
### split_style_type
```ruby
:standard_split
                        | :right_side_flipped_split
```
### layer_t
```ruby
{
    on_release:        Integer | Array[Integer] | Proc | nil,
    on_hold:           Integer | Symbol | Proc,
    release_threshold: Integer,
    repush_threshold:  Integer
  }
```
### mode_key_t
```ruby
{
    prev_state:  Symbol,
    pushed_at:   Integer,
    released_at: Integer,
    layers:      Hash[Symbol, layer_t]
  }
```
## Singleton methods
### autoreload_off

```ruby
Keyboard.autoreload_off() -> void
```
### autoreload_ready?

```ruby
Keyboard.autoreload_ready?() -> bool
```
### new

```ruby
Keyboard.new-> instance
```
### reload_keymap

```ruby
Keyboard.reload_keymap() -> void
```
### restart

```ruby
Keyboard.restart() -> void
```
### wait_keymap

```ruby
Keyboard.wait_keymap() -> void
```
## Instance methods
### action_on_release

```ruby
instance.action_on_release(Integer | Array[Integer] | Proc | nil mode_key) -> void
```
### add_layer

```ruby
instance.add_layer(Symbol name, Array[ Symbol | Array[Symbol] ] map) -> void
```
### anchor?

```ruby
instance.anchor?-> bool
```
### append

```ruby
instance.append(append_type feature) -> void
```
### before_report

```ruby
instance.before_report() { (Keyboard) -> void } -> void
```
### bootsel!

```ruby
instance.bootsel!-> void
```
### calculate_col_position

```ruby
instance.calculate_col_position(Integer col_index) -> Integer
```
### convert_composite_keys

```ruby
instance.convert_composite_keys(Array[Symbol] keys) -> Array[Integer]
```
### define_composite_key

```ruby
instance.define_composite_key(Symbol key_name, Array[Symbol] keys) -> void
```
### define_mode_key

```ruby
instance.define_mode_key(Symbol key_name, [Symbol | Array[Symbol] | Proc | nil, Symbol | Proc | nil, Integer?, Integer?] param, ?bool from_via) -> void
```
### delete_mode_keys

```ruby
instance.delete_mode_keys(Symbol layer_name) -> void
```
### entire_cols_size

```ruby
instance.entire_cols_size() -> Integer
```
### eval

```ruby
instance.eval(String) -> void
```
### find_keycode_index

```ruby
instance.find_keycode_index(Symbol key) -> (Integer | Symbol)
```
### get_layer

```ruby
instance.get_layer(Symbol | nil name, Integer num) -> ( Array[Array[Integer | Symbol | Proc]] | nil )
```
### init_direct_pins

```ruby
instance.init_direct_pins(Array[Integer] pins) -> void
```
### init_matrix_pins

```ruby
instance.init_matrix_pins(Array[Array[Array[Integer] | nil]] matrix) -> void
```
### init_pins

```ruby
instance.init_pins(Array[Integer] rows, Array[Integer] cols) -> void
```
### init_uart

```ruby
instance.init_uart() -> void
```
### inject_switch

```ruby
instance.inject_switch(Integer col, Integer row) -> void
```
### invert_sft

```ruby
instance.invert_sft-> void
```
### key_pressed?

```ruby
instance.key_pressed?() -> bool
```
### keys_include?

```ruby
instance.keys_include?(Symbol key) -> bool
```
### lock_layer

```ruby
instance.lock_layer(Symbol layer_name) -> void
```
### lower_layer

```ruby
instance.lower_layer-> void
```
### macro

```ruby
instance.macro(String text, ?::Array[Symbol] opt) -> void
```
### mutual_uart_at_my_own_risk=

```ruby
instance.mutual_uart_at_my_own_risk=(bool) -> void
```
### on_start

```ruby
instance.on_start() { (Keyboard) -> void } -> void
```
### output_report_changed

```ruby
instance.output_report_changed() { (Integer) -> void} -> void
```
### raise_layer

```ruby
instance.raise_layer-> void
```
### resolve_key_alias

```ruby
instance.resolve_key_alias(Symbol sym) -> Symbol
```
### ruby

```ruby
instance.ruby() -> void
```
### scan_direct!

```ruby
instance.scan_direct!() -> void
```
### scan_matrix!

```ruby
instance.scan_matrix!() -> void
```
### send_key

```ruby
instance.send_key(*untyped) -> void
```
### set_anchor

```ruby
instance.set_anchor(anchor_type val) -> void
```
### set_debounce

```ruby
instance.set_debounce(debounce_type type) -> void
```
### set_debounce_threshold

```ruby
instance.set_debounce_threshold(Integer val) -> void
```
### set_scan_mode

```ruby
instance.set_scan_mode(scan_mode_type mode) -> void
```
### signal_partner

```ruby
instance.signal_partner(Symbol key) { (Keyboard) -> void } -> void
```
### skip_position?

```ruby
instance.skip_position?(Integer row_index, Integer col_index) -> bool
```
### split_style=

```ruby
instance.split_style=(Symbol style) -> void
```
### start!

```ruby
instance.start!-> void
```
### start_features

```ruby
instance.start_features-> void
```
### uart_anchor

```ruby
instance.uart_anchor(Integer) -> Integer
```
### uart_anchor_init

```ruby
instance.uart_anchor_init(Integer) -> void
```
### uart_partner

```ruby
instance.uart_partner() -> Integer
```
### uart_partner_init

```ruby
instance.uart_partner_init(Integer) -> void
```
### uart_partner_push8

```ruby
instance.uart_partner_push8(Integer) -> void
```
### unlock_layer

```ruby
instance.unlock_layer() -> void
```
### via=

```ruby
instance.via=(bool val) -> void
```
### via_layer_count=

```ruby
instance.via_layer_count=(Integer count) -> void
```
## Attr accessors
### split (accessor)
```ruby
instance.split -> bool
```
### uart_pin (accessor)
```ruby
instance.uart_pin -> Integer
```
### default_layer (accessor)
```ruby
instance.default_layer -> Symbol
```
### sounder (accessor)
```ruby
instance.sounder -> Sounder
```
### modifier (accessor)
```ruby
instance.modifier -> Integer
```
### layer (reader)
```ruby
instance.layer -> Symbol | nil
```
### split_style (reader)
```ruby
instance.split_style -> split_style_type
```
### cols_size (reader)
```ruby
instance.cols_size -> Integer
```
### rows_size (reader)
```ruby
instance.rows_size -> Integer
```
### keycodes (reader)
```ruby
instance.keycodes -> Array[Integer]
```
