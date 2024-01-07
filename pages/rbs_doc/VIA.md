---
title: VIA
sidebar: picoruby_sidebar
permalink: VIA.html
folder: rbs_doc
---
## Instance methods
### add_mode_key

```ruby
add_mode_key(Symbol key_name, [Symbol | Array[Symbol] | Proc | nil, Symbol | Proc | nil, Integer?, Integer?] param) -> void
```
### check_for_keycode_shift

```ruby
check_for_keycode_shift(Integer) -> ( Symbol | nil )
```
### cols_size

```ruby
cols_size-> Integer
```
### define_mode_key

```ruby
define_mode_key(Symbol key_name, [Symbol | Array[Symbol] | Proc | nil, Symbol | Proc | nil, Integer?, Integer?] param) -> void
```
### dynamic_keymap_get_buffer

```ruby
dynamic_keymap_get_buffer(Array[Integer]) -> Array[Integer]
```
### dynamic_keymap_get_keycode

```ruby
dynamic_keymap_get_keycode(Integer, Integer, Integer) -> Integer
```
### dynamic_keymap_set_buffer

```ruby
dynamic_keymap_set_buffer(Array[Integer]) -> void
```
### dynamic_keymap_set_keycode

```ruby
dynamic_keymap_set_keycode(Integer, Integer, Integer, Integer) -> void
```
### expand_composite_key

```ruby
expand_composite_key(Symbol) -> Array[Symbol]
```
### get_modifier_name

```ruby
get_modifier_name(Integer) -> String
```
### get_via_composite_keycode

```ruby
get_via_composite_keycode(Symbol) -> Integer
```
### init_keymap

```ruby
init_keymap-> void
```
### load_mode_keys

```ruby
load_mode_keys-> void
```
### prk_keycode_into_via_keycode

```ruby
prk_keycode_into_via_keycode(Integer | Symbol | Proc) -> Integer
```
### raw_hid_receive

```ruby
raw_hid_receive(Array[Integer]) -> Array[Integer]
```
### raw_hid_receive_kb

```ruby
raw_hid_receive_kb(Array[Integer]) -> Array[Integer]
```
### rows_size

```ruby
rows_size-> Integer
```
### save_keymap

```ruby
save_keymap-> void
```
### save_on_flash

```ruby
save_on_flash-> void
```
### save_on_keyboard

```ruby
save_on_keyboard-> void
```
### start!

```ruby
start!-> void
```
### sync_keymap

```ruby
sync_keymap(?bool)-> void
```
### task

```ruby
task-> void
```
### via_get_layer_name

```ruby
via_get_layer_name(Integer) -> Symbol
```
### via_keycode_into_keysymbol

```ruby
via_keycode_into_keysymbol(Integer) -> Symbol
```
## Attr accessors
### kbd (accessor)
```ruby
Keyboard
```
### layer_count (accessor)
```ruby
Integer
```
