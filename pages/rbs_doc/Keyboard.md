---
title: Keyboard
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
Keyboard.new-> void
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
action_on_release(Integer | Array[Integer] | Proc | nil) -> void
```
### add_layer

```ruby
add_layer(Symbol name, Array[ Symbol | Array[Symbol] ] map) -> void
```
### anchor?

```ruby
anchor?-> bool
```
### append

```ruby
append(append_type feature) -> void
```
### before_report

```ruby
before_report() { (Keyboard) -> void } -> void
```
### bootsel!

```ruby
bootsel!-> void
```
### calculate_col_position

```ruby
calculate_col_position(Integer col_index) -> Integer
```
### convert_composite_keys

```ruby
convert_composite_keys(Array[Symbol]) -> Array[Integer]
```
### define_composite_key

```ruby
define_composite_key(Symbol key_name, Array[Symbol] keys) -> void
```
### define_mode_key

```ruby
define_mode_key(Symbol key_name, [Symbol | Array[Symbol] | Proc | nil, Symbol | Proc | nil, Integer?, Integer?] param, ?bool from_via) -> void
```
### delete_mode_keys

```ruby
delete_mode_keys(Symbol) -> void
```
### entire_cols_size

```ruby
entire_cols_size() -> Integer
```
### eval

```ruby
eval(String) -> void
```
### find_keycode_index

```ruby
find_keycode_index(Symbol key) -> (Integer | Symbol)
```
### get_layer

```ruby
get_layer(Symbol | nil, Integer) -> ( Array[Array[Integer | Symbol | Proc]] | nil )
```
### init_direct_pins

```ruby
init_direct_pins(Array[Integer] pins) -> void
```
### init_matrix_pins

```ruby
init_matrix_pins(Array[Array[Array[Integer] | nil]] matrix) -> void
```
### init_pins

```ruby
init_pins(Array[Integer] rows, Array[Integer] cols) -> void
```
### init_uart

```ruby
init_uart() -> void
```
### inject_switch

```ruby
inject_switch(Integer col, Integer row) -> void
```
### invert_sft

```ruby
invert_sft-> void
```
### key_pressed?

```ruby
key_pressed?() -> bool
```
### keys_include?

```ruby
keys_include?(Symbol) -> bool
```
### lock_layer

```ruby
lock_layer(Symbol layer_name) -> void
```
### lower_layer

```ruby
lower_layer-> void
```
### macro

```ruby
macro(String text, ?::Array[Symbol] opt) -> void
```
### mutual_uart_at_my_own_risk=

```ruby
mutual_uart_at_my_own_risk=(bool) -> void
```
### on_start

```ruby
on_start() { (Keyboard) -> void } -> void
```
### output_report_changed

```ruby
output_report_changed() { (Integer) -> void} -> void
```
### raise_layer

```ruby
raise_layer-> void
```
### resolve_key_alias

```ruby
resolve_key_alias(Symbol) -> Symbol
```
### ruby

```ruby
ruby() -> void
```
### scan_direct!

```ruby
scan_direct!() -> void
```
### scan_matrix!

```ruby
scan_matrix!() -> void
```
### send_key

```ruby
send_key(*untyped) -> void
```
### set_anchor

```ruby
set_anchor(anchor_type val) -> void
```
### set_debounce

```ruby
set_debounce(debounce_type) -> void
```
### set_debounce_threshold

```ruby
set_debounce_threshold(Integer) -> void
```
### set_scan_mode

```ruby
set_scan_mode(scan_mode_type val) -> void
```
### signal_partner

```ruby
signal_partner(Symbol key) { (Keyboard) -> void } -> void
```
### skip_position?

```ruby
skip_position?(Integer row_index, Integer col_index) -> bool
```
### split_style=

```ruby
split_style=(Symbol style) -> void
```
### start!

```ruby
start!-> void
```
### start_features

```ruby
start_features-> void
```
### uart_anchor

```ruby
uart_anchor(Integer) -> Integer
```
### uart_anchor_init

```ruby
uart_anchor_init(Integer) -> void
```
### uart_partner

```ruby
uart_partner() -> Integer
```
### uart_partner_init

```ruby
uart_partner_init(Integer) -> void
```
### uart_partner_push8

```ruby
uart_partner_push8(Integer) -> void
```
### unlock_layer

```ruby
unlock_layer() -> void
```
### via=

```ruby
via=(bool) -> void
```
### via_layer_count=

```ruby
via_layer_count=(Integer) -> void
```
## Attr accessors
### split (accessor)
```ruby
bool
```
### uart_pin (accessor)
```ruby
Integer
```
### default_layer (accessor)
```ruby
Symbol
```
### sounder (accessor)
```ruby
Sounder
```
### modifier (accessor)
```ruby
Integer
```
### layer (reader)
```ruby
Symbol | nil
```
### split_style (reader)
```ruby
split_style_type
```
### cols_size (reader)
```ruby
Integer
```
### rows_size (reader)
```ruby
Integer
```
### keycodes (reader)
```ruby
Array[Integer]
```
