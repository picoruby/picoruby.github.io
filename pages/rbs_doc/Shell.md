---
title: class Shell
keywords: Shell
tags: [class]
summary: Shell class of PicoRuby
sidebar: picoruby_sidebar
permalink: Shell.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Shell.new(?clean: bool) -> void
```
### next_executable

```ruby
Shell.next_executable-> {code: String, path: String}
```
### setup_rtc

```ruby
Shell.setup_rtc(rtc_t trc) -> void
```
### setup_sdcard

```ruby
Shell.setup_sdcard(SPI spi) -> void
```
## Instance methods
### bootstrap

```ruby
instance.bootstrap(String file) -> bool
```
### run_irb

```ruby
instance.run_irb-> void
```
### run_shell

```ruby
instance.run_shell-> void
```
### setup_root_volume

```ruby
instance.setup_root_volume(Symbol drive, ?label: String) -> void
```
### setup_system_files

```ruby
instance.setup_system_files(?(String | nil) root, ?force: bool) -> void
```
### show_logo

```ruby
instance.show_logo-> nil
```
### simple_question

```ruby
instance.simple_question(String question) { (String answer) -> boolish } -> void
```
### start

```ruby
instance.start(?Symbol mode) -> nil
```
