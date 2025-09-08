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
### spi_output_t
```ruby
Integer|String|Array[Integer]
```
## Singleton methods
### new

```ruby
SPI.new(
    unit: Symbol | String,
    ?frequency: Integer,
    ?sck_pin: Integer,
    ?cipo_pin: Integer,
    ?copi_pin: Integer,
    ?cs_pin: Integer,
    ?mode: spi_mode_t,
    ?first_bit: spi_first_bit_t
  ) -> SPI
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
instance.transfer(*spi_output_t outputs, ?additional_read_bytes: Integer) -> String
```
### write

```ruby
instance.write(*spi_output_t outputs) -> Integer
```
## Attr accessors
### cs (accessor)
```ruby
instance.cs -> GPIO
```
### unit (accessor)
```ruby
instance.unit -> String
```
