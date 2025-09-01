---
title: class I2C
keywords: I2C
tags: [class]
summary: I2C class of PicoRuby
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
    ?scl_pin: Integer,
    ?timeout: Integer
  ) -> instance
```
## Instance methods
### read

```ruby
instance.read(
    Integer i2c_adrs_7,
    Integer len,
    *outputs_t outputs,
    ?timeout: Integer,
  ) -> String
```
### scan

```ruby
instance.scan(?timeout: Integer) -> nil
```
### write

```ruby
instance.write(
    Integer i2c_adrs_7,
    *outputs_t outputs,
    ?timeout: Integer,
    ?nostop: bool,
  ) -> Integer
```
