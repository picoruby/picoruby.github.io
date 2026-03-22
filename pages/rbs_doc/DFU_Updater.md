---
title: class DFU::Updater
keywords: DFU::Updater
tags: [class]
summary: DFU::Updater class of PicoRuby
sidebar: picoruby_sidebar
permalink: DFU_Updater.html
folder: rbs_doc
---
## Singleton methods
### expected_size

```ruby
DFU::Updater.expected_size(String buf) -> (Integer | nil)
```
### new

```ruby
DFU::Updater.new(?verify_crc: bool, ?verify_signature: bool, ?path: String?, ?read_timeout_sec: Integer, ?read_poll_ms: Integer) -> DFU::Updater
```
## Instance methods
### receive

```ruby
instance.receive(untyped io) -> true
```
