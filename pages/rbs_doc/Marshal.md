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
### marshalable
```ruby
nil | Proc | bool | Integer | Float | String | Symbol | Array[marshalable] | Hash[marshalable, marshalable]
```
## Singleton methods
### dump

```ruby
Marshal.dump(marshalable obj) -> String
```
### load

```ruby
Marshal.load(String data) -> marshalable
```
