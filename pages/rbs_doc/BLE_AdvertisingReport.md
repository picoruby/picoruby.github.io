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
BLE::AdvertisingReport.new(String) -> instance
```
## Instance methods
### format

```ruby
instance.format() -> String
```
### inspect_reports

```ruby
instance.inspect_reports(String) -> report_t
```
### name_include?

```ruby
instance.name_include?(String) -> (bool | nil)
```
## Attr accessors
### event_type (reader)
```ruby
instance.event_type -> Symbol|String
```
### address_type_code (reader)
```ruby
instance.address_type_code -> Integer
```
### address (reader)
```ruby
instance.address -> String
```
### rssi (reader)
```ruby
instance.rssi -> Integer | nil
```
### reports (reader)
```ruby
instance.reports -> report_t
```
