---
title: class MQTT::Client
keywords: MQTT::Client
tags: [class]
summary: MQTT::Client class of PicoRuby
sidebar: picoruby_sidebar
permalink: MQTT_Client.html
folder: rbs_doc
---
## Singleton methods
### connect

```ruby
MQTT::Client.connect(String, ?Integer, ?client_id: String?, ?keep_alive: Integer, ?clean_session: bool, ?username: String?, ?password: String?) { (Client) -> void } -> void
MQTT::Client.connect(String, ?Integer, ?client_id: String?, ?keep_alive: Integer, ?clean_session: bool, ?username: String?, ?password: String?) -> Client
```
### new

```ruby
MQTT::Client.new(String, ?Integer) -> void
```
## Instance methods
### connect

```ruby
instance.connect(?client_id: String?, ?keep_alive: Integer, ?clean_session: bool, ?username: String?, ?password: String?) -> bool
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
