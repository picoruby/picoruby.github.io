---
title: class DFU::Meta
keywords: DFU::Meta
tags: [class]
summary: DFU::Meta class of PicoRuby
sidebar: picoruby_sidebar
permalink: DFU_Meta.html
folder: rbs_doc
---
## Singleton methods
### deep_copy

```ruby
DFU::Meta.deep_copy(Hash[String, untyped] hash) -> Hash[String, untyped]
```
### firmware_path

```ruby
DFU::Meta.firmware_path(Hash[String, untyped] data, String slot_name) -> String?
```
### inactive_slot

```ruby
DFU::Meta.inactive_slot(Hash[String, untyped] data) -> String
```
### load

```ruby
DFU::Meta.load-> Hash[String, untyped]
```
### recover

```ruby
DFU::Meta.recover-> void
```
### save

```ruby
DFU::Meta.save(Hash[String, untyped] data) -> void
```
### slot

```ruby
DFU::Meta.slot(Hash[String, untyped] data, String slot_name) -> Hash[String, untyped]
```
