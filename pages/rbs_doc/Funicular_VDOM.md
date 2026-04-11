---
title: module Funicular::VDOM
keywords: Funicular::VDOM
tags: [module]
summary: Funicular::VDOM module of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_VDOM.html
folder: rbs_doc
---
## Type aliases
### patch_t
```ruby
Array[untyped]
```
### child_t
```ruby
Element | Text | Component | String | Array[Element | Text | Component | String]
```
## Singleton methods
### create_element

```ruby
Funicular::VDOM.create_element(String tag, ?Hash[Symbol, untyped] props, *child_t children) -> Element
```
### create_text

```ruby
Funicular::VDOM.create_text(String content) -> Text
```
### diff

```ruby
Funicular::VDOM.diff(VNode? old_vnode, VNode? new_vnode) -> Array[patch_t]
```
### patch

```ruby
Funicular::VDOM.patch(JS::Object element, Array[patch_t] patches) -> JS::Object
```
### render

```ruby
Funicular::VDOM.render(VNode vnode, JS::Object container) -> void
```
