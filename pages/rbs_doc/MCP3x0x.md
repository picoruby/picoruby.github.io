---
title: class MCP3x0x
keywords: MCP3x0x
tags: [class]
summary: MCP3x0x class of PicoRuby
sidebar: picoruby_sidebar
permalink: MCP3x0x.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
MCP3x0x.new(
    unit: Symbol,
    ?frequency: Integer,
    ?sck_pin: Integer,
    ?cipo_pin: Integer,
    ?copi_pin: Integer,
    ?cs_pin: Integer
  ) -> instance
```
## Instance methods
### read

```ruby
instance.read(Integer channel, ?differential: bool) -> Integer
```
