---
title: class RotateLogger
keywords: RotateLogger
tags: [class]
summary: RotateLogger class of PicoRuby
sidebar: picoruby_sidebar
permalink: RotateLogger.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
RotateLogger.new(dir: String, ?basename: String, ?ext: String, ?interval: Integer, ?keep_size: Integer | nil) -> void
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
### flush_level=

```ruby
instance.flush_level=(Logger::level_t level) -> Integer
```
### info

```ruby
instance.info(String message) -> bool
instance.info(String program_name) { () -> void } -> bool
```
### level=

```ruby
instance.level=(Logger::level_t level) -> Integer
```
### trailing_lines=

```ruby
instance.trailing_lines=(Integer lines) -> Integer
```
### warn

```ruby
instance.warn(String message) -> bool
instance.warn(String program_name) { () -> void } -> bool
```
