---
title: BLE::AdvertisingReport
sidebar: picoruby_sidebar
permalink: BLE_AdvertisingReport.html
folder: rbs_doc
---
## Type aliases
### report_t
```ruby
Hash[(Symbol|Integer), String]
```
## Singleton methods
### new

```ruby
BLE::AdvertisingReport.new(String) -> void
```
## Instance methods
### format

```ruby
format() -> String
```
### inspect_reports

```ruby
inspect_reports(String) -> report_t
```
### name_include?

```ruby
name_include?(String) -> (bool | nil)
```
## Attr accessors
### event_type (reader)
```ruby
Symbol|String
```
### address_type_code (reader)
```ruby
Integer
```
### address (reader)
```ruby
String
```
### rssi (reader)
```ruby
Integer | nil
```
### reports (reader)
```ruby
report_t
```
