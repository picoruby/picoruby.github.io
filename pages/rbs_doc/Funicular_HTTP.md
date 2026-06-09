---
title: module Funicular::HTTP
keywords: Funicular::HTTP
tags: [module]
summary: Funicular::HTTP module of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_HTTP.html
folder: rbs_doc
---
## Singleton methods
### cache_clear

```ruby
Funicular::HTTP.cache_clear() -> nil
```
### cache_init!

```ruby
Funicular::HTTP.cache_init!() -> IndexedDB::KVS
```
### cache_lookup

```ruby
Funicular::HTTP.cache_lookup(String url) -> untyped
```
### cache_purge

```ruby
Funicular::HTTP.cache_purge(String url) -> nil
```
### cache_write

```ruby
Funicular::HTTP.cache_write(String url, Hash[String, untyped] entry) -> nil
```
### csrf_token

```ruby
Funicular::HTTP.csrf_token() -> String?
```
### delete

```ruby
Funicular::HTTP.delete(String url, ?cache: Integer?) { (Response) -> void } -> void
```
### get

```ruby
Funicular::HTTP.get(String url, ?cache: Integer?) { (Response) -> void } -> void
```
### patch

```ruby
Funicular::HTTP.patch(String url, ?Hash[untyped, untyped]? body, ?cache: Integer?) { (Response) -> void } -> void
```
### post

```ruby
Funicular::HTTP.post(String url, ?Hash[untyped, untyped]? body, ?cache: Integer?) { (Response) -> void } -> void
```
### put

```ruby
Funicular::HTTP.put(String url, ?Hash[untyped, untyped]? body, ?cache: Integer?) { (Response) -> void } -> void
```
