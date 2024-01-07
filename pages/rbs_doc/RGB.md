---
title: RGB
sidebar: picoruby_sidebar
permalink: RGB.html
folder: rbs_doc
---
## Type aliases
### rgb_effect_t
```ruby
:swirl
                    | :rainbow_mood
                    | :breath
                    | :ruby
                    | :nokogiri
                    | :static
                    | :circle
```
### action_type
```ruby
:thunder
                   | nil
```
## Singleton methods
### new

```ruby
RGB.new(Integer pin, Integer underglow_size, Integer backlight_size, ?bool is_rgbw) -> void
```
## Instance methods
### add_pixel

```ruby
add_pixel(Integer, Integer) -> void
```
### effect=

```ruby
effect=(rgb_effect_t) -> void
```
### fifo_push

```ruby
fifo_push(true data) -> void
```
### hsv2rgb

```ruby
hsv2rgb(Float | Integer h, Integer s, Float | Integer v) -> Integer
```
### hue=

```ruby
hue=(Integer) -> void
```
### init_values

```ruby
init_values() -> void
```
### invoke_anchor

```ruby
invoke_anchor(Symbol | nil) -> Integer
```
### invoke_partner

```ruby
invoke_partner(Integer) -> void
```
### ping?

```ruby
ping?() -> bool
```
### reset_pixel

```ruby
reset_pixel() -> void
```
### resume

```ruby
resume() -> void
```
### saturation=

```ruby
saturation=(Integer) -> void
```
### show

```ruby
show-> void
```
### speed=

```ruby
speed=(Integer) -> void
```
### thunder

```ruby
thunder-> void
```
### toggle

```ruby
toggle() -> void
```
### turn_off

```ruby
turn_off() -> void
```
### turn_on

```ruby
turn_on() -> void
```
### value=

```ruby
value=(Integer) -> void
```
### ws2812_add_matrix_pixel_at

```ruby
ws2812_add_matrix_pixel_at(Integer, Integer, Integer) -> void
```
### ws2812_circle

```ruby
ws2812_circle(Integer, Integer, Integer) -> void
```
### ws2812_circle_set_center

```ruby
ws2812_circle_set_center(Integer, Integer) -> void
```
### ws2812_fill

```ruby
ws2812_fill(Integer, Integer) -> void
```
### ws2812_init

```ruby
ws2812_init(Integer, Integer, bool) -> void
```
### ws2812_init_pixel_distance

```ruby
ws2812_init_pixel_distance(Integer) -> void
```
### ws2812_rand_show

```ruby
ws2812_rand_show(Integer, Integer, Integer) -> void
```
### ws2812_reset_swirl_index

```ruby
ws2812_reset_swirl_index() -> bool
```
### ws2812_rotate_swirl

```ruby
ws2812_rotate_swirl(Integer) -> bool
```
### ws2812_set_pixel_at

```ruby
ws2812_set_pixel_at(Integer, Integer) -> void
```
### ws2812_show

```ruby
ws2812_show() -> void
```
## Attr accessors
### pixel_size (reader)
```ruby
Integer
```
### effect (reader)
```ruby
rgb_effect_t
```
### action (accessor)
```ruby
action_type
```
### anchor (accessor)
```ruby
bool
```
### split_sync (accessor)
```ruby
bool
```
