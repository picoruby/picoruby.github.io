---
title: class Net::HTTPResponse
keywords: Net::HTTPResponse
tags: [class]
summary: Net::HTTPResponse class of PicoRuby
sidebar: picoruby_sidebar
permalink: Net_HTTPResponse.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Net::HTTPResponse.new(?String? code, ?String? message, ?String? http_version) -> void
```
### parse

```ruby
Net::HTTPResponse.parse(String response_string) -> HTTPResponse
```
## Instance methods
### []

```ruby
instance.[](String key) -> String?
```
### []=

```ruby
instance.[]=(String key, String value) -> String
```
### client_error?

```ruby
instance.client_error?() -> boolish
```
### code_type

```ruby
instance.code_type() -> singleton(HTTPResponse)?
```
### error?

```ruby
instance.error?() -> boolish
```
### get_fields

```ruby
instance.get_fields(String key) -> Array[String | nil]
```
### read_body

```ruby
instance.read_body() ?{ (String) -> void } -> String?
```
### redirect?

```ruby
instance.redirect?() -> boolish
```
### server_error?

```ruby
instance.server_error?() -> boolish
```
### success?

```ruby
instance.success?() -> boolish
```
### to_s

```ruby
instance.to_s() -> String
```
## Attr accessors
### code (reader)
```ruby
instance.code -> String?
```
### message (reader)
```ruby
instance.message -> String?
```
### http_version (reader)
```ruby
instance.http_version -> String?
```
### header (accessor)
```ruby
instance.header -> Hash[String, String]
```
### body (accessor)
```ruby
instance.body -> String?
```
