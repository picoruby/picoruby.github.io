---
title: class Network::WiFi
keywords: Network::WiFi
tags: [class]
summary: Network::WiFi class of PicoRuby
sidebar: picoruby_sidebar
permalink: Network_WiFi.html
folder: rbs_doc
---
## Singleton methods
### connect_timeout

```ruby
Network::WiFi.connect_timeout(String ssid, String password, Integer auth, ?Integer timeout) -> bool
```
### dhcp_supplied?

```ruby
Network::WiFi.dhcp_supplied?() -> bool
```
### disconnect

```ruby
Network::WiFi.disconnect() -> bool
```
### enable_sta_mode

```ruby
Network::WiFi.enable_sta_mode() -> bool
```
### init

```ruby
Network::WiFi.init(?String country, ?force: bool) -> bool
```
### initialized?

```ruby
Network::WiFi.initialized?() -> bool
```
### ipv4_address

```ruby
Network::WiFi.ipv4_address() -> (String | nil)
```
### ipv4_gateway

```ruby
Network::WiFi.ipv4_gateway() -> (String | nil)
```
### ipv4_netmask

```ruby
Network::WiFi.ipv4_netmask() -> (String | nil)
```
### link_connected?

```ruby
Network::WiFi.link_connected?() -> bool
```
### tcpip_link_status

```ruby
Network::WiFi.tcpip_link_status() -> Integer
```
### tcpip_link_status_name

```ruby
Network::WiFi.tcpip_link_status_name() -> String
```
