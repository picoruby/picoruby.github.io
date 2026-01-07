---
title: class Funicular::FormBuilder
keywords: Funicular::FormBuilder
tags: [class]
summary: Funicular::FormBuilder class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_FormBuilder.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::FormBuilder.new(Component component, Symbol model_key, ?Hash[Symbol, untyped] options) -> FormBuilder
```
## Instance methods
### checkbox

```ruby
instance.checkbox(Symbol field_name, ?Hash[Symbol, untyped] options) -> VDOM::Element
```
### email_field

```ruby
instance.email_field(Symbol field_name, ?Hash[Symbol, untyped] options) -> VDOM::Element
```
### file_field

```ruby
instance.file_field(Symbol field_name, ?Hash[Symbol, untyped] options) -> VDOM::Element
```
### label

```ruby
instance.label(Symbol field_name, ?String? text, ?Hash[Symbol, untyped] options) -> VDOM::Element
```
### number_field

```ruby
instance.number_field(Symbol field_name, ?Hash[Symbol, untyped] options) -> VDOM::Element
```
### password_field

```ruby
instance.password_field(Symbol field_name, ?Hash[Symbol, untyped] options) -> VDOM::Element
```
### select

```ruby
instance.select(Symbol field_name, Array[untyped] choices, ?Hash[Symbol, untyped] options) -> VDOM::Element
```
### submit

```ruby
instance.submit(?String label, ?Hash[Symbol, untyped] options) -> VDOM::Element
```
### text_field

```ruby
instance.text_field(Symbol field_name, ?Hash[Symbol, untyped] options) -> VDOM::Element
```
### textarea

```ruby
instance.textarea(Symbol field_name, ?Hash[Symbol, untyped] options) -> VDOM::Element
```
## Attr accessors
### component (reader)
```ruby
instance.component -> Component
```
### model_key (reader)
```ruby
instance.model_key -> Symbol
```
### options (reader)
```ruby
instance.options -> Hash[Symbol, untyped]
```
