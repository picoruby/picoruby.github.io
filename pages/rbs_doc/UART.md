---
title: UART
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
  ) -> void
```
## Instance methods
### break

```ruby
break(?Integer|Float time) -> self
```
### bytes_available

```ruby
bytes_available() -> Integer
```
### clear_rx_buffer

```ruby
clear_rx_buffer() -> self
```
### clear_tx_buffer

```ruby
clear_tx_buffer() -> self
```
### flush

```ruby
flush() -> self
```
### gets

```ruby
gets() -> String
```
### line_ending=

```ruby
line_ending=(("\n"|"\r\n"|"\r") line_ending) -> void
```
### puts

```ruby
puts(String) -> nil
```
### read

```ruby
read(?Integer len) -> (String | nil)
```
### readpartial

```ruby
readpartial(Integer maxlen) -> String
```
### set_flow_control

```ruby
set_flow_control(Integer flow_control, Integer rts_pin, Integer cts_pin) -> void
```
### set_format

```ruby
set_format(Integer data_bits, Integer stop_bits, Integer parity) -> void
```
### setmode

```ruby
setmode(
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
write(String str) -> Integer
```
