---
title: class BLE::UART
keywords: BLE::UART
tags: [class]
summary: BLE::UART class of PicoRuby
sidebar: picoruby_sidebar
permalink: BLE_UART.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
BLE::UART.new(
      ?role: :peripheral | :central,
      ?name: String,
      ?service_uuid: String,
      ?rx_uuid: String,
      ?tx_uuid: String
    ) -> BLE::UART
```
## Instance methods
### available

```ruby
instance.available() -> Integer
```
### available?

```ruby
instance.available?() -> bool
```
### central?

```ruby
instance.central?() -> bool
```
### connected?

```ruby
instance.connected?() -> bool
```
### gets_nonblock

```ruby
instance.gets_nonblock() -> (String | nil)
```
### heartbeat_callback

```ruby
instance.heartbeat_callback() -> void
```
### packet_callback

```ruby
instance.packet_callback(String event_packet) -> void
```
### peripheral?

```ruby
instance.peripheral?() -> bool
```
### puts

```ruby
instance.puts(?untyped data) -> nil
```
### read_nonblock

```ruby
instance.read_nonblock(?Integer nbytes) -> (String | nil)
```
### start

```ruby
instance.start() { () -> void } -> Integer
```
### write

```ruby
instance.write(untyped data) -> Integer
```
