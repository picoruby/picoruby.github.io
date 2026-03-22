---
title: class JS::BLE::UART
keywords: JS::BLE::UART
tags: [class]
summary: JS::BLE::UART class of PicoRuby
sidebar: picoruby_sidebar
permalink: JS_BLE_UART.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
JS::BLE::UART.new(
        ?service_uuid: String,
        ?tx_uuid: String,
        ?rx_uuid: String,
        ?name: String,
        ?name_prefix: String
      ) -> void
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
### close

```ruby
instance.close() -> void
```
### connected?

```ruby
instance.connected?() -> bool
```
### gets

```ruby
instance.gets(?timeout: Integer?) -> String?
```
### puts

```ruby
instance.puts(String data) -> nil
```
### read

```ruby
instance.read(Integer nbytes, ?timeout: Integer?) -> String?
```
### read_nonblock

```ruby
instance.read_nonblock(Integer nbytes) -> String?
```
### write

```ruby
instance.write(String data) -> Integer
```
