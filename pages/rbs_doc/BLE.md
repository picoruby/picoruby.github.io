---
title: BLE
sidebar: picoruby_sidebar
permalink: BLE.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
BLE.new(?(String|nil)) -> void
```
## Instance methods
### _init

```ruby
_init(String | nil) -> void
```
### blink_led

```ruby
blink_led() -> void
```
### debug_puts

```ruby
debug_puts(*untyped) -> nil
```
### ensure

```ruby
ensure() { () -> void }-> void
```
### gap_connect

```ruby
gap_connect(String, Integer) -> Integer
```
### gap_local_bd_addr

```ruby
gap_local_bd_addr() -> String
```
### get_write_value

```ruby
get_write_value(Integer) -> (String|nil)
```
### hci_power_control

```ruby
hci_power_control(Integer) -> 0
```
### heartbeat_callback

```ruby
heartbeat_callback() -> void
```
### packet_callback

```ruby
packet_callback(String) -> void
```
### set_read_value

```ruby
set_read_value(Integer, String) -> void
```
### start

```ruby
start(?(Integer | nil) timeout_ms, ?(Symbol | nil)) -> Integer
```
