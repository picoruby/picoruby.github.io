---
title: class SPI
keywords: SPI
tags: [class]
summary: SPI class of PicoRuby
sidebar: picoruby_sidebar
permalink: SPI.html
folder: rbs_doc
---
## Type aliases
### spi_first_bit_t
```ruby
0|1
```
### spi_mode_t
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
    ?mode: spi_mode_t,
    ?first_bit: spi_first_bit_t
  ) -> instance
```
## Instance methods
### cipo_pin

```ruby
instance.cipo_pin() -> Integer
```
### copi_pin

```ruby
instance.copi_pin() -> Integer
```
### cs_pin

```ruby
instance.cs_pin() -> Integer
```
### deselect

```ruby
instance.deselect() -> void
```
### params_to_array

```ruby
instance.params_to_array(*(Integer|String)|Array[Integer] params) -> Array[Integer]
```
### read

```ruby
instance.read(Integer len, ?Integer repeated_tx_data) -> String
```
### sck_pin

```ruby
instance.sck_pin() -> Integer
```
### select

```ruby
instance.select() ?{ (SPI) -> untyped } -> untyped
```
### transfer

```ruby
instance.transfer(*(Integer|String)|Array[Integer] outputs, ?additional_read_bytes: Integer) -> String
```
### write

```ruby
instance.write(*(Integer|String)|Array[Integer] outputs) -> Integer
```
## Attr accessors
### unit (reader)
```ruby
instance.unit -> String
```
