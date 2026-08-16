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
### blocked_attribute?

```ruby
Funicular::VDOM.blocked_attribute?(untyped name, untyped value) -> bool
```
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
### event_attribute?

```ruby
Funicular::VDOM.event_attribute?(untyped name) -> bool
```
### patch

```ruby
Funicular::VDOM.patch(JS::Object element, Array[patch_t] patches) -> JS::Object
```
### render

```ruby
Funicular::VDOM.render(VNode vnode, JS::Element container) -> void
```
### unsafe_url?

```ruby
Funicular::VDOM.unsafe_url?(untyped name, untyped value) -> bool
```
### valid_attribute_name?

```ruby
Funicular::VDOM.valid_attribute_name?(untyped name) -> bool
```
### valid_tag_name?

```ruby
Funicular::VDOM.valid_tag_name?(untyped name) -> bool
```
