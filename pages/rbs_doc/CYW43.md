---
title: class CYW43
keywords: CYW43
tags: [class]
summary: CYW43 class of PicoRuby
sidebar: picoruby_sidebar
permalink: CYW43.html
folder: rbs_doc
---
## Singleton methods
### connect_timeout

```ruby
CYW43.connect_timeout(String ssid, String password, Integer augh, ?Integer timeout) -> bool
```
### disable_sta_mode

```ruby
CYW43.disable_sta_mode() -> bool
```
### enable_sta_mode

```ruby
CYW43.enable_sta_mode() -> bool
```
### init

```ruby
CYW43.init(?String country, ?force: bool) -> bool
```
### initialized?

```ruby
CYW43.initialized?() -> bool
```
### link_connected?

```ruby
CYW43.link_connected?(?bool print_status) -> bool
```
### tcpip_link_status

```ruby
CYW43.tcpip_link_status() -> Integer
```
