---
title: class SQLite3::Backup
keywords: SQLite3::Backup
tags: [class]
summary: SQLite3::Backup class of PicoRuby
sidebar: picoruby_sidebar
permalink: SQLite3_Backup.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
SQLite3::Backup.new(SQLite3::Database dst, String dstname, SQLite3::Database src, String srcname) -> SQLite3::Backup
```
## Instance methods
### finish

```ruby
instance.finish() -> nil
```
### pagecount

```ruby
instance.pagecount() -> Integer
```
### remaining

```ruby
instance.remaining() -> Integer
```
### step

```ruby
instance.step(Integer pages) -> Integer
```
