---
title: class ESP32::WiFi
keywords: ESP32::WiFi
tags: [class]
summary: ESP32::WiFi class of PicoRuby
sidebar: picoruby_sidebar
permalink: ESP32_WiFi.html
folder: rbs_doc
---
## Singleton methods
### connect_timeout

```ruby
ESP32::WiFi.connect_timeout(String ssid, String password, Integer auth, ?Integer timeout) -> bool
```
### dhcp_supplied?

```ruby
ESP32::WiFi.dhcp_supplied?() -> bool
```
### disconnect

```ruby
ESP32::WiFi.disconnect() -> bool
```
### enable_sta_mode

```ruby
ESP32::WiFi.enable_sta_mode() -> bool
```
### init

```ruby
ESP32::WiFi.init(?String country, ?force: bool) -> bool
```
### initialized?

```ruby
ESP32::WiFi.initialized?() -> bool
```
### ipv4_address

```ruby
ESP32::WiFi.ipv4_address() -> (String | nil)
```
### ipv4_gateway

```ruby
ESP32::WiFi.ipv4_gateway() -> (String | nil)
```
### ipv4_netmask

```ruby
ESP32::WiFi.ipv4_netmask() -> (String | nil)
```
### link_connected?

```ruby
ESP32::WiFi.link_connected?() -> bool
```
### tcpip_link_status

```ruby
ESP32::WiFi.tcpip_link_status() -> Integer
```
### tcpip_link_status_name

```ruby
ESP32::WiFi.tcpip_link_status_name() -> String
```
