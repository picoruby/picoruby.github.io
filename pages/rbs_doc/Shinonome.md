---
title: module Shinonome
keywords: Shinonome
tags: [module]
summary: Shinonome module of PicoRuby
sidebar: picoruby_sidebar
permalink: Shinonome.html
folder: rbs_doc
---
## Type aliases
### shinonome_t
```ruby
[Integer, Integer,     Array[Integer], Array[Array[Integer]]]
```
## Singleton methods
### draw

```ruby
Shinonome.draw(Symbol | String name, String line, Integer scale) { (shinonome_t) -> void } -> void
Shinonome.draw(Symbol | String name, String line, Integer scale) -> shinonome_t
```
### go12

```ruby
Shinonome.go12(String text, ?Integer scale) -> shinonome_t
```
### go16

```ruby
Shinonome.go16(String text, ?Integer scale) -> shinonome_t
```
### maru12

```ruby
Shinonome.maru12(String text, ?Integer scale) -> shinonome_t
```
### min12

```ruby
Shinonome.min12(String text, ?Integer scale) -> shinonome_t
```
### min16

```ruby
Shinonome.min16(String text, ?Integer scale) -> shinonome_t
```
### test12

```ruby
Shinonome.test12(String text) -> nil
```
### test16

```ruby
Shinonome.test16(String text) -> nil
```
