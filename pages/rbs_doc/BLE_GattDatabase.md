---
title: BLE::GattDatabase
sidebar: picoruby_sidebar
permalink: BLE_GattDatabase.html
folder: rbs_doc
---
## Type aliases
### uuid_t
```ruby
String|Integer
```
### properties_t
```ruby
Integer
```
## Singleton methods
### new

```ruby
BLE::GattDatabase.new() { (GattDatabase) -> void } -> void
```
## Instance methods
### add_characteristic

```ruby
add_characteristic(properties_t, uuid_t, properties_t, String) ?{ (GattDatabase) -> void } -> void
```
### add_descriptor

```ruby
add_descriptor(properties_t, uuid_t, ?(String)) -> void
```
### add_line

```ruby
add_line(String) -> void
```
### add_service

```ruby
add_service(uuid_t, uuid_t) ?{ (GattDatabase) -> void } -> void
```
### att_flags

```ruby
att_flags(Integer) -> Integer
```
### flag_by_uuid

```ruby
flag_by_uuid(uuid_t, Integer) -> String
```
### insert_database_hash

```ruby
insert_database_hash() -> void
```
### push_handle

```ruby
push_handle() -> String
```
### seek_handle

```ruby
seek_handle() -> String
```
### uuid2str

```ruby
uuid2str(uuid_t) -> String
```
### write_permissions_and_key_size_flags_from_properties

```ruby
write_permissions_and_key_size_flags_from_properties(Integer) -> Integer
```
