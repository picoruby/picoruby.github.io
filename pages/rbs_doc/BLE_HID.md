---
title: class BLE::HID
keywords: BLE::HID
tags: [class]
summary: BLE::HID class of PicoRuby
sidebar: picoruby_sidebar
permalink: BLE_HID.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
BLE::HID.new(
      ?name: String,
      ?mouse: bool,
      ?consumer: bool
    ) -> void
```
## Instance methods
### battery_level=

```ruby
instance.battery_level=(Integer level) -> Integer
```
### connected?

```ruby
instance.connected?() -> bool
```
### heartbeat_callback

```ruby
instance.heartbeat_callback() -> void
```
### keyboard_led_state

```ruby
instance.keyboard_led_state() -> Integer
```
### keyboard_release

```ruby
instance.keyboard_release() -> bool
```
### keyboard_send

```ruby
instance.keyboard_send(Integer modifier, Integer keycode) -> bool
```
### media_send

```ruby
instance.media_send(Integer code) -> bool
```
### mouse_move

```ruby
instance.mouse_move(Integer x, Integer y, ?Integer wheel, ?Integer buttons) -> bool
```
### packet_callback

```ruby
instance.packet_callback(String event_packet) -> void
```
### send_key

```ruby
instance.send_key(Integer keycode, ?Integer modifier) -> bool
```
### start

```ruby
instance.start(?Integer? timeout_ms) ?{ () -> void } -> Integer
```
