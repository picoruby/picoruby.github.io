---
title: UART
keywords: UART
tags: [class]
summary: UART class of PicoRuby
sidebar: picoruby_sidebar
permalink: UART.html
folder: rbs_doc
---
## Type aliases
### unit_t
```ruby
Symbol|String
```
## Singleton methods
### new

```ruby
UART.new(
    unit: unit_t,
    ?txd_pin: Integer,
    ?rxd_pin: Integer,
    ?baudrate: Integer,
    ?data_bits: Integer,
    ?stop_bits: Integer,
    ?parity: Integer,
    ?flow_control: Integer,
    ?rts_pin: Integer,
    ?cts_pin: Integer,
    ?rx_buffer_size: Integer?
  ) -> instance
```
## Instance methods
### break

```ruby
instance.break(?Integer|Float time) -> self
```
### bytes_available

```ruby
instance.bytes_available() -> Integer
```
### clear_rx_buffer

```ruby
instance.clear_rx_buffer() -> self
```
### clear_tx_buffer

```ruby
instance.clear_tx_buffer() -> self
```
### flush

```ruby
instance.flush() -> self
```
### gets

```ruby
instance.gets() -> String
```
### line_ending=

```ruby
instance.line_ending=(("\n"|"\r\n"|"\r") line_ending) -> void
```
### puts

```ruby
instance.puts(String) -> nil
```
### read

```ruby
instance.read(?Integer len) -> (String | nil)
```
### readpartial

```ruby
instance.readpartial(Integer maxlen) -> String
```
### set_flow_control

```ruby
instance.set_flow_control(Integer flow_control, Integer rts_pin, Integer cts_pin) -> void
```
### set_format

```ruby
instance.set_format(Integer data_bits, Integer stop_bits, Integer parity) -> void
```
### setmode

```ruby
instance.setmode(
    ?baudrate: Integer?,
    ?data_bits: Integer?,
    ?stop_bits: Integer?,
    ?parity: Integer?,
    ?flow_control: Integer?,
    ?rts_pin: Integer?,
    ?cts_pin: Integer?
  ) -> self
```
### write

```ruby
instance.write(String str) -> Integer
```
## Attr accessors
### baudrate (reader)
```ruby
instance.baudrate -> Integer
```
