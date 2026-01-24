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
### appendChild

```ruby
instance.appendChild(JS::Object child) -> JS::Object
```
### children

```ruby
instance.children() -> JS::Object
```
### classList

```ruby
instance.classList() -> JS::Object
```
### className

```ruby
instance.className() -> JS::Object
```
### createElement

```ruby
instance.createElement(String tag_name) -> JS::Object
```
### createTextNode

```ruby
instance.createTextNode(String text) -> JS::Object
```
### fetch

```ruby
instance.fetch(String url) { (::Object response) -> void } -> void
```
### innerHTML

```ruby
instance.innerHTML() -> JS::Object
```
### innerHTML=

```ruby
instance.innerHTML=(String html) -> String
```
### parentElement

```ruby
instance.parentElement() -> JS::Object
```
### querySelector

```ruby
instance.querySelector(String selector) -> JS::Object
```
### removeAttribute

```ruby
instance.removeAttribute(String name) -> void
```
### removeChild

```ruby
instance.removeChild(JS::Object child) -> JS::Object
```
### replaceChild

```ruby
instance.replaceChild(JS::Object new_child, JS::Object old_child) -> JS::Object
```
### setAttribute

```ruby
instance.setAttribute(String name, String value) -> void
```
### style

```ruby
instance.style() -> JS::Object
```
### style=

```ruby
instance.style=(String style) -> String
```
### tagName

```ruby
instance.tagName() -> JS::Object
```
### textContent

```ruby
instance.textContent() -> JS::Object
```
### textContent=

```ruby
instance.textContent=(String text) -> String
```
### to_binary

```ruby
instance.to_binary() -> String
```
### to_poro

```ruby
instance.to_poro() -> poro_t
```
