---
title: class USB::HID
keywords: USB::HID
tags: [class]
summary: USB::HID class of PicoRuby
sidebar: picoruby_sidebar
permalink: USB_HID.html
folder: rbs_doc
---
## Include
[Keycode](Keycode.html)
## Singleton methods
### click_mouse

```ruby
USB::HID.click_mouse(?Integer button) -> void
```
### keyboard_led_state

```ruby
USB::HID.keyboard_led_state() -> Integer
```
### keyboard_ready

```ruby
USB::HID.keyboard_ready() -> bool
```
### keyboard_release

```ruby
USB::HID.keyboard_release() -> bool
```
### keyboard_send

```ruby
USB::HID.keyboard_send(Integer modifier, Integer keycode) -> bool
```
### media_ready

```ruby
USB::HID.media_ready() -> bool
```
### media_send

```ruby
USB::HID.media_send(Integer code) -> bool
```
### mouse_move

```ruby
USB::HID.mouse_move(Integer x, Integer y, Integer wheel, Integer buttons) -> bool
```
### mouse_ready

```ruby
USB::HID.mouse_ready() -> bool
```
### move_mouse

```ruby
USB::HID.move_mouse(Integer x, Integer y, ?Integer wheel, ?Integer buttons) -> bool
```
### send_key

```ruby
USB::HID.send_key(Integer keycode, ?Integer modifier) -> bool
```
### send_media

```ruby
USB::HID.send_media(Integer code) -> void
```
### send_text

```ruby
USB::HID.send_text(String text) -> void
```
