---
title: Watchdog
sidebar: picoruby_sidebar
permalink: Watchdog.html
folder: rbs_doc
---
## Singleton methods
### caused_reboot?

```ruby
Watchdog.caused_reboot?() -> bool
```
### enable

```ruby
Watchdog.enable(Integer delay_ms, ?pause_on_debug: bool) -> 0
```
### enable_caused_reboot?

```ruby
Watchdog.enable_caused_reboot?() -> bool
```
### feed

```ruby
Watchdog.feed() -> 0
```
### get_count

```ruby
Watchdog.get_count() -> Integer
```
### reboot

```ruby
Watchdog.reboot(Integer delay_ms) -> 0
```
### start_tick

```ruby
Watchdog.start_tick(Integer cycle) -> 0
```
### update

```ruby
Watchdog.update(Integer delay_ms) -> 0
```
## Attr accessors
### enabled (accessor)
```ruby
instance.enabled -> bool
```
