---
title: class Funicular::Component
keywords: Funicular::Component
tags: [class]
summary: Funicular::Component class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Component.html
folder: rbs_doc
---
## Include
[Tags](Tags.html)
## Type aliases
### suspense_definition
```ruby
{ loader: untyped, on_resolve: untyped, min_delay: Integer? }
```
## Singleton methods
### allow_dsl_override

```ruby
Funicular::Component.allow_dsl_override(*Symbol names) -> void
```
### dsl_overrides

```ruby
Funicular::Component.dsl_overrides() -> Array[Symbol]
```
### new

```ruby
Funicular::Component.new(?Hash[Symbol, untyped] props) -> void
```
### method_added

```ruby
Funicular::Component.method_added(Symbol name) -> void
```
### style_accessor_class

```ruby
Funicular::Component.style_accessor_class() -> singleton(StyleAccessor)
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
### validate_dsl_conflicts!

```ruby
Funicular::Component.validate_dsl_conflicts!() -> void
```
## Instance methods
### __view__

```ruby
instance.__view__() -> ViewContext
```
### add_child_from_view

```ruby
instance.add_child_from_view(untyped child) -> void
```
### add_via

```ruby
instance.add_via(String element_id, String from, String to, ?duration: Integer) ?{ () -> void } -> void
```
### bind_events

```ruby
instance.bind_events(JS::Element dom_element, VDOM::VNode | VDOM::Text | nil vnode) -> void
```
### build_button_to

```ruby
instance.build_button_to(ViewContext h, String path, ?method: Symbol, **untyped options) ?{ () -> untyped } -> VDOM::Element
```
### build_form_for

```ruby
instance.build_form_for(ViewContext h, Symbol model_key, ?Hash[Symbol, untyped] options) { (FormBuilder) -> void } -> VDOM::Element
```
### build_link_to

```ruby
instance.build_link_to(ViewContext h, String path, **untyped options) ?{ () -> untyped } -> VDOM::Element
```
### build_vdom

```ruby
instance.build_vdom() -> (VDOM::VNode | VDOM::Text | nil)
```
### button_to

```ruby
instance.button_to(String path, ?method: Symbol, **untyped options) ?{ -> untyped } -> VDOM::Element
```
### cleanup_watches

```ruby
instance.cleanup_watches() -> nil
```
### collect_refs

```ruby
instance.collect_refs(JS::Element dom_element, VDOM::VNode | VDOM::Text | nil vnode, ?Hash[Symbol, JS::Element] refs_map) -> Hash[Symbol, JS::Element]
```
### component

```ruby
instance.component(singleton(Component) component_class, ?Hash[Symbol, untyped] props) ?{ () -> untyped } -> VDOM::Component
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
### evaluate_watch

```ruby
instance.evaluate_watch(Symbol key, untyped block) -> nil
```
### form_for

```ruby
instance.form_for(Symbol model_key, ?Hash[Symbol, untyped] options) { (FormBuilder) -> void } -> VDOM::Element
```
### hydrate

```ruby
instance.hydrate(JS::Element dom_element) -> void
```
### initialize_state

```ruby
instance.initialize_state() -> Hash[Symbol, untyped]
```
### link_to

```ruby
instance.link_to(String path, **untyped options) ?{ -> untyped } -> VDOM::Element
```
### load_single_suspense

```ruby
instance.load_single_suspense(Symbol name, ?suspense_definition? definition) -> void
```
### load_suspense_data

```ruby
instance.load_suspense_data() -> void
```
### mount

```ruby
instance.mount(JS::Element container) -> void
```
### navigation_guard

```ruby
instance.navigation_guard() -> String?
```
### normalize_vnode_for_view

```ruby
instance.normalize_vnode_for_view(untyped value) -> (VDOM::Element | VDOM::Text | VDOM::Component | nil)
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
### render_suspense

```ruby
instance.render_suspense(Symbol name, fallback: untyped, ?error: untyped) { (ResourceAccessor) -> untyped } -> untyped
```
### report_handler_error

```ruby
instance.report_handler_error(String event_name, String handler, StandardError error) -> void
```
### resources

```ruby
instance.resources() -> ResourceAccessor
```
### routes

```ruby
instance.routes() -> untyped
```
### seed_state

```ruby
instance.seed_state(Hash[untyped, untyped]? state_hash) -> self
```
### state

```ruby
instance.state() -> StateAccessor
```
### styles

```ruby
instance.styles() -> StyleAccessor
```
### suspense

```ruby
instance.suspense(Symbol name, fallback: untyped, ?error: untyped) { (ResourceAccessor) -> untyped } -> untyped
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
### unmount

```ruby
instance.unmount() -> void
```
### watch

```ruby
instance.watch(Symbol key) { () -> untyped } -> nil
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
instance.dom_element -> JS::Element
```
### mounted (accessor)
```ruby
instance.mounted -> bool
```
### runtime (accessor)
```ruby
instance.runtime -> Runtime
```
### children (accessor)
```ruby
instance.children -> Array[VDOM::child_t]
```
### current_children (accessor)
```ruby
instance.current_children -> Array[VDOM::child_t]?
```
### refs (reader)
```ruby
instance.refs -> Hash[Symbol, JS::Element]
```
