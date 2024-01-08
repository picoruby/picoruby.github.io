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
BLE::GattDatabase.new() ?{ (GattDatabase) -> void } -> instance
```
## Instance methods
### add_characteristic

```ruby
instance.add_characteristic(properties_t, uuid_t, properties_t, String) ?{ (GattDatabase) -> void } -> void
```
### add_descriptor

```ruby
instance.add_descriptor(properties_t, uuid_t, ?(String)) -> void
```
### add_line

```ruby
instance.add_line(String) -> void
```
### add_service

```ruby
instance.add_service(uuid_t, uuid_t) ?{ (GattDatabase) -> void } -> void
```
### att_flags

```ruby
instance.att_flags(Integer) -> Integer
```
### flag_by_uuid

```ruby
instance.flag_by_uuid(uuid_t, Integer) -> String
```
### insert_database_hash

```ruby
instance.insert_database_hash() -> void
```
### push_handle

```ruby
instance.push_handle() -> String
```
### seek_handle

```ruby
instance.seek_handle() -> String
```
### uuid2str

```ruby
instance.uuid2str(uuid_t) -> String
```
### write_permissions_and_key_size_flags_from_properties

```ruby
instance.write_permissions_and_key_size_flags_from_properties(Integer) -> Integer
```
## Attr accessors
### handle_table (reader)
```ruby
instance.handle_table -> Hash[uuid_t|nil, untyped]
```
### profile_data (reader)
```ruby
instance.profile_data -> String
```
