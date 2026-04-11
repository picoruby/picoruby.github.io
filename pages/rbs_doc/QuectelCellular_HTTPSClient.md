---
title: class QuectelCellular::HTTPSClient
keywords: QuectelCellular::HTTPSClient
tags: [class]
summary: QuectelCellular::HTTPSClient class of PicoRuby
sidebar: picoruby_sidebar
permalink: QuectelCellular_HTTPSClient.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
QuectelCellular::HTTPSClient.new(cacert: String, uart: UART, ?log_size: Integer) -> void
```
## Instance methods
### post

```ruby
instance.post(String domain, String path, String body, ?Hash[String, String] headers) -> String
```
