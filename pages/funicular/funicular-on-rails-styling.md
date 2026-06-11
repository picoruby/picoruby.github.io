---
keywords: documentation
layout: page
tags: [Rails, Funicular]
title: "Funicular on Rails: Styling & Advanced"
sidebar: picoruby_sidebar
permalink: funicular-on-rails-styling
folder: funicular
---

This page collects the rest of the toolkit: a **CSS-in-Ruby** DSL for scoped, semantic styles, plus three advanced features --- **error boundaries**, **enter/leave transitions**, and **JavaScript-library integration**. None of them are required to ship a Funicular app, but each one solves a recurring real-world need.

## Styling: the `styles` DSL

Define named styles in a `styles` block at the top of a component, then reference them through the `s` helper in `render`:

```ruby
class LoginComponent < Funicular::Component
  styles do
    container "min-h-screen flex items-center justify-center bg-gray-100"
    card      "bg-white p-8 rounded-lg shadow-xl w-96"
    title     "text-3xl font-bold text-center mb-8 text-gray-800"
  end

  def render
    div(class: s.container) do
      div(class: s.card) do
        h1(class: s.title) { "Welcome" }
      end
    end
  end
end
```

The class strings are just CSS class names, so the DSL pairs naturally with Tailwind. The benefit is **scoping and semantics**: `s.card` reads better than a long utility string repeated across render methods, and styles change in one place.

### Conditional, variant, and combined styles

```ruby
styles do
  # base + conditional: s.channel_item(true) appends the active classes
  channel_item base: "p-4 hover:bg-gray-700 cursor-pointer", active: "bg-gray-700 border-l-4 border-blue-500"

  # variants: pick one by name
  button base: "px-4 py-2 rounded font-semibold",
         variants: { primary: "bg-blue-600 text-white", danger: "bg-red-600 text-white" }
end

def render
  div(class: s.channel_item(state.current_id == 1)) { "General" }
  button(class: s.button(:primary)) { "Submit" }
  button(class: s.button(props[:variant] || :primary)) { props[:label] }
end
```

Combine styles (and raw strings) with the `|` operator, which drops `nil`s --- ideal for conditional classes:

```ruby
div(class: s.card | (state.highlighted ? "ring-2 ring-blue-500" : nil)) { ... }
```

Share styles across components by including a module that calls `styles` in its `included` hook. Prefer semantic names, grouped by purpose, over generic ones.

## Error boundaries

`Funicular::ErrorBoundary` catches errors from its child subtree and renders a fallback instead of crashing the whole app --- like React error boundaries. Place boundaries around **independent features**, not the entire app, so one failure does not take down unrelated UI:

```ruby
component(Funicular::ErrorBoundary,
  fallback: ->(error) {
    div(class: "p-4 bg-red-50 border border-red-300") do
      h3 { "Something went wrong" }
      p  { error.message }
      button(onclick: -> { Funicular.router.navigate('/') }) { "Go Home" }
    end
  },
  on_error: ->(error, info) {
    puts "[ERROR] #{info[:component_class]}: #{error.message}"
    # report to your error tracker; info has { component_class:, props: }
  }
) do
  component(RiskyComponent)
end
```

`fallback` receives the error; `on_error` receives `(error, info)` for logging or reporting. With no `fallback`, a default styled error message is shown. Give users a recovery action (retry, go home) in the fallback.

## Enter / leave transitions

`add_via` and `remove_via` animate elements in and out using native CSS transitions. Give the element an `id`, render it in its "from" classes, and call the helper:

```ruby
class MessageComponent < Funicular::Component
  def component_mounted
    add_via("message-#{props[:message]['id']}",
            "opacity-0 scale-95", "opacity-100 scale-100", duration: 300)
  end

  def render
    div(id: "message-#{props[:message]['id']}", class: "opacity-0 scale-95 transition-all") do
      p { props[:message]["content"] }
    end
  end
end
```

`remove_via` plays the exit transition, then runs its block --- update state there so the element is removed only after the animation finishes:

```ruby
def handle_delete(id)
  remove_via("message-#{id}", "opacity-100 max-h-screen", "opacity-0 max-h-0", duration: 500) do
    patch(messages: state.messages.reject { |m| m["id"] == id })
  end
end
```

The two arguments are space-separated class strings: the starting state and the ending state. Define the `transition` properties in your CSS (or via the `styles` DSL); the helpers only toggle classes.

## Integrating JavaScript libraries

For charts, maps, or any existing JS library, use the **delegation model**: Ruby owns the component structure and data; JavaScript owns the DOM inside a container you hand it via a `ref`. Set up in `component_mounted`, tear down in `component_unmounted`:

```ruby
class ChartComponent < Funicular::Component
  def component_mounted
    @chart = JS.global.Chart.new(refs[:canvas], { type: 'bar', data: chart_data })
  end

  def component_unmounted
    @chart&.destroy
  end

  def render
    div(style: "height: 400px") { canvas(ref: :canvas) }
  end
end
```

Always target the library at a `ref`, not a class/id selector (which can conflict), keep business logic in Ruby, and re-sync the library from `component_updated(prev_state)` only when the relevant data changed.

### File uploads

`Funicular::FileUpload` wraps the file-input plumbing:

```ruby
def component_mounted
  Funicular::FileUpload.mount
end

def handle_file_select(event)
  file = event.target[:files][0]
  return unless file
  Funicular::FileUpload.upload(file) do |result|
    result[:error] ? patch(error: result[:error]) : patch(image_url: result[:url])
  end
end
```

For multipart submissions that mix a file with form fields (e.g. an avatar plus a display name), `Funicular::FileUpload` also supports FormData uploads --- see the demo's settings component.

## In the demo

[funicular-demo](https://github.com/hasumikin/funicular-demo):

- Every component uses the `styles` DSL with Tailwind classes.
- [`chat_components/message_component.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/components/chat_components/message_component.rb) animates messages in and out with `add_via` / `remove_via`.
- [`settings_component.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/components/settings_component.rb) uploads an avatar with `Funicular::FileUpload` (including a FormData submission).
