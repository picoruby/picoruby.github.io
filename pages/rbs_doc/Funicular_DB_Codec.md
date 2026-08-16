---
title: module Funicular::DB::Codec
keywords: Funicular::DB::Codec
tags: [module]
summary: Funicular::DB::Codec module of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_DB_Codec.html
folder: rbs_doc
---
## Singleton methods
### civil_from_days

```ruby
Funicular::DB::Codec.civil_from_days(Integer days) -> Array[Integer]
```
### days_from_civil

```ruby
Funicular::DB::Codec.days_from_civil(Integer y, Integer m, Integer d) -> Integer
```
### days_in_month

```ruby
Funicular::DB::Codec.days_in_month(Integer year, Integer mon) -> Integer
```
### decode

```ruby
Funicular::DB::Codec.decode(Symbol? `type`, untyped value) -> untyped
```
### digits_at

```ruby
Funicular::DB::Codec.digits_at(String str, Integer pos, Integer len) -> Integer
```
### encode

```ruby
Funicular::DB::Codec.encode(Symbol? `type`, untyped value) -> untyped
```
### encode_bind

```ruby
Funicular::DB::Codec.encode_bind(untyped value) -> untyped
```
### iso_to_time

```ruby
Funicular::DB::Codec.iso_to_time(String str) -> Time
```
### sep_at

```ruby
Funicular::DB::Codec.sep_at(String str, Integer pos, Integer code) -> void
```
### time_to_iso

```ruby
Funicular::DB::Codec.time_to_iso(Time time) -> String
```
### zone_offset

```ruby
Funicular::DB::Codec.zone_offset(String str, Integer pos) -> Integer
```
### zpad

```ruby
Funicular::DB::Codec.zpad(Integer n, Integer width) -> String
```
