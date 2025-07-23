---
title: module Signal
keywords: Signal
tags: [module]
summary: Signal module of PicoRuby
sidebar: picoruby_sidebar
permalink: Signal.html
folder: rbs_doc
---
## Type aliases
### signal_t
```ruby
Integer | String | Symbol
```
### handler_t
```ruby
String | Proc | nil
```
## Singleton methods
### list

```ruby
Signal.list() -> Hash[String, Integer]
```
### raise

```ruby
Signal.raise(signal_t signal) -> void
```
### trap

```ruby
Signal.trap(signal_t signal) { () -> void } -> handler_t
Signal.trap(signal_t signal, String command) -> handler_t
```
