---
title: RTD
sidebar: picoruby_sidebar
permalink: RTD.html
folder: rbs_doc
---
## Type aliases
### rtd_unit_t
```ruby
:celsius | :fahrenheit | :kelvin
```
## Singleton methods
### new

```ruby
RTD.new(
    driver: (:ADC | MCP3424 | MCP3208),
    current_gpio: GPIO,
    r_ref: (Float | Integer),
    ?channels: Hash[Symbol, (Integer | ADC)]
  ) -> instance
```
## Instance methods
### read

```ruby
instance.read(?unit: rtd_unit_t) -> Float
```
### temperature_in_celsius

```ruby
instance.temperature_in_celsius(Float) -> Float
```
## Attr accessors
### sample_count (accessor)
```ruby
instance.sample_count -> Integer
```
