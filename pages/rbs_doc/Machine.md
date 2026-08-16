---
title: module Machine
keywords: Machine
tags: [module]
summary: Machine module of PicoRuby
sidebar: picoruby_sidebar
permalink: Machine.html
folder: rbs_doc
---
## Singleton methods
### _stdin_getc

```ruby
Machine._stdin_getc() -> (String | nil)
```
### _stdin_gets

```ruby
Machine._stdin_gets() -> (String | nil)
```
### board_millis

```ruby
Machine.board_millis() -> Integer
```
### bootsel_pressed?

```ruby
Machine.bootsel_pressed?() -> bool
```
### busy_wait_ms

```ruby
Machine.busy_wait_ms(Integer ms) -> Integer
```
### check_signal

```ruby
Machine.check_signal() -> void
```
### debug_puts

```ruby
Machine.debug_puts(String str) -> nil
```
### delay_ms

```ruby
Machine.delay_ms(Integer ms) -> Integer
```
### exit

```ruby
Machine.exit(?Integer status) -> bot
```
### get_hwclock

```ruby
Machine.get_hwclock() -> [Integer, Integer]
```
### mcu_name

```ruby
Machine.mcu_name() -> String
```
### poll_signal

```ruby
Machine.poll_signal() -> Symbol?
```
### pop_signal_self_manage

```ruby
Machine.pop_signal_self_manage() -> bool
```
### posix?

```ruby
Machine.posix?() -> bool
```
### read_memory

```ruby
Machine.read_memory(Integer address, Integer size) -> String
```
### reboot

```ruby
Machine.reboot(?Integer wait_ms) -> nil
```
### set_hwclock

```ruby
Machine.set_hwclock(Integer tv_sec) -> Integer
```
### signal_self_manage

```ruby
Machine.signal_self_manage() -> void
```
### sleep

```ruby
Machine.sleep(deep: bool, source: _SleepGpioSource | :timer, **untyped opt) -> void
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
### wifi_available?

```ruby
Machine.wifi_available?() -> bool
```
