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

All calls are **callback-based** (not Promises): you pass a block that runs when the response is ready. Every model callback has one uniform shape, `(result, error)`: on success `result` is the payload (`all` yields the model array, `find`/`create` the instance, `update` the updated instance, `destroy` yields `true`) and `error` is `nil`; on failure `result` is `nil`. Fire-and-forget (no block) is legal.

> **Breaking change in Funicular 0.5.0**: `update` and `destroy` used to
> yield `(true/false, data_or_error)`. Callsites that read the first
> argument as a boolean must be updated to the uniform `(result, error)`
> shape above.

There is also a fourth, optional layer: an in-browser SQLite database that mirrors fetched rows locally and lets you query them synchronously with `Post.local.where(...)`. See [Local Database (SQLite)](/funicular-on-rails-local-database).

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

The schema endpoint (e.g. `GET /api/schema/post`) returns the attribute list, the endpoint table, and optionally derived validations (see [Forms & Validation](/funicular-on-rails-forms)). On the Rails side, `Funicular::Schema.build` writes it for you. You declare the attributes; the endpoints derive from `config/routes.rb`:

```ruby
# config/routes.rb
resources :posts, only: [:index, :show]

# app/controllers/api/schema_controller.rb
class Api::SchemaController < ApplicationController
  def post
    render json: Funicular::Schema.build(
      Post,
      attributes: {
        "id"    => { type: "integer", readonly: true },
        "title" => { type: "string",  readonly: true },
        "body"  => { type: "string",  readonly: true }
      }
    )
  end
end
```

`resources :posts` gives `posts#index` and `posts#show`, so the client `Post` gets `all` and `find`. This is the same convention ActiveRecord uses for tables: the class name picks the resource, and the routes say what it can do. See [Endpoints](#endpoints) below for the rules and the escape hatches.

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
      (state[:posts] || []).each { |post| li { post.title } }
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

post.update(title: "Edited") { |updated, errors| ... }  # updated = the refreshed instance
post.destroy { |_ok, error| patch(post: nil) unless error }
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
      :post,
      fallback: -> { div(class: "spinner") { "Loading..." } },
      error: ->(e) {
        div do
          span { "Failed: #{e}" }
          button(onclick: -> { reload_suspense(:post) }) { "Retry" }
        end
      }
    ) do |res|
      h1 { res[:post].title }
    end
  end
end
```

The content block receives a resources accessor (`res[:post]`); resolved data is also reachable anywhere in the component as `resources[:post]`. The `fallback:` and `error:` procs run in your own component, so they use bareword tags like the rest of `render`. Use Suspense for **initial data loading**, not for user actions --- for a button click, just call the model and `patch` the result.

## Reference

### Model CRUD

```ruby
Post.all                          { |posts, error| ... }
Post.all(category: "tech", limit: 10) { |posts, error| ... }   # query params
Post.find(id)                     { |post, error| ... }
Post.create(attrs)                { |post, errors| ... }
post.update(attrs)                { |post, errors| ... }
post.destroy                      { |ok, error| ... }    # ok = true on success
post.reload                       { |post, error| ... }
```

`create`/`update` run client-side validations first and skip the request when the model is invalid (see [Forms & Validation](/funicular-on-rails-forms)).

The `error` a callback receives is a String for most failures. When the server renders `{ errors: record.errors }` with status 422, it is a `Funicular::Model::Errors` instead, and the same object is on `record.errors`. `error.to_s` joins the full messages, so `"#{error}"` works for both. See [Forms & Validation](/funicular-on-rails-forms#server-side-validation-errors).

### Endpoints

The schema's endpoint table maps a name to a method and a path. `Funicular::Schema.build` derives it from the routes to the model's controller (`Post` -> `posts`, `Admin::Post` -> `admin/posts`):

| Rails action | Endpoint name | Client call |
|---|---|---|
| `index` | `all` | `Post.all { }` |
| `show` | `find` | `Post.find(id) { }` |
| `create` | `create` | `Post.create(attrs) { }` |
| `update` | `update` | `post.update(attrs) { }` |
| `destroy` | `destroy` | `post.destroy { }` |
| any other action | the action name | `Post.find(id, endpoint_name: "avatar") { }` |

Where two routes lead to the same action, the first one in `routes.rb` wins. A missing endpoint raises `Funicular::Model::EndpointError`; the message lists the endpoints the schema has.

**Nested routes.** A path placeholder fills from the call. `Comment.all(post_id: 3)` requests `/posts/3/comments` and sends the other params as the query string. `Comment.create(post_id: 3, body: "...")` posts there. `Comment.find(7, post_id: 3)` and `Comment.destroy(7, post_id: 3)` take the parent as a keyword. The instance methods fill the path from the record's attributes. One unfilled placeholder takes the id, whatever the route calls it, so `resources :pages, param: :slug` works with `Page.find("hello")`. A placeholder that stays empty raises `ArgumentError` instead of sending a literal `:post_id`.

**Beyond the five.** `all(endpoint_name: "published")` and `create(attrs, endpoint_name: "publish")` reach collection and member routes, like `find(endpoint_name:)`.

**Escape hatches.** Every keyword of `Schema.build` steps around the convention:

```ruby
Funicular::Schema.build(Post, attributes: { ... },
  controller: "api/posts",                             # another controller
  endpoints: {
    "current" => "sessions#show",                      # alias a route
    "create"  => { method: "POST", path: "/login" },   # by hand
    "destroy" => nil                                   # hide a derived one
  },
  routes: false)                                       # no derivation at all
```

`model_class` may be `nil` for a schema with no ActiveModel class behind it (a session, say). Pass `controller:` then. A hand-written JSON schema without `Schema.build` keeps working unchanged. Routes of a mounted engine do not derive; write them by hand.

**Associations travel too.** With the local database enabled, `Schema.build` also sends each `belongs_to` whose foreign key is an exposed attribute, and the client defines `comment.post` and `post.comments` from it. The client classes stay empty. See [Associations](/funicular-on-rails-local-database#associations).

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

Models do not use this cache. With the local database enabled, a replica model revalidates with `ETag` and `If-None-Match` and serves a `304` from its replica. See [Conditional GET](/funicular-on-rails-local-database#conditional-get-the-replica-as-an-http-cache).

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
  uses `Post.find`, `Comment.all(post_id:)` on a nested route, and `Comment.create`.
- [`schema_controller.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/controllers/api/schema_controller.rb)
  writes no endpoints; they derive from `routes.rb`, with one alias for the session.
- [`settings_component.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/components/settings_component.rb)
  drives a form with `use_suspense` and `on_resolve` (plus `min_delay`).
