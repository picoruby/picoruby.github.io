---
title: class ADC
keywords: ADC
tags: [class]
summary: ADC class of PicoRuby
sidebar: picoruby_sidebar
permalink: ADC.html
folder: rbs_doc
---
## Type aliases
### pin_t
```ruby
Integer|String|Symbol
```
### additional_params_t
```ruby
Hash[untyped, untyped]
```
## Singleton methods
### new

```ruby
ADC.new(pin_t pin, ?additional_params_t additional_params) -> instance
```
## Instance methods
### read

```ruby
instance.read() -> Float
```
### read_raw

```ruby
instance.read_raw() -> Integer
```
### read_voltage

```ruby
instance.read_voltage() -> Float
```
