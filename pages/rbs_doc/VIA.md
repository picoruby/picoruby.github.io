---
title: class VIA
keywords: VIA
tags: [class]
summary: VIA class of PicoRuby
sidebar: picoruby_sidebar
permalink: VIA.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
VIA.new() -> instance
```
## Instance methods
### add_mode_key

```ruby
instance.add_mode_key(Symbol key_name, [Symbol | Array[Symbol] | Proc | nil, Symbol | Proc | nil, Integer?, Integer?] param) -> void
```
### check_for_keycode_shift

```ruby
instance.check_for_keycode_shift(Integer keycode) -> ( Symbol | nil )
```
### cols_size

```ruby
instance.cols_size-> Integer
```
### define_mode_key

```ruby
instance.define_mode_key(Symbol key_name, [Symbol | Array[Symbol] | Proc | nil, Symbol | Proc | nil, Integer?, Integer?] param) -> void
```
### dynamic_keymap_get_buffer

```ruby
instance.dynamic_keymap_get_buffer(Array[Integer] data) -> Array[Integer]
```
### dynamic_keymap_get_keycode

```ruby
instance.dynamic_keymap_get_keycode(Integer layer, Integer row, Integer col) -> Integer
```
### dynamic_keymap_set_buffer

```ruby
instance.dynamic_keymap_set_buffer(Array[Integer] data) -> void
```
### dynamic_keymap_set_keycode

```ruby
instance.dynamic_keymap_set_keycode(Integer layer, Integer row, Integer col, Integer keycode) -> void
```
### expand_composite_key

```ruby
instance.expand_composite_key(Symbol name) -> Array[Symbol]
```
### get_modifier_name

```ruby
instance.get_modifier_name(Integer bits) -> String
```
### get_via_composite_keycode

```ruby
instance.get_via_composite_keycode(Symbol keyname) -> Integer
```
### init_keymap

```ruby
instance.init_keymap-> void
```
### load_mode_keys

```ruby
instance.load_mode_keys-> void
```
### prk_keycode_into_via_keycode

```ruby
instance.prk_keycode_into_via_keycode(Integer | Symbol | Proc key) -> Integer
```
### raw_hid_receive

```ruby
instance.raw_hid_receive(Array[Integer] data) -> Array[Integer]
```
### raw_hid_receive_kb

```ruby
instance.raw_hid_receive_kb(Array[Integer] data) -> Array[Integer]
```
### rows_size

```ruby
instance.rows_size-> Integer
```
### save_keymap

```ruby
instance.save_keymap-> void
```
### save_on_flash

```ruby
instance.save_on_flash-> void
```
### save_on_keyboard

```ruby
instance.save_on_keyboard-> void
```
### start!

```ruby
instance.start!-> void
```
### sync_keymap

```ruby
instance.sync_keymap(?bool init)-> void
```
### task

```ruby
instance.task-> void
```
### via_get_layer_name

```ruby
instance.via_get_layer_name(Integer i) -> Symbol
```
### via_keycode_into_keysymbol

```ruby
instance.via_keycode_into_keysymbol(Integer keycode) -> Symbol
```
## Attr accessors
### kbd (accessor)
```ruby
instance.kbd -> Keyboard
```
### layer_count (accessor)
```ruby
instance.layer_count -> Integer
```
