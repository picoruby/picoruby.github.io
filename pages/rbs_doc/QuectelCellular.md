---
title: class QuectelCellular
keywords: QuectelCellular
tags: [class]
summary: QuectelCellular class of PicoRuby
sidebar: picoruby_sidebar
permalink: QuectelCellular.html
folder: rbs_doc
---
## Type aliases
### log_t
```ruby
{ cmd: String, res: String }
```
## Singleton methods
### new

```ruby
QuectelCellular.new(uart: UART, ?log_size: Integer) -> QuectelCellular
```
## Instance methods
### check_sim_status

```ruby
instance.check_sim_status() -> void
```
### command

```ruby
instance.command(String cmd, (String|nil) expected_response, ?(String|nil) error_response, ?Integer timeout) -> bool
```
### command!

```ruby
instance.command!(String cmd, (String|nil) expected_response, ?(String|nil) error_response, ?Integer timeout) -> void
```
### configure_and_activate_context

```ruby
instance.configure_and_activate_context() -> void
```
### fdel

```ruby
instance.fdel(String dst) -> String
```
### flst

```ruby
instance.flst(?(String|nil) storage) -> Array[String]
```
### fupl

```ruby
instance.fupl(String src, String dst, ?chunk_size: Integer) -> String
```
### perst=

```ruby
instance.perst=(GPIO gpio) -> GPIO
```
### reset

```ruby
instance.reset() -> void
```
### uart_read

```ruby
instance.uart_read() -> String
```
## Attr accessors
### log (reader)
```ruby
instance.log -> Array[log_t]
```
