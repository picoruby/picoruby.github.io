---
title: class UART
keywords: UART
tags: [class]
summary: UART class of PicoRuby
sidebar: picoruby_sidebar
permalink: UART.html
folder: rbs_doc
---
## Include
[IRQ](IRQ.html)
## Type aliases
### unit_t
```ruby
Symbol|String
```
## Singleton methods
### new

```ruby
UART.new(
    ?unit: unit_t?,
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
  ) -> void
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
### event_source_id

```ruby
instance.event_source_id() -> Integer
```
### flush

```ruby
instance.flush() -> self
```
### getbyte

```ruby
instance.getbyte() -> (Integer | nil)
```
### gets

```ruby
instance.gets() -> String?
```
### inject_rx

```ruby
instance.inject_rx(String bytes) -> Integer
```
### last_read_timestamp_us

```ruby
instance.last_read_timestamp_us() -> Integer?
```
### line_ending=

```ruby
instance.line_ending=(("\n"|"\r\n"|"\r") line_ending) -> void
```
### putc

```ruby
instance.putc((Integer | String) ch) -> (Integer | String)
```
### puts

```ruby
instance.puts(String str) -> nil
```
### read

```ruby
instance.read(?Integer len) -> (String | nil)
```
### readpartial

```ruby
instance.readpartial(Integer maxlen) -> String
```
### rx_overflow_count

```ruby
instance.rx_overflow_count() -> Integer
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
### ungetbyte

```ruby
instance.ungetbyte(Integer byte) -> nil
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
