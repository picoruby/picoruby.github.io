---
title: class Shell
keywords: Shell
tags: [class]
summary: Shell class of PicoRuby
sidebar: picoruby_sidebar
permalink: Shell.html
folder: rbs_doc
---
## Type aliases
### rtc_t
```ruby
PCF8523
```
### device_t
```ruby
GPIO | ADC | I2C | SPI | UART | PWM
```
## Singleton methods
### bootstrap

```ruby
Shell.bootstrap(String file) -> bool
```
### ensure_system_file

```ruby
Shell.ensure_system_file(String path, String code, ?(Integer | nil) crc) -> void
```
### get_device

```ruby
Shell.get_device(:gpio, String | Symbol name) -> GPIO
Shell.get_device(:adc,  String | Symbol name) -> ADC
Shell.get_device(:i2c,  String | Symbol name) -> I2C
Shell.get_device(:spi,  String | Symbol name) -> SPI
Shell.get_device(:uart, String | Symbol name) -> UART
Shell.get_device(:pwm,  String | Symbol name) -> PWM
```
### new

```ruby
Shell.new(?clean: bool) -> void
```
### next_executable

```ruby
Shell.next_executable-> {code: String, path: String, crc: Integer}
```
### setup_root_volume

```ruby
Shell.setup_root_volume(Symbol drive, ?label: String) -> void
```
### setup_rtc

```ruby
Shell.setup_rtc(rtc_t trc) -> void
```
### setup_sdcard

```ruby
Shell.setup_sdcard(SPI spi) -> void
```
### setup_system_files

```ruby
Shell.setup_system_files(?(String | nil) root, ?force: bool) -> void
```
### simple_question

```ruby
Shell.simple_question(String question) { (String answer) -> boolish } -> void
```
## Instance methods
### run_irb

```ruby
instance.run_irb-> void
```
### run_shell

```ruby
instance.run_shell-> void
```
### show_logo

```ruby
instance.show_logo(?Integer color_num)-> void
```
### start

```ruby
instance.start(?Symbol mode) -> nil
```
