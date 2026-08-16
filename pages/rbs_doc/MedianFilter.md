---
title: class MedianFilter
keywords: MedianFilter
tags: [class]
summary: MedianFilter class of PicoRuby
sidebar: picoruby_sidebar
permalink: MedianFilter.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
MedianFilter.new(?window: Integer) -> void
```
## Instance methods
### reset

```ruby
instance.reset() -> nil
```
### size

```ruby
instance.size() -> Integer
```
### update

```ruby
instance.update(Integer | Float value) -> (Integer | Float)
```
### window=

```ruby
instance.window=(Integer value) -> Integer
```
## Attr accessors
### window (reader)
```ruby
instance.window -> Integer
```
