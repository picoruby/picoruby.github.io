---
title: class BLE
keywords: BLE
tags: [class]
summary: BLE class of PicoRuby
sidebar: picoruby_sidebar
permalink: BLE.html
folder: rbs_doc
---
## Type aliases
### role_t
```ruby
:central | :peripheral | :observer | :broadcaster
```
### service_t
```ruby
{
      start_handle: Integer,
      end_handle: Integer,
      uuid128: String,
      uuid32: (Integer | nil),
      characteristics: Array[characteristic_t]
    }
```
### characteristic_t
```ruby
{
      start_handle: Integer,
      value_handle: Integer,
      end_handle: Integer,
      properties: Integer,
      uuid128: String,
      uuid32: (Integer | nil),
      value: (String | nil),
      descriptors: Array[descriptor_t]
    }
```
### descriptor_t
```ruby
{
      handle: Integer,
      uuid128: String,
      uuid32: (Integer | nil),
      value: (String | nil)
    }
```
### scan_type_t
```ruby
:passive|:active
```
## Singleton methods
### new

```ruby
BLE.new(role_t role, ?(String|nil) profile_data) -> void
```
### instance

```ruby
BLE.instance() -> BLE
```
## Instance methods
### _init

```ruby
instance._init(String | nil) -> void
```
### advertise

```ruby
instance.advertise(String) -> 0
```
### advertising_report_callback

```ruby
instance.advertising_report_callback(BLE::AdvertisingReport) -> void
```
### blink_led

```ruby
instance.blink_led() -> void
```
### broadcaster_advertise

```ruby
instance.broadcaster_advertise(String) -> 0
```
### connect

```ruby
instance.connect(BLE::AdvertisingReport) -> bool
```
### debug_puts

```ruby
instance.debug_puts(*untyped) -> nil
```
### discover_characteristic_descriptors

```ruby
instance.discover_characteristic_descriptors(Integer, Integer, Integer) -> Integer
```
### discover_characteristics_for_service

```ruby
instance.discover_characteristics_for_service(Integer, Integer, Integer) -> Integer
```
### discover_primary_services

```ruby
instance.discover_primary_services(Integer) -> Integer
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
### get_packet

```ruby
instance.get_packet() -> String
```
### get_write_value

```ruby
instance.get_write_value(Integer handle) -> (String|nil)
```
### hci_power_control

```ruby
instance.hci_power_control(Integer) -> 0
```
### heartbeat_callback

```ruby
instance.heartbeat_callback() -> void
```
### init_central

```ruby
instance.init_central() -> void
```
### notify

```ruby
instance.notify(Integer) -> void
```
### packet_callback

```ruby
instance.packet_callback(String) -> void
```
### peripheral_advertise

```ruby
instance.peripheral_advertise(String) -> 0
```
### read_value_of_characteristic_using_value_handle

```ruby
instance.read_value_of_characteristic_using_value_handle(Integer, Integer) -> Integer
```
### request_can_send_now_event

```ruby
instance.request_can_send_now_event() -> void
```
### reset_state

```ruby
instance.reset_state() -> Symbol
```
### restrict_central

```ruby
instance.restrict_central() -> void
```
### scan

```ruby
instance.scan(
      ?scan_type: scan_type_t,
      ?scan_interval: Integer,
      ?scan_window: Integer,
      ?timeout_ms: Integer|nil,
      ?stop_state: Symbol,
      ?debug: bool
    ) -> void
```
### set_read_value

```ruby
instance.set_read_value(Integer handle, String value) -> void
```
### set_scan_params

```ruby
instance.set_scan_params(scan_type_t scan_type, Integer scan_interval, Integer scan_window) -> 0
```
### start

```ruby
instance.start(?(Integer | nil) timeout_ms, ?(Symbol | nil)) -> Integer
```
### start_scan

```ruby
instance.start_scan() -> 0
```
### stop_scan

```ruby
instance.stop_scan() -> 0
```
## Attr accessors
### debug (accessor)
```ruby
instance.debug -> bool
```
### role (reader)
```ruby
instance.role -> role_t
```
### state (reader)
```ruby
instance.state -> Symbol
```
### services (reader)
```ruby
instance.services -> Array[service_t]
```
