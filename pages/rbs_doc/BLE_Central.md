---
title: BLE::Central
sidebar: picoruby_sidebar
permalink: BLE_Central.html
folder: rbs_doc
---
## Type aliases
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
## Instance methods
### advertising_report_callback

```ruby
instance.advertising_report_callback(BLE::AdvertisingReport) -> void
```
### connect

```ruby
instance.connect(BLE::AdvertisingReport) -> bool
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
### get_packet

```ruby
instance.get_packet() -> String
```
### read_value_of_characteristic_using_value_handle

```ruby
instance.read_value_of_characteristic_using_value_handle(Integer, Integer) -> Integer
```
### reset_state

```ruby
instance.reset_state() -> Symbol
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
### set_scan_params

```ruby
instance.set_scan_params(scan_type_t scan_type, Integer scan_interval, Integer scan_window) -> 0
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
### state (reader)
```ruby
instance.state -> Symbol
```
### services (reader)
```ruby
instance.services -> Array[service_t]
```
