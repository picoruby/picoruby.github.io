---
title: module Marshal
keywords: Marshal
tags: [module]
summary: Marshal module of PicoRuby
sidebar: picoruby_sidebar
permalink: Marshal.html
folder: rbs_doc
---
## Type aliases
### marshallable
```ruby
nil | bool | Integer | String | Symbol | Array[marshallable] | Hash[marshallable, marshallable]
```
## Singleton methods
### dump

```ruby
Marshal.dump(marshallable obj) -> String
```
### load

```ruby
Marshal.load(String data) -> marshallable
```
