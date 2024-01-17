---
title: BLE::Utils
keywords: BLE::Utils
tags: [class]
summary: BLE::Utils class of PicoRuby
sidebar: picoruby_sidebar
permalink: BLE_Utils.html
folder: rbs_doc
---
## Singleton methods
### bd_addr_to_str

```ruby
BLE::Utils.bd_addr_to_str(String) -> String
```
### int16_to_little_endian

```ruby
BLE::Utils.int16_to_little_endian(Integer) -> String
```
### int32_to_little_endian

```ruby
BLE::Utils.int32_to_little_endian(Integer) -> String
```
### little_endian_to_int16

```ruby
BLE::Utils.little_endian_to_int16(String|nil) -> Integer
```
### little_endian_to_int32

```ruby
BLE::Utils.little_endian_to_int32(String|nil) -> Integer
```
### reverse_128

```ruby
BLE::Utils.reverse_128(String|nil) -> String
```
### uuid

```ruby
BLE::Utils.uuid(untyped) -> String
```
### uuid128_to_uuid32

```ruby
BLE::Utils.uuid128_to_uuid32(String) -> (Integer|nil)
```
### valid_char_for_uuid?

```ruby
BLE::Utils.valid_char_for_uuid?(String | nil) -> bool
```
