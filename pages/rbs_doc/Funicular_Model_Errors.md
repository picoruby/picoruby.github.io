---
title: class Funicular::Model::Errors
keywords: Funicular::Model::Errors
tags: [class]
summary: Funicular::Model::Errors class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Model_Errors.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::Model::Errors.new() -> void
```
## Instance methods
### []

```ruby
instance.[](Symbol | String attribute) -> Array[String]
```
### add

```ruby
instance.add(Symbol | String attribute, String message) -> String
```
### added?

```ruby
instance.added?(Symbol | String attribute) -> bool
```
### any?

```ruby
instance.any?() -> bool
```
### clear

```ruby
instance.clear() -> void
```
### empty?

```ruby
instance.empty?() -> bool
```
### full_messages

```ruby
instance.full_messages() -> Array[String]
```
### humanize

```ruby
instance.humanize(Symbol | String attribute) -> String
```
### messages

```ruby
instance.messages() -> Hash[Symbol, Array[String]]
```
