---
title: RGB
keywords: RGB
tags: [class]
summary: RGB class of PicoRuby
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
RGB.new(Integer pin, Integer underglow_size, Integer backlight_size, ?bool is_rgbw) -> instance
```
## Instance methods
### add_pixel

```ruby
instance.add_pixel(Integer, Integer) -> void
```
### effect=

```ruby
instance.effect=(rgb_effect_t) -> void
```
### fifo_push

```ruby
instance.fifo_push(true data) -> void
```
### hsv2rgb

```ruby
instance.hsv2rgb(Float | Integer h, Integer s, Float | Integer v) -> Integer
```
### hue=

```ruby
instance.hue=(Integer) -> void
```
### init_values

```ruby
instance.init_values() -> void
```
### invoke_anchor

```ruby
instance.invoke_anchor(Symbol | nil) -> Integer
```
### invoke_partner

```ruby
instance.invoke_partner(Integer) -> void
```
### ping?

```ruby
instance.ping?() -> bool
```
### reset_pixel

```ruby
instance.reset_pixel() -> void
```
### resume

```ruby
instance.resume() -> void
```
### saturation=

```ruby
instance.saturation=(Integer) -> void
```
### show

```ruby
instance.show-> void
```
### speed=

```ruby
instance.speed=(Integer) -> void
```
### thunder

```ruby
instance.thunder-> void
```
### toggle

```ruby
instance.toggle() -> void
```
### turn_off

```ruby
instance.turn_off() -> void
```
### turn_on

```ruby
instance.turn_on() -> void
```
### value=

```ruby
instance.value=(Integer | Float) -> void
```
### ws2812_add_matrix_pixel_at

```ruby
instance.ws2812_add_matrix_pixel_at(Integer, Integer, Integer) -> void
```
### ws2812_circle

```ruby
instance.ws2812_circle(Integer, Integer, Integer) -> void
```
### ws2812_circle_set_center

```ruby
instance.ws2812_circle_set_center(Integer, Integer) -> void
```
### ws2812_fill

```ruby
instance.ws2812_fill(Integer, Integer) -> void
```
### ws2812_init

```ruby
instance.ws2812_init(Integer, Integer, bool) -> void
```
### ws2812_init_pixel_distance

```ruby
instance.ws2812_init_pixel_distance(Integer) -> void
```
### ws2812_rand_show

```ruby
instance.ws2812_rand_show(Integer, Integer, Integer) -> void
```
### ws2812_reset_swirl_index

```ruby
instance.ws2812_reset_swirl_index() -> bool
```
### ws2812_rotate_swirl

```ruby
instance.ws2812_rotate_swirl(Integer) -> bool
```
### ws2812_set_pixel_at

```ruby
instance.ws2812_set_pixel_at(Integer, Integer) -> void
```
### ws2812_show

```ruby
instance.ws2812_show() -> void
```
## Attr accessors
### pixel_size (reader)
```ruby
instance.pixel_size -> Integer
```
### effect (reader)
```ruby
instance.effect -> rgb_effect_t
```
### action (accessor)
```ruby
instance.action -> action_type
```
### anchor (accessor)
```ruby
instance.anchor -> bool
```
### split_sync (accessor)
```ruby
instance.split_sync -> bool
```
