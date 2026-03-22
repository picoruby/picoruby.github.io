---
title: class JS::BLE::GATT::Device
keywords: JS::BLE::GATT::Device
tags: [class]
summary: JS::BLE::GATT::Device class of PicoRuby
sidebar: picoruby_sidebar
permalink: JS_BLE_GATT_Device.html
folder: rbs_doc
---
## Instance methods
### connect

```ruby
instance.connect() -> JS::BLE::GATT::Server?
```
### connected?

```ruby
instance.connected?() -> bool
```
### disconnect

```ruby
instance.disconnect() -> void
```
### on_disconnected

```ruby
instance.on_disconnected() { () -> void } -> void
```
## Attr accessors
### js_device (reader)
```ruby
instance.js_device -> JS::Object
```
### name (reader)
```ruby
instance.name -> String?
```
