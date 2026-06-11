---
keywords: documentation
layout: page
tags: [Rails, Funicular]
title: "Funicular on Rails: Components & State"
sidebar: picoruby_sidebar
permalink: funicular-on-rails-components
folder: funicular
---

Components are the building blocks of a Funicular UI. If you have used React, the model will feel familiar: a component is a class with a `render` method, some local **state**, and **props** passed in from its parent. This page walks through building components from scratch, then serves as a reference for the component API.

Everything here lives under `app/funicular/components/` and is compiled into `app.mrb` --- see [Setup](/funicular-on-rails) if you have not wired that up yet.

## Tutorial: a counter, then a list

### A component with state

A component inherits from `Funicular::Component`, defines its initial state in `initialize_state`, and describes its UI in `render` using a Ruby DSL where HTML tags are methods:

```ruby
# app/funicular/components/counter_component.rb
class CounterComponent < Funicular::Component
  def initialize_state
    { count: 0 }
  end

  def increment
    patch(count: state.count + 1)
  end

  def render
    div do
      p { "Current count: #{state.count}" }
      button(onclick: :increment) { "Increment" }
    end
  end
end
```

- `state` is read-only. Read values with dot notation: `state.count`.
- `patch(...)` does a **shallow merge** into state and triggers a re-render. Assigning to state directly (`state.count = 5`) raises an error --- always go through `patch`.
- An event handler is wired by passing a **Symbol** naming a method (`onclick: :increment`). The method receives the DOM event object.

### Props and child-to-parent callbacks

Split UI into smaller components and pass data down as **props**. Props are immutable inside the child. To let a child talk back to its parent, pass a callback as a prop:

```ruby
# app/funicular/components/todo_item_component.rb
class TodoItemComponent < Funicular::Component
  def handle_delete
    props[:on_delete].call(props[:todo][:id])
  end

  def render
    li do
      span { props[:todo][:text] }
      button(onclick: :handle_delete) { "Delete" }
    end
  end
end

# app/funicular/components/todo_list_component.rb
class TodoListComponent < Funicular::Component
  def initialize_state
    { todos: [{ id: 1, text: "Learn Funicular" }] }
  end

  def handle_delete(id)
    patch(todos: state.todos.reject { |t| t[:id] == id })
  end

  def render
    ul do
      state.todos.each do |todo|
        component(TodoItemComponent, todo: todo, on_delete: method(:handle_delete))
      end
    end
  end
end
```

Embed a child with `component(ChildClass, key: value, ...)`. Here the parent owns the list state and passes `method(:handle_delete)` down; the child invokes it with `props[:on_delete].call(...)`. This "state lives in the parent, children report up" pattern is how siblings coordinate too: lift the shared state to the nearest common parent.

## Reference

### Event handlers

Handlers accept a **Symbol**, a **Method**, or a **Proc/Lambda**:

```ruby
button(onclick: :handle_click)             { "Symbol (most common)" }
component(Child, on_x: method(:handle_x))  # Method: passes a bound callback down
button(onclick: -> { patch(open: true) })  { "Proc: inline logic" }
button(onclick: ->(e) { p e.target[:value] }) { "Proc with event" }
```

With a Symbol or Method, the event object is passed automatically. With a Proc, receive it only if you declare the parameter. Use a Symbol for ordinary handlers, `method(:name)` when handing a callback to a child, and a lambda for short inline logic or to capture a value at render time.

### State

- Define initial state in `initialize_state` (returns a Hash).
- Read with `state.key`.
- Update with `patch(key: value)` --- shallow merge, then re-render.
- For nested state, build the new structure yourself with `merge`:

```ruby
patch(user: state.user.merge(profile: state.user[:profile].merge(name: new_name)))
```

Prefer flat, normalized, descriptively named state over deep nesting.

### Lifecycle hooks

```
new(props) -> initialize_state -> render -> component_mounted
   -> [state changes -> render] ...
   -> component_unmounted
```

- `component_mounted` runs after the component is inserted into the DOM --- the place to start subscriptions, load data, or focus an element.
- `component_unmounted` runs just before removal --- the place to clean up (unsubscribe, clear timers). Always pair setup in `mounted` with teardown in `unmounted`.

### Refs

Attach `ref: :name` to an element and reach the real DOM node via `refs[:name]` once mounted --- for focus management, text selection, or handing the node to a JavaScript library:

```ruby
class SearchBoxComponent < Funicular::Component
  def component_mounted
    refs[:search]&.focus
  end

  def render
    input(ref: :search, type: "text", placeholder: "Search...")
  end
end
```

See [Styling & Advanced](/funicular-on-rails-styling) for using refs to drive JS
libraries such as Chart.js.

## In the demo

[funicular-demo](https://github.com/hasumikin/funicular-demo) shows these
patterns at scale:

- [`chat_component.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/components/chat_component.rb)
  composes child components and lifts shared chat state.
- [`chat_components/`](https://github.com/hasumikin/funicular-demo/tree/master/app/funicular/components/chat_components)
  holds the child components (message list, input, single message) that report
  back to the parent via callbacks.
- [`blog_post_component.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/components/blog_post_component.rb)
  uses `component_mounted` to load data when it was not server-rendered.
