---
title: class PIO::StateMachine
keywords: PIO::StateMachine
tags: [class]
summary: PIO::StateMachine class of PicoRuby
sidebar: picoruby_sidebar
permalink: PIO_StateMachine.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
PIO::StateMachine.new(
      pio: pio_num_t,
      sm: Integer,
      program: Program,
      ?freq: Integer,
      ?out_pins: Integer,
      ?out_pin_count: Integer,
      ?set_pins: Integer,
      ?set_pin_count: Integer,
      ?in_pins: Integer,
      ?sideset_pins: Integer,
      ?jmp_pin: Integer,
      ?out_shift_right: bool,
      ?out_shift_autopull: bool,
      ?out_shift_threshold: Integer,
      ?in_shift_right: bool,
      ?in_shift_autopush: bool,
      ?in_shift_threshold: Integer,
      ?fifo_join: fifo_join_t
    ) -> StateMachine
```
## Instance methods
### clear_fifos

```ruby
instance.clear_fifos() -> void
```
### drain_tx

```ruby
instance.drain_tx() -> void
```
### exec

```ruby
instance.exec(Integer instruction) -> void
```
### get

```ruby
instance.get() -> Integer
```
### get_nonblocking

```ruby
instance.get_nonblocking() -> Integer?
```
### put_buffer

```ruby
instance.put_buffer(Array[Integer] values) -> void
```
### put_bytes

```ruby
instance.put_bytes(String data) -> void
```
### put_nonblocking

```ruby
instance.put_nonblocking(Integer value) -> bool
```
### restart

```ruby
instance.restart() -> void
```
### rx_empty

```ruby
instance.rx_empty() -> Integer
```
### rx_empty?

```ruby
instance.rx_empty?() -> bool
```
### rx_full

```ruby
instance.rx_full() -> Integer
```
### rx_full?

```ruby
instance.rx_full?() -> bool
```
### rx_level

```ruby
instance.rx_level() -> Integer
```
### start

```ruby
instance.start() -> void
```
### stop

```ruby
instance.stop() -> void
```
### tx_empty

```ruby
instance.tx_empty() -> Integer
```
### tx_empty?

```ruby
instance.tx_empty?() -> bool
```
### tx_full

```ruby
instance.tx_full() -> Integer
```
### tx_full?

```ruby
instance.tx_full?() -> bool
```
### tx_level

```ruby
instance.tx_level() -> Integer
```
