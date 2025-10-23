---
title: class Machine
keywords: Machine
tags: [class]
summary: Machine class of PicoRuby
sidebar: picoruby_sidebar
permalink: Machine.html
folder: rbs_doc
---
## Singleton methods
### busy_wait_ms

```ruby
Machine.busy_wait_ms(Integer ms) -> Integer
```
### debug_puts

```ruby
Machine.debug_puts(String str) -> nil
```
### deep_sleep

```ruby
Machine.deep_sleep(Integer gpio_pin, bool edge, bool high) -> 0
```
### delay_ms

```ruby
Machine.delay_ms(Integer ms) -> Integer
```
### exit

```ruby
Machine.exit(Integer status) -> void
```
### get_hwclock

```ruby
Machine.get_hwclock() -> [Integer, Integer]
```
### mcu_name

```ruby
Machine.mcu_name() -> String
```
### read_memory

```ruby
Machine.read_memory(Integer address, Integer size) -> String
```
### set_hwclock

```ruby
Machine.set_hwclock(Integer tv_sec, Integer tv_nsec) -> Integer
```
### sleep

```ruby
Machine.sleep(Integer | Float sec) -> Integer
```
### tud_mounted?

```ruby
Machine.tud_mounted?() -> bool
```
### tud_task

```ruby
Machine.tud_task() -> void
```
### unique_id

```ruby
Machine.unique_id() -> String
```
### uptime_formatted

```ruby
Machine.uptime_formatted() -> String
```
### uptime_us

```ruby
Machine.uptime_us() -> Integer
```
