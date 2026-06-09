---
keywords: documentation
layout: page
tags: [Rails, Funicular]
title: "Funicular on Rails: SSR & Hydration"
sidebar: picoruby_sidebar
permalink: funicular-on-rails-ssr
folder: funicular
---

Funicular can render your components to HTML on the Rails server and then **hydrate** that markup in the browser. The same component classes run on both sides --- on the server under CRuby, in the browser under PicoRuby.wasm --- so you write each component once. The payoff is a fast, data-filled, SEO-friendly first paint for public pages, with the full SPA experience taking over after load.

This is the one feature where Funicular code runs in your Rails process, so it ties together [Setup](/funicular-on-rails), [Components](/funicular-on-rails-components), and [Data Fetching](/funicular-on-rails-data).

## How it works

1. The `mrblib/` framework is loaded into Rails. It is plain Ruby; the methods that touch the browser are never called server-side because `Funicular.server?` is true there.
2. `Funicular::SSR.render` resolves a request path to a component using the routes from `app/funicular/initializer.rb`, builds its VDOM, and serializes it to HTML.
3. The server injects your data as the component's `state`, and embeds the same state in the page as `window.__FUNICULAR_STATE__`.
4. In the browser, `Funicular.start` detects that state and **hydrates**: it rebuilds the VDOM from the same state and attaches event handlers and refs to the existing DOM nodes instead of rebuilding them. From there it is a normal SPA.

Event handlers are not serialized --- they are Procs re-bound during hydration.

## Tutorial: an isomorphic page

### The component

Render from `state`, and only fetch on mount as a **client-only fallback** for when the server did not inject data:

```ruby
class BlogIndexComponent < Funicular::Component
  def initialize_state
    { posts: [] }
  end

  def component_mounted
    return unless state.posts.empty?       # server already provided them?
    Post.all { |posts, _| patch(posts: posts.map { |p| post_to_h(p) }) }
  end

  def render
    ul do
      state.posts.each do |post|
        li(key: post["id"]) { post["title"] }   # note: string keys
      end
    end
  end

  def post_to_h(post)
    { "id" => post.id, "title" => post.title }
  end
end
```

### The controller and view

In the controller, call `Funicular::SSR.render` and pass the data to inject:

```ruby
class HomeController < ApplicationController
  def index
    @ssr = Funicular::SSR.render(path: "/blog", state: { posts: blog_posts })
  end

  private

  def blog_posts
    Post.published.map { |p| { "id" => p.id, "title" => p.title } }
  end
end
```

In the view, drop the rendered HTML into the `#app` container and embed the state. When `@ssr` is absent, the container is empty and the client renders from scratch (plain client-side rendering):

```erb
<%= funicular_app_container(@ssr ? @ssr[:html] : "") %>
<% if @ssr %>
  <%= funicular_state_tag(@ssr[:state]) %>
<% end %>

<script type="application/x-mrb" src="<%= asset_path('app.mrb') %>"></script>
```

`Funicular::SSR.render` returns `{ html:, state:, component: }`. When no route matches the path, `html` is `""` and the page falls back to client rendering. The client needs **no extra code** --- `Funicular.start` hydrates automatically when `window.__FUNICULAR_STATE__` is present.

## Keep the data shape identical on both sides

Server and client must build the same VDOM, so the data `render` reads must look the same in both places:

- **Use string keys for injected nested data.** Top-level state keys are symbolized (so `state.posts` works), but nested hashes are read with string keys (`post["id"]`). The client parses injected state via `JSON.parse`, which always yields string keys --- so build string-keyed hashes on the server (`{ "id" => p.id }`), not symbol-keyed ones.
- **Normalize client-fetched models to that same shape.** On the client-only fetch path, convert `Model` instances into the same string-keyed hashes the server injects (the `post_to_h` helper above).
- **Render deterministically.** Avoid `Time.now`, randomness, or anything that differs between server and client inside `render`.

### Login-gated and interactive markup

Because the controller knows who is signed in, inject that into state and branch on it --- the same markup then renders on both sides with no mismatch. `form_for` and the rest of the DSL render on the server and hydrate into working forms:

```ruby
def render
  if state.current_user
    form_for(:comment, on_submit: :handle_submit) do |f|
      f.textarea :body
      f.submit "Post comment"
    end
  else
    link_to "/login", navigate: true do
      span { "Log in to comment" }
    end
  end
end
```

## SEO

The SSR markup lives inside `#app`, so page-level SEO tags are plain Rails: set `<title>` and `<meta name="description">` from the controller (for example, the post title on a `/blog/:id` page). The server-rendered, data-filled `#app` content is what search engines index.

## Hydration mismatch handling

Before hydrating, Funicular checks that the root tag of the freshly built VDOM matches the server-rendered element. If they disagree (nondeterministic render, stale state), it logs a warning in development, then recovers by rendering a fresh DOM subtree and swapping it in --- the page stays usable; only first-paint reuse is lost for that subtree.

## Current limitations (v1)

- A single state payload is serialized, for the **top routed component**. Child components derive data from props or fetch on mount.
- Server-side data is injected as plain hashes; the `Model` layer is not used to fetch on the server.
- Suspense renders its resolved/empty branch on the server (no timers).
- The mismatch check compares only each component's root element tag; the full-render fallback covers the common root-level case.

## In the demo

[funicular-demo](https://github.com/hasumikin/funicular-demo) server-renders its
public blog:

- `HomeController` calls `Funicular::SSR.render` for `/blog` and `/blog/:id`.
- [`blog_index_component.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/components/blog_index_component.rb) and [`blog_post_component.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/components/blog_post_component.rb) render from injected state and fall back to fetching on mount, including the login-gated comment form.
