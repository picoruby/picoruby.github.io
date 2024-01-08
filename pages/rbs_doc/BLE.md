---
title: BLE
sidebar: picoruby_sidebar
permalink: BLE.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
BLE.new(?(String|nil)) -> instance
```
## Instance methods
### _init

```ruby
instance._init(String | nil) -> void
```
### blink_led

```ruby
instance.blink_led() -> void
```
### debug_puts

```ruby
instance.debug_puts(*untyped) -> nil
```
### ensure

```ruby
instance.ensure() { () -> void }-> void
```
### gap_connect

```ruby
instance.gap_connect(String, Integer) -> Integer
```
### gap_local_bd_addr

```ruby
instance.gap_local_bd_addr() -> String
```
### get_write_value

```ruby
instance.get_write_value(Integer) -> (String|nil)
```
### hci_power_control

```ruby
instance.hci_power_control(Integer) -> 0
```
### heartbeat_callback

```ruby
instance.heartbeat_callback() -> void
```
### packet_callback

```ruby
instance.packet_callback(String) -> void
```
### set_read_value

```ruby
instance.set_read_value(Integer, String) -> void
```
### start

```ruby
instance.start(?(Integer | nil) timeout_ms, ?(Symbol | nil)) -> Integer
```
## Attr accessors
### debug (accessor)
```ruby
instance.debug -> bool
```
### role (reader)
```ruby
instance.role -> :central | :peripheral | :observer | :broadcaster
```
