---
keywords: documentation
layout: page
tags: [Rails, Funicular]
title: "Funicular on Rails: Routing & Navigation"
sidebar: picoruby_sidebar
permalink: funicular-on-rails-routing
folder: funicular
---

Funicular ships a client-side router with a Rails-style DSL: named routes, URL parameters, constraints, and path helpers like `user_path(user)`. Navigation happens through the History API, so the browser back/forward buttons just work and there is no full-page reload. This page builds a small routed app, then documents the routing API.

You define routes in `app/funicular/initializer.rb`, which is compiled and runs in the browser (see [Setup](/funicular-on-rails)).

## Tutorial: routing a small app

Define routes when you start the app. Each route maps a path to a component; `as:` names the route so a path helper is generated:

```ruby
# app/funicular/initializer.rb
Funicular.start(container: 'app') do |router|
  router.get('/posts',     to: PostListComponent, as: 'posts')
  router.get('/posts/:id', to: PostComponent,     as: 'post', constraints: { id: /\d+/ })
  router.set_default('/posts')   # where "/" lands
end
```

A dynamic segment (`:id`) is delivered to the target component as a prop:

```ruby
class PostComponent < Funicular::Component
  def component_mounted
    Post.find(props[:id]) { |post, _err| patch(post: post) }
  end

  def render
    div { h1 { state.post ? state.post.title : "Loading #{props[:id]}..." } }
  end
end
```

Link between routes with `link_to ..., navigate: true`. Include `Funicular::RouteHelpers` to use the generated path helpers:

```ruby
class PostListComponent < Funicular::Component
  include Funicular::RouteHelpers

  def render
    ul do
      state.posts.each do |post|
        li do
          link_to post_path(post), navigate: true do
            span { post.title }
          end
        end
      end
    end
  end
end
```

`post_path(post)` accepts anything responding to `#id`, so `post_path(post)` and `post_path(post.id)` are equivalent.

## Reference

### Defining routes

```ruby
router.get('/about', to: AboutComponent, as: 'about')
router.get('/users/:id', to: UserComponent, as: 'user')
router.post('/posts', to: CreatePostComponent, as: 'create_post')
router.set_default('/login')   # redirect target for "/"
```

`get/post/put/patch/delete` mirror Rails for semantic clarity; the verb labels the route on the client. Server requests are made through `link_to` actions or the [data layer](/funicular-on-rails-data), not by the router itself.

### Constraints

Restrict a parameter with a Regexp; non-matching paths fall through to the next route:

```ruby
router.get('/users/:id', to: UserComponent, as: 'user', constraints: { id: /\d+/ })
router.get('/posts/:year/:month', to: ArchiveComponent, as: 'archive',
           constraints: { year: /\d{4}/, month: /\d{1,2}/ })
```

Constraints use `Regexp#match?`, backed by JavaScript's `RegExp` engine in PicoRuby.wasm — write patterns in JavaScript regex syntax.

### Path helpers

`as:` generates `<name>_path`. Include `Funicular::RouteHelpers` where you use them:

```ruby
include Funicular::RouteHelpers

user_path(123)        # => "/users/123"
edit_post_path(post)  # => "/posts/456/edit"  (post responds to #id)
settings_path         # => "/settings"
```

### Programmatic navigation

```ruby
Funicular.router.navigate('/dashboard')
Funicular.router.current_path   # => "/users/123"
```

Use this after an async action, e.g. navigate once a login resolves.

### `link_to`: navigation vs. action

`link_to` produces two different things depending on intent:

| Intent      | Call                                   | Renders   | Effect                          |
|-------------|----------------------------------------|-----------|---------------------------------|
| Navigation  | `link_to path, navigate: true`         | `<a href>`| SPA transition via History API  |
| Server action | `link_to path, method: :delete`      | `<div>`   | HTTP request via Fetch API      |

Navigation links are real anchors, so right-click / open-in-new-tab / copy-link work. Action links are intentionally not anchors --- they perform an HTTP request (`:get/:post/:put/:patch/:delete`) and are the semantically correct element for a server operation. CSRF tokens are attached automatically to non-GET requests (ensure `csrf_meta_tags` is in your layout).

Customize how an action's response is handled by overriding `handle_link_response`:

```ruby
def handle_link_response(response, path, method)
  if response.error?
    patch(error: response.error_message)
  elsif method == :delete
    patch(messages: state.messages.reject { |m| m.id == response.data[:id] })
  end
end
```

### Active-link styling

Compare against the current path to mark the active link (see [Styling & Advanced](/funicular-on-rails-styling) for the `styles` DSL):

```ruby
styles do
  nav_link base: "px-4 py-2 rounded", active: "bg-blue-100 font-semibold"
end

def render
  link_to dashboard_path, navigate: true,
          class: s.nav_link(Funicular.router.current_path == dashboard_path) do
    span { "Dashboard" }
  end
end
```

### Route guards

Guard a route by checking a condition in `component_mounted` and redirecting:

```ruby
def component_mounted
  unless Session.authenticated?
    Funicular.router.navigate('/login')
    return
  end
  load_dashboard
end
```

### Mirroring Rails routes

Because the helper names match, it is convenient to mirror your Rails routes on the client so the same `*_path` helpers read the same on both sides:

```ruby
router.get('/posts/:post_id/comments/:comment_id', to: CommentComponent, as: 'comment')
```

## In the demo

[funicular-demo](https://github.com/hasumikin/funicular-demo) defines its routes in [`app/funicular/initializer.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/initializer.rb) (including a numeric `constraints` on the chat channel id), and its components navigate with `link_to` — for example the channel list in [`chat_components/channel_list_component.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/components/chat_components/channel_list_component.rb).
