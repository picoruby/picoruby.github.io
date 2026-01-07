---
title: class Funicular::Component
keywords: Funicular::Component
tags: [class]
summary: Funicular::Component class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Component.html
folder: rbs_doc
---
## Type aliases
### suspense_definition
```ruby
{ loader: untyped, on_resolve: untyped, min_delay: Integer? }
```
## Singleton methods
### new

```ruby
Funicular::Component.new(?Hash[Symbol, untyped] props) -> Component
```
### styles

```ruby
Funicular::Component.styles() { (StyleBuilder) -> void } -> void
```
### styles_definitions

```ruby
Funicular::Component.styles_definitions() -> Hash[Symbol, Hash[Symbol, untyped]]
```
### suspense_definitions

```ruby
Funicular::Component.suspense_definitions() -> Hash[Symbol, suspense_definition]
```
### use_suspense

```ruby
Funicular::Component.use_suspense(Symbol name, untyped loader, ?on_resolve: untyped, ?min_delay: Integer) -> void
```
## Instance methods
### a

```ruby
instance.a(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### add_via

```ruby
instance.add_via(String element_id, String from, String to, ?duration: Integer) ?{ () -> void } -> void
```
### article

```ruby
instance.article(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### aside

```ruby
instance.aside(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### audio

```ruby
instance.audio(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### bind_events

```ruby
instance.bind_events(JS::Object dom_element, VDOM::VNode | VDOM::Text | nil vnode) -> void
```
### br

```ruby
instance.br(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### build_vdom

```ruby
instance.build_vdom() -> (VDOM::VNode | VDOM::Text | nil)
```
### button

```ruby
instance.button(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### canvas

```ruby
instance.canvas(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### component

```ruby
instance.component(Class component_class, ?Hash[Symbol, untyped] props) ?{ () -> untyped } -> VDOM::Component
```
### component_mounted

```ruby
instance.component_mounted() -> void
```
### component_raised

```ruby
instance.component_raised(Exception e) -> void
```
### component_unmounted

```ruby
instance.component_unmounted() -> void
```
### component_updated

```ruby
instance.component_updated() -> void
```
### component_will_mount

```ruby
instance.component_will_mount() -> void
```
### component_will_unmount

```ruby
instance.component_will_unmount() -> void
```
### component_will_update

```ruby
instance.component_will_update() -> void
```
### div

```ruby
instance.div(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### footer

```ruby
instance.footer(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### form

```ruby
instance.form(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### form_for

```ruby
instance.form_for(Symbol model_key, ?Hash[Symbol, untyped] options) { (FormBuilder) -> void } -> VDOM::Element
```
### h1

```ruby
instance.h1(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### h2

```ruby
instance.h2(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### h3

```ruby
instance.h3(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### h4

```ruby
instance.h4(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### h5

```ruby
instance.h5(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### h6

```ruby
instance.h6(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### header

```ruby
instance.header(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### hr

```ruby
instance.hr(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### img

```ruby
instance.img(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### initialize_state

```ruby
instance.initialize_state() -> Hash[Symbol, untyped]
```
### input

```ruby
instance.input(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### label

```ruby
instance.label(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### li

```ruby
instance.li(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### link_to

```ruby
instance.link_to(String path, ?method: Symbol, ?navigate: bool, **untyped options) { -> untyped } -> VDOM::Element
```
### load_single_suspense

```ruby
instance.load_single_suspense(Symbol name, ?suspense_definition? definition) -> void
```
### load_suspense_data

```ruby
instance.load_suspense_data() -> void
```
### method_missing

```ruby
instance.method_missing(Symbol method, *untyped args) -> untyped
```
### mount

```ruby
instance.mount(JS::Object container) -> void
```
### nav

```ruby
instance.nav(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### ol

```ruby
instance.ol(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### option

```ruby
instance.option(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### p

```ruby
instance.p(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### patch

```ruby
instance.patch(Hash[Symbol, untyped] new_state) -> void
```
### reload_suspense

```ruby
instance.reload_suspense(Symbol name) -> void
```
### remove_via

```ruby
instance.remove_via(String element_id, String from, String to, ?duration: Integer) ?{ () -> void } -> void
```
### render

```ruby
instance.render() -> (VDOM::VNode | String | Integer | Float | Array[untyped] | nil)
```
### respond_to_missing?

```ruby
instance.respond_to_missing?(Symbol method, ?bool include_private) -> bool
```
### s

```ruby
instance.s() -> StyleAccessor
```
### section

```ruby
instance.section(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### select

```ruby
instance.select(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### span

```ruby
instance.span(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### state

```ruby
instance.state() -> StateAccessor
```
### suspense

```ruby
instance.suspense(fallback: ^() -> void, ?error: ^(untyped) -> void) { () -> void } -> void
```
### suspense_error

```ruby
instance.suspense_error(Symbol name) -> untyped
```
### suspense_error?

```ruby
instance.suspense_error?(Symbol name) -> bool
```
### suspense_loading?

```ruby
instance.suspense_loading?(*Symbol names) -> bool
```
### table

```ruby
instance.table(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### tbody

```ruby
instance.tbody(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### td

```ruby
instance.td(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### textarea

```ruby
instance.textarea(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### th

```ruby
instance.th(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### thead

```ruby
instance.thead(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### tr

```ruby
instance.tr(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### ul

```ruby
instance.ul(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
### unmount

```ruby
instance.unmount() -> void
```
### video

```ruby
instance.video(?Hash[Symbol, untyped] props) ?{ -> untyped } -> VDOM::Element
```
## Attr accessors
### props (accessor)
```ruby
instance.props -> Hash[Symbol, untyped]
```
### vdom (accessor)
```ruby
instance.vdom -> VDOM::VNode | VDOM::Text | nil
```
### dom_element (accessor)
```ruby
instance.dom_element -> JS::Object
```
### mounted (accessor)
```ruby
instance.mounted -> bool
```
### refs (reader)
```ruby
instance.refs -> Hash[Symbol, JS::Object]
```
