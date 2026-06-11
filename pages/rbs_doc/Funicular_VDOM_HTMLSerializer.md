---
title: class Funicular::VDOM::HTMLSerializer
keywords: Funicular::VDOM::HTMLSerializer
tags: [class]
summary: Funicular::VDOM::HTMLSerializer class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_VDOM_HTMLSerializer.html
folder: rbs_doc
---
## Singleton methods
### serialize

```ruby
Funicular::VDOM::HTMLSerializer.serialize(VNode? vnode) -> String
```
## Instance methods
### escape_attr

```ruby
instance.escape_attr(untyped str) -> String
```
### escape_html

```ruby
instance.escape_html(untyped str) -> String
```
### render

```ruby
instance.render(VNode? vnode) -> String
```
### render_children

```ruby
instance.render_children(Array[child_t] children) -> String
```
### render_component

```ruby
instance.render_component(Component component_vnode) -> String
```
### render_element

```ruby
instance.render_element(Element element) -> String
```
### render_text

```ruby
instance.render_text(Text text) -> String
```
### serialize_props

```ruby
instance.serialize_props(Hash[Symbol, untyped] props) -> String
```
