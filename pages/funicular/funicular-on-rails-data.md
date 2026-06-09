---
keywords: documentation
layout: page
tags: [Rails, Funicular]
title: "Funicular on Rails: Data Fetching"
sidebar: picoruby_sidebar
permalink: funicular-on-rails-data
folder: funicular
---

Funicular gives you three layers for talking to your Rails backend, from high to low level:

1. **Models** --- an ActiveRecord-style Object-REST Mapper (`User.all`, `Post.find`, `record.update`). Use this for ordinary CRUD.
2. **`Funicular::HTTP`** --- a low-level client for anything that is not plain CRUD.
3. **Suspense** --- a declarative way to render loading and error states while data arrives.

All calls are **callback-based** (not Promises): you pass a block that runs when the response is ready.

## Tutorial: a model-backed list and detail

Define a model and tell it which schema endpoint describes it. Schemas load once at startup, before the app mounts:

```ruby
# app/funicular/models/post.rb
class Post < Funicular::Model
end

# app/funicular/initializer.rb
Funicular.load_schemas({ Post => "post" }) do
  Funicular.start(container: 'app') do |router|
    router.get('/posts',     to: PostListComponent, as: 'posts')
    router.get('/posts/:id', to: PostComponent,     as: 'post')
    router.set_default('/posts')
  end
end
```

The schema endpoint (e.g. `GET /api/schema/post`) returns the attribute list (and optionally derived validations --- see [Forms & Validation](/funicular-on-rails-forms)).
Now fetch records with an ActiveRecord-like API:

```ruby
class PostListComponent < Funicular::Component
  def component_mounted
    Post.all do |posts, error|
      patch(posts: posts) unless error
    end
  end

  def render
    ul do
      (state.posts || []).each { |post| li { post.title } }
    end
  end
end
```

Attributes come back as methods: `post.id`, `post.title`, `post.created_at`.
Create, update, and delete look just like Rails:

```ruby
Post.find(123) { |post, error| patch(post: post) unless error }

Post.create(title: "Hello", body: "...") do |post, errors|
  errors ? patch(errors: errors) : patch(post: post)
end

post.update(title: "Edited") { |updated, errors| ... }
post.destroy { |_response, error| patch(post: nil) unless error }
```

## Suspense for loading states

Manually juggling `is_loading` flags gets tedious. **Suspense** declares an async loader at the class level and renders a fallback until it resolves:

```ruby
class PostComponent < Funicular::Component
  use_suspense :post,
    ->(resolve, reject) {
      Post.find(props[:id]) do |post, error|
        error ? reject.call(error) : resolve.call(post)
      end
    }

  def render
    suspense(
      fallback: -> { div(class: "spinner") { "Loading..." } },
      error: ->(e) {
        div { span { "Failed: #{e}" }; button(onclick: -> { reload_suspense(:post) }) { "Retry" } }
      }
    ) do
      h1 { post.title }   # the resolved value is available as a method
    end
  end
end
```

The resolved data is exposed as a method named after the source (`post`). Declare several `use_suspense` sources and the `suspense` block waits for all of them. Use Suspense for **initial data loading**, not for user actions --- for a button click, just call the model and `patch` the result.

## Reference

### Model CRUD

```ruby
Post.all                          { |posts, error| ... }
Post.all(category: "tech", limit: 10) { |posts, error| ... }   # query params
Post.find(id)                     { |post, error| ... }
Post.create(attrs)                { |post, errors| ... }
post.update(attrs)                { |post, errors| ... }
post.destroy                      { |response, error| ... }
```

`create`/`update` run client-side validations first and skip the request when the model is invalid (see [Forms & Validation](/funicular-on-rails-forms)). Override the default RESTful paths with a class `endpoint`:

```ruby
class User < Funicular::Model
  def self.endpoint
    { "path" => "/api/v2/users", "find" => "/api/v2/users/:id",
      "create" => "/api/v2/users", "update" => "/api/v2/users/:id",
      "destroy" => "/api/v2/users/:id" }
  end
end
```

### `Funicular::HTTP`

For non-CRUD calls. CSRF tokens are attached automatically to non-GET requests
(keep `csrf_meta_tags` in your layout):

```ruby
Funicular::HTTP.get('/api/search?q=ruby') do |response|
  response.ok            # true for 2xx
  response.status        # numeric status
  response.data          # parsed JSON
  response.error?        # true on error
  response.error_message
end

Funicular::HTTP.post('/api/posts', { title: "Hi" }) { |response| ... }
# also: .patch, .put, .delete
```

Prefer Models for standard CRUD; reach for `HTTP` only when there is no model.

### Response cache

GET responses can be cached in IndexedDB to cut perceived latency. It is opt-in per call via `cache:` (TTL in seconds); only 2xx GETs are written, keyed by full URL:

```ruby
Funicular::HTTP.get('/api/posts', cache: 60) { |response| ... }

Funicular::HTTP.cache_init!                 # optional: pay open cost at boot
Funicular::HTTP.cache_purge('/api/posts')   # invalidate one entry
Funicular::HTTP.cache_clear                 # invalidate everything
```

Invalidation is explicit: a POST/PATCH/DELETE does **not** auto-purge related GET entries --- invalidate affected URLs yourself when you mutate data. Falls back to in-memory storage when IndexedDB is unavailable.

### Suspense API

```ruby
use_suspense :name, ->(resolve, reject) { ... }, on_resolve: ->(value) { ... }, min_delay: 300
```

- `on_resolve:` runs when the value arrives --- handy for syncing loaded data into
  form state.
- `min_delay:` keeps the fallback visible for at least N ms to prevent flicker on
  fast responses.

Helpers inside the component: `suspense_loading?` / `suspense_loading?(:name)`,
`suspense_error?(:name)`, `suspense_error(:name)`, `reload_suspense(:name)`.

### Cleaning up in-flight requests

A callback may fire after the component is gone. Guard updates with a mounted flag and clear it in `component_unmounted`:

```ruby
def component_mounted
  @alive = true
  Post.all { |posts, _e| patch(posts: posts) if @alive }
end

def component_unmounted
  @alive = false
end
```

## In the demo

[funicular-demo](https://github.com/hasumikin/funicular-demo):

- [`blog_index_component.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/components/blog_index_component.rb)
  loads posts with `Post.all`.
- [`blog_post_component.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/components/blog_post_component.rb)
  uses `Post.find` and `Comment.create`.
- [`settings_component.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/components/settings_component.rb)
  drives a form with `use_suspense` and `on_resolve` (plus `min_delay`).
