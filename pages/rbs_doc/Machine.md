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
### deep_sleep

```ruby
Machine.deep_sleep(Integer gpio_pin, bool edge, bool high) -> 0
```
### delay_ms

```ruby
Machine.delay_ms(Integer ms) -> Integer
```
### read_memory

```ruby
Machine.read_memory(Integer address, Integer size) -> String
```
### sleep

```ruby
Machine.sleep(Integer sec) -> Integer
```
### unique_id

```ruby
Machine.unique_id() -> String
```
### using_busy_wait

```ruby
Machine.using_busy_wait() { () -> void } -> void
```
### using_delay

```ruby
Machine.using_delay() { () -> void } -> void
```
