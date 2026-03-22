---
title: module PicoModem
keywords: PicoModem
tags: [module]
summary: PicoModem module of PicoRuby
sidebar: picoruby_sidebar
permalink: PicoModem.html
folder: rbs_doc
---
## Singleton methods
### handle_dfu

```ruby
PicoModem.handle_dfu(IO io_in, IO io_out, String payload) -> void
```
### handle_file_read

```ruby
PicoModem.handle_file_read(IO io_in, IO io_out, String payload) -> void
```
### handle_file_write

```ruby
PicoModem.handle_file_write(IO io_in, IO io_out, String payload) -> void
```
### read_exact

```ruby
PicoModem.read_exact(IO io, Integer n) -> String?
```
### recv_frame

```ruby
PicoModem.recv_frame(IO io) -> [Integer, String]?
```
### send_frame

```ruby
PicoModem.send_frame(IO io, Integer cmd, ?String payload) -> void
```
### session

```ruby
PicoModem.session(IO io_in, IO io_out) -> void
```
