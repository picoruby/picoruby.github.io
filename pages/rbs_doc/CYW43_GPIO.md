---
title: class CYW43::GPIO
keywords: CYW43::GPIO
tags: [class]
summary: CYW43::GPIO class of PicoRuby
sidebar: picoruby_sidebar
permalink: CYW43_GPIO.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
CYW43::GPIO.new(Integer pin) -> void
```
## Instance methods
### high?

```ruby
instance.high?() -> bool
```
### low?

```ruby
instance.low?() -> bool
```
### read

```ruby
instance.read() -> GPIO::gpio_logic_t
```
### write

```ruby
instance.write(Integer) -> Integer
```
