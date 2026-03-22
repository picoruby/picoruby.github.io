---
title: module LayerKeycode
keywords: LayerKeycode
tags: [module]
summary: LayerKeycode module of PicoRuby
sidebar: picoruby_sidebar
permalink: LayerKeycode.html
folder: rbs_doc
---
## Instance methods
### LT

```ruby
instance.LT(Integer layer_index, Integer tap_keycode) -> Integer
```
### MC

```ruby
instance.MC(Integer macro_index) -> Integer
```
### MO

```ruby
instance.MO(Integer layer_index) -> Integer
```
### MT

```ruby
instance.MT(Integer modifier_keycode, Integer tap_keycode) -> Integer
```
### S

```ruby
instance.S(Integer keycode) -> Integer
```
### TG

```ruby
instance.TG(Integer layer_index) -> Integer
```
### V

```ruby
instance.V(Integer | Float val) -> Integer
```
### X

```ruby
instance.X(Integer | Float val) -> Integer
```
### is_lt?

```ruby
instance.is_lt?(Integer keycode) -> bool
```
### is_mc?

```ruby
instance.is_mc?(Integer keycode) -> bool
```
### is_mo?

```ruby
instance.is_mo?(Integer keycode) -> bool
```
### is_mt?

```ruby
instance.is_mt?(Integer keycode) -> bool
```
### is_sm?

```ruby
instance.is_sm?(Integer keycode) -> bool
```
### is_tg?

```ruby
instance.is_tg?(Integer keycode) -> bool
```
### is_v?

```ruby
instance.is_v?(Integer keycode) -> bool
```
### is_x?

```ruby
instance.is_x?(Integer keycode) -> bool
```
### lt_layer

```ruby
instance.lt_layer(Integer keycode) -> Integer
```
### lt_tap_keycode

```ruby
instance.lt_tap_keycode(Integer keycode) -> Integer
```
### mc_index

```ruby
instance.mc_index(Integer keycode) -> Integer
```
### mo_layer

```ruby
instance.mo_layer(Integer keycode) -> Integer
```
### mt_modifier_index

```ruby
instance.mt_modifier_index(Integer keycode) -> Integer
```
### mt_tap_keycode

```ruby
instance.mt_tap_keycode(Integer keycode) -> Integer
```
### sm_keycode

```ruby
instance.sm_keycode(Integer keycode) -> Integer
```
### tg_layer

```ruby
instance.tg_layer(Integer keycode) -> Integer
```
### v_width

```ruby
instance.v_width(Integer keycode) -> Float
```
### x_width

```ruby
instance.x_width(Integer keycode) -> Float
```
