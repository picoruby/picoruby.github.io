---
title: ADC
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
### _init

```ruby
ADC._init(pin_t pin) -> 0
```
### new

```ruby
ADC.new(pin_t pin, ?additional_params_t additional_params) -> void
```
## Instance methods
### init_additional_params

```ruby
init_additional_params() -> self
```
### read

```ruby
read() -> Float
```
### read_raw

```ruby
read_raw() -> Integer
```
### read_voltage

```ruby
read_voltage() -> Float
```
