---
title: class SDMMC
keywords: SDMMC
tags: [class]
summary: SDMMC class of PicoRuby
sidebar: picoruby_sidebar
permalink: SDMMC.html
folder: rbs_doc
---
## Type aliases
### sdmmc_width_t
```ruby
1|4
```
## Singleton methods
### new

```ruby
SDMMC.new(
    clk_pin: Integer,
    cmd_pin: Integer,
    d0_pin: Integer,
    ?d1_pin: Integer,
    ?d2_pin: Integer,
    ?d3_pin: Integer,
    ?width: sdmmc_width_t
  ) -> SDMMC
```
## Instance methods
### clk_pin

```ruby
instance.clk_pin() -> Integer
```
### cmd_pin

```ruby
instance.cmd_pin() -> Integer
```
### d0_pin

```ruby
instance.d0_pin() -> Integer
```
### d1_pin

```ruby
instance.d1_pin() -> Integer
```
### d2_pin

```ruby
instance.d2_pin() -> Integer
```
### d3_pin

```ruby
instance.d3_pin() -> Integer
```
### width

```ruby
instance.width() -> Integer
```
