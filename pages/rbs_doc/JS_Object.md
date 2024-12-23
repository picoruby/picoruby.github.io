---
title: class JS::Object
keywords: JS::Object
tags: [class]
summary: JS::Object class of PicoRuby
sidebar: picoruby_sidebar
permalink: JS_Object.html
folder: rbs_doc
---
## Type aliases
### poro_t
```ruby
JS::Object | String | Symbol | Array[JS::Object] | Integer | Float | nil | bool
```
## Instance methods
### []

```ruby
instance.[](Symbol name) -> JS::Object
```
### addEventListener

```ruby
instance.addEventListener(String event_type) { (String event_json) -> void } -> Integer
```
### fetch

```ruby
instance.fetch(String url) { (::Object response) -> void } -> void
```
### innerHTML=

```ruby
instance.innerHTML=(String html) -> String
```
### querySelector

```ruby
instance.querySelector(String selector) -> JS::Object
```
### text=

```ruby
instance.text=(String text) -> String
```
### to_binary

```ruby
instance.to_binary() -> ::Object
```
### to_poro

```ruby
instance.to_poro() -> poro_t
```
