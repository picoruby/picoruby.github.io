---
title: module JS::BLE::GATT
keywords: JS::BLE::GATT
tags: [module]
summary: JS::BLE::GATT module of PicoRuby
sidebar: picoruby_sidebar
permalink: JS_BLE_GATT.html
folder: rbs_doc
---
## Singleton methods
### normalize_uuid

```ruby
JS::BLE::GATT.normalize_uuid(String uuid) -> (Integer | String)
```
### request_device

```ruby
JS::BLE::GATT.request_device(
        ?name: String,
        ?name_prefix: String,
        ?services: Array[String],
        ?optional_services: Array[String]
      ) -> JS::BLE::GATT::Device?
```
### uuids_to_js_array

```ruby
JS::BLE::GATT.uuids_to_js_array(Array[String] uuids) -> JS::Object
```
