---
title: AHT25
sidebar: picoruby_sidebar
permalink: AHT25.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
AHT25.new(i2c: I2C) -> void
```
## Instance methods
### check

```ruby
check() -> bool
```
### read

```ruby
read() -> {temperature: Float, humidity: Float}
```
### reset

```ruby
reset() -> void
```
