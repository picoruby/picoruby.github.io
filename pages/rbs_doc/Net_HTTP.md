---
title: class Net::HTTP
keywords: Net::HTTP
tags: [class]
summary: Net::HTTP class of PicoRuby
sidebar: picoruby_sidebar
permalink: Net_HTTP.html
folder: rbs_doc
---
## Singleton methods
### get

```ruby
Net::HTTP.get(String uri_or_host, String path, ?Integer? port) -> String?
```
### get_response

```ruby
Net::HTTP.get_response(String uri_or_host, ?String? path, ?Integer? port) -> HTTPResponse
```
### new

```ruby
Net::HTTP.new(String address, ?Integer? port) -> Net::HTTP
```
### post_form

```ruby
Net::HTTP.post_form(String url, Hash[untyped, untyped] params) -> HTTPResponse
```
## Instance methods
### active?

```ruby
instance.active?() -> bool
```
### delete

```ruby
instance.delete(String path, ?Hash[String, String]? initheader, ?untyped dest) { (String) -> void } -> HTTPResponse
```
### finish

```ruby
instance.finish() -> void
```
### get

```ruby
instance.get(String path, ?Hash[String, String]? initheader, ?untyped dest) ?{ (String) -> void } -> HTTPResponse
```
### head

```ruby
instance.head(String path, ?Hash[String, String]? initheader) -> HTTPResponse
```
### post

```ruby
instance.post(String path, String data, ?Hash[String, String]? initheader, ?untyped dest) { (String) -> void } -> HTTPResponse
```
### put

```ruby
instance.put(String path, String data, ?Hash[String, String]? initheader, ?untyped dest) { (String) -> void } -> HTTPResponse
```
### request

```ruby
instance.request(HTTPGenericRequest req, ?String? body) ?{ (String) -> void } -> HTTPResponse
```
### start

```ruby
instance.start() { (HTTP) -> untyped } -> HTTPResponse
instance.start() -> HTTP
```
### use_ssl?

```ruby
instance.use_ssl?() -> bool
```
## Attr accessors
### address (accessor)
```ruby
instance.address -> String
```
### port (accessor)
```ruby
instance.port -> Integer
```
### open_timeout (accessor)
```ruby
instance.open_timeout -> Integer
```
### read_timeout (accessor)
```ruby
instance.read_timeout -> Integer
```
### use_ssl (accessor)
```ruby
instance.use_ssl -> bool
```
### verify_mode (accessor)
```ruby
instance.verify_mode -> Integer?
```
### ca_file (accessor)
```ruby
instance.ca_file -> String?
```
### ca_path (accessor)
```ruby
instance.ca_path -> String?
```
### started (reader)
```ruby
instance.started -> bool
```
