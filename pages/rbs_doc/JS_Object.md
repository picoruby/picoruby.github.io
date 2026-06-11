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
### _close_event_queue

```ruby
JS::Object._close_event_queue(Integer callback_id) -> (Task::Queue | nil)
```
### _spawn_event_consumer

```ruby
JS::Object._spawn_event_consumer(Integer callback_id, Proc block) -> Integer
```
### register_callback

```ruby
JS::Object.register_callback(String name) { (*untyped args) -> untyped } -> Integer
```
### removeEventListener

```ruby
JS::Object.removeEventListener(Integer callback_id) -> bool
```
## Instance methods
### ==

```ruby
instance.==(untyped other) -> bool
```
### URL

```ruby
instance.URL() -> JS::Object
```
### []

```ruby
instance.[](String | Symbol | Integer name) -> (String | Integer | Float | bool | JS::Object | nil)
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
instance.addEventListener(String event_type) { (JS::Event event) -> void } -> Integer
```
### body

```ruby
instance.body() -> JS::Element
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
instance.content() -> String
```
### createObjectURL

```ruby
instance.createObjectURL(JS::Object blob) -> String
```
### create_array

```ruby
instance.create_array() -> JS::Array
```
### create_object

```ruby
instance.create_object() -> JS::Object
```
### fetch

```ruby
instance.fetch(String url, ?Hash[Symbol, untyped]? options) { (JS::Response response) -> void } -> void
```
### getAttribute

```ruby
instance.getAttribute(String name) -> String?
```
### getItem

```ruby
instance.getItem(String key) -> String?
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
instance.hostname() -> String
```
### href

```ruby
instance.href() -> String
```
### innerHTML=

```ruby
instance.innerHTML=(String html) -> String
```
### inspect

```ruby
instance.inspect() -> String
```
### item

```ruby
instance.item(String | Integer num) -> JS::Object?
```
### length

```ruby
instance.length() -> Integer
```
### location

```ruby
instance.location() -> JS::Object
```
### parentElement

```ruby
instance.parentElement() -> JS::Element?
```
### parentNode

```ruby
instance.parentNode() -> JS::Element?
```
### pathname

```ruby
instance.pathname() -> String
```
### push

```ruby
instance.push(untyped item) -> Integer
```
### pushState

```ruby
instance.pushState(untyped data, String title, String url) -> void
```
### querySelector

```ruby
instance.querySelector(String selector) -> JS::Element?
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
### removeItem

```ruby
instance.removeItem(String key) -> void
```
### replaceState

```ruby
instance.replaceState(untyped data, String title, String url) -> void
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
instance.status() -> Integer
```
### style

```ruby
instance.style() -> JS::Object
```
### tagName

```ruby
instance.tagName() -> String
```
### target

```ruby
instance.target() -> JS::Element
```
### textContent=

```ruby
instance.textContent=(String text) -> String
```
### to_a

```ruby
instance.to_a() -> ::Array[untyped]
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
### typeof

```ruby
instance.typeof() -> Symbol
```
