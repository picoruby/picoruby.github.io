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
### csrf_token

```ruby
Funicular::HTTP.csrf_token() -> String?
```
### delete

```ruby
Funicular::HTTP.delete(String url) { (Response) -> void } -> void
```
### get

```ruby
Funicular::HTTP.get(String url) { (Response) -> void } -> void
```
### patch

```ruby
Funicular::HTTP.patch(String url, ?Hash[untyped, untyped]? body) { (Response) -> void } -> void
```
### post

```ruby
Funicular::HTTP.post(String url, ?Hash[untyped, untyped]? body) { (Response) -> void } -> void
```
### put

```ruby
Funicular::HTTP.put(String url, ?Hash[untyped, untyped]? body) { (Response) -> void } -> void
```
