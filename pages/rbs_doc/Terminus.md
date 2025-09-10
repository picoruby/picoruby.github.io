---
title: module Terminus
keywords: Terminus
tags: [module]
summary: Terminus module of PicoRuby
sidebar: picoruby_sidebar
permalink: Terminus.html
folder: rbs_doc
---
## Type aliases
### terminus_t
```ruby
[Integer, Integer,     Array[Integer], Array[Array[Integer]]]
```
## Singleton methods
### _12x24

```ruby
Terminus._12x24(String text) -> terminus_t
```
### _16x32

```ruby
Terminus._16x32(String text) -> terminus_t
```
### _6x12

```ruby
Terminus._6x12(String text) -> terminus_t
```
### _8x16

```ruby
Terminus._8x16(String text) -> terminus_t
```
### draw

```ruby
Terminus.draw(Symbol | String fontname, String line, ?Integer scale) { (terminus_t) -> void } -> void
Terminus.draw(Symbol | String fontname, String line, ?Integer scale) -> terminus_t
```
