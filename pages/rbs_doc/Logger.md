---
title: class Logger
keywords: Logger
tags: [class]
summary: Logger class of PicoRuby
sidebar: picoruby_sidebar
permalink: Logger.html
folder: rbs_doc
---
## Type aliases
### level_t
```ruby
:debug | :info | :warn | :error | :fatal
```
## Singleton methods
### new

```ruby
Logger.new(String | untyped io_or_filename, ?level: level_t, ?buffer_max: Integer, ?trailing_lines: Integer) -> void
```
## Instance methods
### close

```ruby
instance.close() -> void
```
### debug

```ruby
instance.debug(String message) -> bool
instance.debug(String program_name) { () -> void } -> bool
```
### error

```ruby
instance.error(String message) -> bool
instance.error(String program_name) { () -> void } -> bool
```
### fatal

```ruby
instance.fatal(String message) -> bool
instance.fatal(String program_name) { () -> void } -> bool
```
### flush

```ruby
instance.flush() -> void
```
### flush_level

```ruby
instance.flush_level() -> level_t
```
### flush_level=

```ruby
instance.flush_level=(level_t level_name) -> level_t
```
### info

```ruby
instance.info(String message) -> bool
instance.info(String program_name) { () -> void } -> bool
```
### level

```ruby
instance.level() -> level_t
```
### level=

```ruby
instance.level=(level_t level_name) -> level_t
```
### warn

```ruby
instance.warn(String message) -> bool
instance.warn(String program_name) { () -> void } -> bool
```
## Attr accessors
### trailing_lines (accessor)
```ruby
instance.trailing_lines -> Integer
```
