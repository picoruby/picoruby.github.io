---
title: class Net::MQTT::Client
keywords: Net::MQTT::Client
tags: [class]
summary: Net::MQTT::Client class of PicoRuby
sidebar: picoruby_sidebar
permalink: Net_MQTT_Client.html
folder: rbs_doc
---
## Singleton methods
### connect

```ruby
Net::MQTT::Client.connect(String, ?Integer, ?client_id: String?, ?keep_alive: Integer, ?clean_session: bool, ?username: String?, ?password: String?, ?ssl: bool, ?ca_file: String?, ?cert_file: String?, ?key_file: String?) { (Client) -> void } -> void
Net::MQTT::Client.connect(String, ?Integer, ?client_id: String?, ?keep_alive: Integer, ?clean_session: bool, ?username: String?, ?password: String?, ?ssl: bool, ?ca_file: String?, ?cert_file: String?, ?key_file: String?) -> Client
```
### new

```ruby
Net::MQTT::Client.new(String host, ?Integer port, ?client_id: String?, ?keep_alive: Integer, ?clean_session: bool, ?username: String?, ?password: String?, ?ssl: bool, ?ca_file: String?, ?cert_file: String?, ?key_file: String?) -> void
```
## Instance methods
### connect

```ruby
instance.connect() -> bool
```
### connected?

```ruby
instance.connected?() -> bool
```
### disconnect

```ruby
instance.disconnect() -> void
```
### ping

```ruby
instance.ping() -> bool
```
### publish

```ruby
instance.publish(String, String, ?retain: bool, ?qos: Integer) -> void
```
### receive

```ruby
instance.receive(?timeout: (Integer | Float)?) -> [String, String]?
```
### subscribe

```ruby
instance.subscribe(*String, ?qos: Integer) -> void
```
### unsubscribe

```ruby
instance.unsubscribe(*String) -> void
```
