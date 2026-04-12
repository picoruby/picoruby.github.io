---
title: class Net::NTP::Packet
keywords: Net::NTP::Packet
tags: [class]
summary: Net::NTP::Packet class of PicoRuby
sidebar: picoruby_sidebar
permalink: Net_NTP_Packet.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Net::NTP::Packet.new(?String? data) -> void
```
## Instance methods
### parse

```ruby
instance.parse(String data) -> void
```
### receive_time

```ruby
instance.receive_time() -> (Integer | nil)
```
### reference_time

```ruby
instance.reference_time() -> (Integer | nil)
```
### to_binary

```ruby
instance.to_binary() -> String
```
### transmit_time

```ruby
instance.transmit_time() -> (Integer | nil)
```
