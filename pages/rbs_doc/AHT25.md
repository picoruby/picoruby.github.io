---
title: AHT25
keywords: AHT25
tags: [class]
summary: AHT25 class of PicoRuby
sidebar: picoruby_sidebar
permalink: AHT25.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
AHT25.new(i2c: I2C) -> instance
```
## Instance methods
### check

```ruby
instance.check() -> bool
```
### read

```ruby
instance.read() -> { temperature: Float, humidity: Float }
```
### reset

```ruby
instance.reset() -> void
```
