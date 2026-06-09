---
title: class JS::Element
keywords: JS::Element
tags: [class]
summary: JS::Element class of PicoRuby
sidebar: picoruby_sidebar
permalink: JS_Element.html
folder: rbs_doc
---
## Instance methods
### appendChild

```ruby
instance.appendChild(JS::Object child) -> bool
```
### createElement

```ruby
instance.createElement(String tag_name) -> JS::Element
```
### createTextNode

```ruby
instance.createTextNode(String text) -> JS::Object
```
### getElementById

```ruby
instance.getElementById(String id) -> JS::Element?
```
### insertBefore

```ruby
instance.insertBefore(JS::Object new_child, ?JS::Object? ref_child) -> bool
```
### removeAttribute

```ruby
instance.removeAttribute(String name) -> bool
```
### removeChild

```ruby
instance.removeChild(JS::Object child) -> bool
```
### replaceChild

```ruby
instance.replaceChild(JS::Object new_child, JS::Object old_child) -> bool
```
### setAttribute

```ruby
instance.setAttribute(String name, String value) -> bool
```
