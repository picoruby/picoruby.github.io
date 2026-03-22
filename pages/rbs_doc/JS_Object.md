---
title: class JS::Object
keywords: JS::Object
tags: [class]
summary: JS::Object class of PicoRuby
sidebar: picoruby_sidebar
permalink: JS_Object.html
folder: rbs_doc
---
## Singleton methods
### register_callback

```ruby
JS::Object.register_callback(String name) { (*untyped args) -> untyped } -> Integer
```
### removeEventListener

```ruby
JS::Object.removeEventListener(Integer callback_id) -> bool
```
## Instance methods
### <

```ruby
instance.<(Integer | JS::Object other) -> bool
```
### <=

```ruby
instance.<=(Integer | JS::Object other) -> bool
```
### <=>

```ruby
instance.<=>(Integer | JS::Object other) -> Integer?
```
### ==

```ruby
instance.==(untyped other) -> bool
```
### >

```ruby
instance.>(Integer | JS::Object other) -> bool
```
### >=

```ruby
instance.>=(Integer | JS::Object other) -> bool
```
### URL

```ruby
instance.URL() -> JS::Object
```
### []

```ruby
instance.[](String | Symbol | Integer name) -> (JS::Object | nil)
```
### []=

```ruby
instance.[]=(String | Symbol name, untyped value) -> untyped
```
### _js_remove_event_listener_wrapper

```ruby
instance._js_remove_event_listener_wrapper(Integer callback_id) -> bool
```
### add

```ruby
instance.add(*String class_names) -> bool
```
### addEventListener

```ruby
instance.addEventListener(String event_type) { (JS::Object event) -> void } -> Integer
```
### appendChild

```ruby
instance.appendChild(JS::Object child) -> bool
```
### await

```ruby
instance.await() -> JS::Object?
```
### body

```ruby
instance.body() -> JS::Object
```
### children

```ruby
instance.children() -> JS::Object
```
### classList

```ruby
instance.classList() -> JS::Object
```
### clearTimeout

```ruby
instance.clearTimeout(Integer callback_id) -> bool
```
### content

```ruby
instance.content() -> JS::Object
```
### createElement

```ruby
instance.createElement(String tag_name) -> JS::Object
```
### createObjectURL

```ruby
instance.createObjectURL(JS::Object blob) -> JS::Object
```
### createTextNode

```ruby
instance.createTextNode(String text) -> JS::Object
```
### create_array

```ruby
instance.create_array() -> JS::Object
```
### create_object

```ruby
instance.create_object() -> JS::Object
```
### fetch

```ruby
instance.fetch(String url, ?Hash[Symbol, untyped]? options) { (JS::Object response) -> void } -> void
```
### getAttribute

```ruby
instance.getAttribute(String name) -> JS::Object?
```
### getElementById

```ruby
instance.getElementById(String id) -> JS::Object?
```
### getItem

```ruby
instance.getItem(String key) -> JS::Object?
```
### highlightAll

```ruby
instance.highlightAll() -> void
```
### history

```ruby
instance.history() -> JS::Object
```
### hostname

```ruby
instance.hostname() -> JS::Object
```
### href

```ruby
instance.href() -> JS::Object
```
### innerHTML=

```ruby
instance.innerHTML=(String html) -> String
```
### insertBefore

```ruby
instance.insertBefore(JS::Object new_child, ?JS::Object? ref_child) -> bool
```
### item

```ruby
instance.item(String | Integer num) -> JS::Object?
```
### length

```ruby
instance.length() -> JS::Object
```
### location

```ruby
instance.location() -> JS::Object
```
### parentElement

```ruby
instance.parentElement() -> JS::Object?
```
### pathname

```ruby
instance.pathname() -> JS::Object
```
### preventDefault

```ruby
instance.preventDefault() -> nil
```
### push

```ruby
instance.push(JS::Object item) -> JS::Object
```
### pushState

```ruby
instance.pushState(untyped data, String title, String url) -> void
```
### querySelector

```ruby
instance.querySelector(String selector) -> JS::Object?
```
### querySelectorAll

```ruby
instance.querySelectorAll(String selector) -> JS::Object
```
### refcount

```ruby
instance.refcount() -> Integer
```
### remove

```ruby
instance.remove(*String class_names) -> bool
```
### removeAttribute

```ruby
instance.removeAttribute(String name) -> bool
```
### removeChild

```ruby
instance.removeChild(JS::Object child) -> bool
```
### removeItem

```ruby
instance.removeItem(String key) -> void
```
### replaceChild

```ruby
instance.replaceChild(JS::Object new_child, JS::Object old_child) -> bool
```
### replaceState

```ruby
instance.replaceState(untyped data, String title, String url) -> void
```
### setAttribute

```ruby
instance.setAttribute(String name, String value) -> bool
```
### setItem

```ruby
instance.setItem(String key, String value) -> void
```
### setTimeout

```ruby
instance.setTimeout(Integer delay_ms) { () -> void } -> Integer
```
### status

```ruby
instance.status() -> JS::Object
```
### stopPropagation

```ruby
instance.stopPropagation() -> nil
```
### style

```ruby
instance.style() -> JS::Object
```
### tagName

```ruby
instance.tagName() -> JS::Object
```
### target

```ruby
instance.target() -> JS::Object
```
### textContent=

```ruby
instance.textContent=(String text) -> String
```
### then

```ruby
instance.then() { (JS::Object? result) -> void } -> JS::Object?
```
### to_a

```ruby
instance.to_a() -> Array[JS::Object]
```
### to_binary

```ruby
instance.to_binary() -> String
```
### to_f

```ruby
instance.to_f() -> Float
```
### to_i

```ruby
instance.to_i() -> Integer
```
### to_s

```ruby
instance.to_s() -> String
```
### type

```ruby
instance.type() -> Symbol
```
