---
title: SPI
sidebar: picoruby_sidebar
permalink: SPI.html
folder: rbs_doc
---
## Type aliases
### first_bit_t
```ruby
0|1
```
### mode_t
```ruby
0|1|2|3
```
## Singleton methods
### new

```ruby
SPI.new(
    unit: Symbol,
    ?frequency: Integer,
    ?sck_pin: Integer,
    ?cipo_pin: Integer,
    ?copi_pin: Integer,
    ?cs_pin: Integer,
    ?mode: mode_t,
    ?first_bit: first_bit_t
  ) -> void
```
## Instance methods
### _init

```ruby
_init(String unit, Integer frequency, Integer sck_pin, Integer cipo_pin, Integer copo_pin, Integer mode, Integer first_bit, Integer data_bits) -> Integer
```
### _read

```ruby
_read(Integer repeated_tx_data, Integer len) -> (String|Integer)
```
### _transfer

```ruby
_transfer(Array[Integer]) -> (String|Integer)
```
### _write

```ruby
_write(Array[Integer]) -> Integer
```
### cipo_pin

```ruby
cipo_pin() -> Integer
```
### copi_pin

```ruby
copi_pin() -> Integer
```
### cs_pin

```ruby
cs_pin() -> Integer
```
### deselect

```ruby
deselect() -> void
```
### params_to_array

```ruby
params_to_array(*(Integer|String)|Array[Integer] params) -> Array[Integer]
```
### read

```ruby
read(Integer len, ?Integer repeated_tx_data) -> String
```
### sck_pin

```ruby
sck_pin() -> Integer
```
### select

```ruby
select() ?{ (SPI) -> untyped } -> untyped
```
### transfer

```ruby
transfer(*(Integer|String)|Array[Integer] outputs, ?additional_read_bytes: Integer) -> String
```
### write

```ruby
write(*(Integer|String)|Array[Integer] outputs) -> Integer
```
## Attr accessors
### unit (reader)
```ruby
String
```
