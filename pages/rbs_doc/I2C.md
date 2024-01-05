---
title: I2C
sidebar: picoruby_sidebar
permalink: I2C.html
folder: rbs_doc
---
## Type aliases
### outputs_t
```ruby
Integer|String|Array[Integer]
```
## Singleton methods
### new

```ruby
I2C.new(
    unit: Symbol|nil,
    ?frequency: Integer,
    ?sda_pin: Integer,
    ?scl_pin: Integer
  ) -> void
```
## Instance methods
### _init

```ruby
_init(
    String unit,
    Integer frequency,
    Integer sda_pin,
    Integer scl_pin
  ) -> Integer
```
### _read

```ruby
_read(
    Integer unit_num,
    Integer i2c_adrs_7,
    Integer len
  ) -> (String | Integer)
```
### _write

```ruby
_write(
    Integer unit_num,
    Integer i2c_adrs_7,
    Array[Integer] output_array,
    bool nostop
  ) -> Integer
```
### outputs_array

```ruby
outputs_array(
    Array[outputs_t] outputs
  ) -> Array[Integer]
```
### read

```ruby
read(
    Integer i2c_adrs_7,
    Integer len,
    *outputs_t outputs
  ) -> String
```
### scan

```ruby
scan() -> nil
```
### write

```ruby
write(
    Integer i2c_adrs_7,
    *outputs_t outputs
  ) -> Integer
```
