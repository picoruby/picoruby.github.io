---
keywords: documentation
layout: page
tags: [Rails, Funicular]
title: "Funicular on Rails: Debugging"
sidebar: picoruby_sidebar
permalink: funicular-on-rails-debugging
folder: funicular
---

Funicular gives you two complementary debugging tools: an **in-page component highlighter** for seeing which component renders what, and a **Chrome DevTools extension** with a Ruby REPL, breakpoints, and a Funicular component inspector.
Both rely on the development (`debug`) runtime build, which is what `picoruby_include_tag` serves in development by default --- so in a standard Rails setup they are ready to use.

This page comes early in the series on purpose: with these tools in place, you can poke at every feature in the following chapters as you read.

## In-page component highlighter

In development, Funicular tags each rendered component with a `data-component` attribute holding its class name. The highlighter draws an outline around those elements so you can see the component boundaries directly on the page.

It ships as `funicular_debug.js` / `funicular_debug.css`, installed by `bin/rails funicular:install` (or `funicular:install:debug_assets`). Add them to your layout in development only:

```erb
<% if Rails.env.development? %>
  <%= javascript_include_tag "funicular_debug", "data-turbo-track": "reload" %>
  <%= stylesheet_link_tag "funicular_debug", "data-turbo-track": "reload" %>
<% end %>
```

Then turn it on by choosing a color in your initializer:

```ruby
# app/funicular/initializer.rb
Funicular.debug_color = "pink"  # "green", "yellow", "pink", "cyan", or nil to disable
```

The highlighter:

- outlines each component in the chosen color (using `outline`, so it never shifts your layout),
- shows a small triangle indicator in the bottom-right corner of each component,
- displays the component's class name and `id` (when present) on hover.

Set `Funicular.debug_color = nil` to disable it. The value is exported to the browser as `window.FUNICULAR_DEBUG_COLOR`, which the highlighter script reads.

## Chrome DevTools extension

The **PicoRuby Debugger** is a Chrome DevTools extension that adds a dedicated panel for PicoRuby.wasm apps:

- **REPL** --- evaluate Ruby in the context of the running app
- **`binding.irb` breakpoints** --- pause execution anywhere in your Ruby
- **Step debugger** --- step into / step over / continue
- **Local variables** --- inspect locals at the current scope
- **Call stack** --- navigate the Ruby call stack while paused
- **Component inspector** --- browse the Funicular component tree and inspect each
  component's state and instance variables

### Requirements

- Chrome 102 or later
- A PicoRuby.wasm **debug build** loaded on the page

The debugger needs the `mrb_debug_*` API, which exists only in debug builds. The production (`dist`) runtime does not include it; when a release build is detected, the panel shows an error and the REPL stays inactive.

In a Rails app this is already handled: in development, `picoruby_include_tag` serves `/picoruby/debug/init.iife.js`. If you self-host only the `dist` build or point `production_source` at the CDN's release build, switch back to the debug build while debugging. Outside Rails, load the `@debug` dist-tag directly:

```html
<script src="https://cdn.jsdelivr.net/npm/@picoruby/wasm-wasi@debug/dist/init.iife.js"></script>
```

### Installing the extension

Until it is published to the Chrome Web Store, load it unpacked from the PicoRuby repository:

1. Clone `picoruby/picoruby` (the extension lives in
   `mrbgems/picoruby-wasm/debugger/`).
2. Open `chrome://extensions`.
3. Enable **Developer mode** (top-right toggle).
4. Click **Load unpacked** and select the `debugger/` directory.

A **PicoRuby** tab then appears in DevTools whenever a page with a debug-build runtime is open.

### Using the REPL and breakpoints

The REPL evaluates against the live PicoRuby instance:

```
irb:001> 1 + 1
=> 2
```

Add `binding.irb` anywhere in your Funicular code to pause there:

```ruby
def handle_submit(data)
  binding.irb   # execution pauses here
  Comment.create(post_id: state.post["id"], body: data["body"]) { |c, e| ... }
end
```

When execution reaches it, the prompt becomes `irb(debug):NNN>` and these commands (plus keyboard shortcuts) are available:

| Command    | Shorthand | Key | Description                 |
|------------|-----------|-----|-----------------------------|
| `continue` | `c`       | F8  | Resume execution            |
| `step`     | `s`       | F11 | Step into the next expression |
| `next`     | `n`       | F10 | Step over to the next line  |
| `help`     | `h`       |     | Show the command list       |

### Component inspector

When Funicular runs in debug mode (the case under the development debug build), a **Components** panel appears next to the REPL showing the live component tree.
Click any component to inspect its `@state`, `@props`, child components, and event listeners --- useful for confirming that `patch` produced the state you expect.

## In the demo

[funicular-demo](https://github.com/hasumikin/funicular-demo) runs the debug build in development, so you can open the PicoRuby DevTools panel against it, drop a `binding.irb` into any component under
[`app/funicular/components/`](https://github.com/hasumikin/funicular-demo/tree/master/app/funicular/components),
and watch its state in the component inspector.
