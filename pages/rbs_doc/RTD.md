---
title: RTD
sidebar: picoruby_sidebar
permalink: RTD.html
folder: rbs_doc
---
## Type aliases
### unit_t
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
  ) -> void
```
## Instance methods
### read

```ruby
read(?unit: unit_t) -> Float
```
### temperature_in_celsius

```ruby
temperature_in_celsius(Float) -> Float
```
## Attr accessors
### sample_count (accessor)
```ruby
Integer
```
