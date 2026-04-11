---
title: class JS::BLE::GATT::Characteristic
keywords: JS::BLE::GATT::Characteristic
tags: [class]
summary: JS::BLE::GATT::Characteristic class of PicoRuby
sidebar: picoruby_sidebar
permalink: JS_BLE_GATT_Characteristic.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
JS::BLE::GATT::Characteristic.new(JS::Object js_char) -> void
```
## Instance methods
### on_change

```ruby
instance.on_change() { (String data) -> void } -> void
```
### read

```ruby
instance.read() -> String?
```
### start_notify

```ruby
instance.start_notify() -> void
```
### stop_notify

```ruby
instance.stop_notify() -> void
```
### write

```ruby
instance.write(String data, ?without_response: bool) -> void
```
## Attr accessors
### js_char (reader)
```ruby
instance.js_char -> JS::Object
```
