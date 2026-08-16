---
title: class Funicular::DB::Config
keywords: Funicular::DB::Config
tags: [class]
summary: Funicular::DB::Config class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_DB_Config.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::DB::Config.new() -> void
```
## Attr accessors
### replica_debounce_ms (accessor)
```ruby
instance.replica_debounce_ms -> Integer
```
### local_debounce_ms (accessor)
```ruby
instance.local_debounce_ms -> Integer
```
### request_persistent_storage (accessor)
```ruby
instance.request_persistent_storage -> bool
```
### on_persist_error (accessor)
```ruby
instance.on_persist_error -> Proc?
```
### on_boot_error (accessor)
```ruby
instance.on_boot_error -> Proc?
```
### on_session_change (accessor)
```ruby
instance.on_session_change -> Proc?
```
