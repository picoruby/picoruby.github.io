---
keywords: documentation
layout: page
tags: [Rails, Funicular]
title: "Funicular on Rails: Stores & Realtime"
sidebar: picoruby_sidebar
permalink: funicular-on-rails-stores
folder: funicular
---

Two related capabilities live here because they are so often used together:

- **Realtime** --- `Funicular::Cable`, an ActionCable-compatible WebSocket client, for live updates (chat, notifications, presence).
- **Stores** --- a declarative DSL over IndexedDB for persisting client-side data (drafts, caches, feeds), with TTL, coordinated clearing, and **optional Cable integration** so a store can keep itself in sync from a channel.

A chat feature is the canonical example: messages arrive over Cable, and a Store caches them so a returning user sees history instantly.

## Tutorial: realtime with Cable

Create a consumer pointed at your Rails cable endpoint, subscribe to a channel, and handle incoming messages by patching state. Clean up on unmount:

```ruby
class ChatComponent < Funicular::Component
  def initialize_state
    { messages: [], input: "" }
  end

  def component_mounted
    @consumer = Funicular::Cable.create_consumer("/cable")
    @subscription = @consumer.subscriptions.create(channel: "ChatChannel", room: "lobby") do |data|
      patch(messages: state.messages + [data]) if data
    end
  end

  def handle_send
    @subscription.perform("speak", message: state.input)  # calls ChatChannel#speak
    patch(input: "")
  end

  def component_unmounted
    @subscription&.unsubscribe
    @consumer&.disconnect
  end
end
```

`subscriptions.create(channel:, **params)` mirrors ActionCable; `perform(action, data)` invokes the matching method on your Rails channel. The consumer reconnects automatically. The Rails side is ordinary ActionCable:

```ruby
# app/channels/chat_channel.rb
class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room]}"
  end

  def speak(data)
    ActionCable.server.broadcast("chat_#{params[:room]}",
      { id: SecureRandom.uuid, user: current_user.username, content: data["message"] })
  end
end
```

**Always unsubscribe and disconnect in `component_unmounted`** --- a dangling subscription keeps receiving messages in the background.

## Tutorial: persisting with a Store

A Store persists data in IndexedDB, partitioned by a **scope**. Subclass `Singleton` (one value per scope) or `Collection` (an ordered list per scope):

```ruby
# app/funicular/stores/draft_store.rb
class Funicular::DraftStore < Funicular::Store::Singleton
  database   "funicular_drafts"
  scope      :channel_id
  cleared_on :logout
  expires_in 60 * 60 * 24   # optional 24h TTL
end
```

Get a scope with `.where(...)` and read/write through it:

```ruby
draft = Funicular::DraftStore.where(channel_id: 1)
draft.value = "Hello"       # persisted to IndexedDB
draft.value                 # => "Hello"  (nil if missing/expired)
draft.delete
```

Stores open IndexedDB lazily on first use --- no `init!` needed.

### A Store that syncs over Cable

A `Collection` can subscribe to a channel itself, so caching and realtime are one declaration. The handler block runs with `self` bound to the scope, so `replace` / `append` / `remove` mutate that scope's cache:

```ruby
class Funicular::MessageCache < Funicular::Store::Collection
  database "funicular_message_cache"
  scope    :channel_id
  limit    100
  key      ->(m) { m["id"] }

  subscribes_to "ChatChannel",
                params: ->(s) { { channel: "ChatChannel", channel_id: s.channel_id } } do |data, _scope|
    case data["type"]
    when "initial_messages" then replace(data["messages"] || [])
    when "new_message"      then append(data["message"])
    when "delete_message"   then remove(data["message_id"])
    end
  end
end
```

In the component, read the cache for an instant first paint, subscribe to changes, then activate the Cable subscription:

```ruby
def select_channel(channel)
  @cache&.unsubscribe!
  @cache&.off_change(@cb_id) if @cb_id

  @cache  = Funicular::MessageCache.where(channel_id: channel.id)
  patch(messages: @cache.all)                       # cached history, immediately
  @cb_id  = @cache.on_change { |snap| patch(messages: snap) }
  @cache.subscribe!                                 # live updates from here on
end

def component_unmounted
  @cache&.unsubscribe!
  @cache&.off_change(@cb_id) if @cb_id
end
```

## Reference

### Cable

```ruby
consumer = Funicular::Cable.create_consumer("/cable")  # relative or ws(s):// URL
sub = consumer.subscriptions.create(channel: "ChatChannel", room: "lobby") { |data| ... }
sub.perform("speak", message: "Hi")   # invoke a Rails channel action
sub.unsubscribe
consumer.disconnect
```

Compatible with ActionCable subscriptions, broadcasting, `perform` actions, auto-reconnect, and ping/pong keepalive. Prefer focused channels over one catch-all channel, validate all incoming data on the server, and use a `key:` on list items rendered from messages for efficient re-rendering.

### Store types and DSL

`Funicular::Store::Singleton` --- one value per scope:
`value`, `value=` (setting `""` deletes), `delete`, `present?`, `expired?`.

`Funicular::Store::Collection` --- ordered list per scope:
`all`, `replace(arr)`, `append(item)`, `remove(id)`, `last`, `last_id`, `size`,
`clear`, `same_tail?(other)`, `expired?`.

| DSL                                      | Description                                         |
|------------------------------------------|-----------------------------------------------------|
| `database "name"`                        | IndexedDB database name (required)                  |
| `kvs_store "name"`                       | Object store within the database (default `"kv"`)   |
| `scope :key` / `scope :a, :b`            | Keys that partition data                            |
| `limit n`                                | (Collection) cap on items                           |
| `order :append` / `:prepend`             | (Collection) insertion order                        |
| `key ->(item) { ... }`                   | (Collection) extract an item's id                   |
| `expires_in seconds`                     | TTL (lazy-deleted on read)                          |
| `cleared_on :event`                      | Register for `Store.dispatch(:event)`               |
| `cable_url "/path"`                      | ActionCable endpoint (default `"/cable"`)           |
| `subscribes_to "Channel", params:  { }`  | Embed Cable handling (block runs with `self == Scope`) |
| `source ModelClass` / `belongs_to :name` | Decorative annotations (no runtime behavior)        |

### Scope API

`.where(...)` returns a memoized `Scope` (same kwargs return the same instance, which matters for `on_change` identity). Common to both types:

```ruby
cb_id = scope.on_change { |snapshot| ... }
scope.off_change(cb_id)
scope.subscribe!     # requires subscribes_to
scope.unsubscribe!
scope.subscribed?
```

Note scope keys use strict equality: `where(channel_id: 1)` and `where(channel_id: "1")` are different Scope instances (though stored data is shared, since storage keys are stringified).

### Coordinated clearing

Register stores with `cleared_on :event` and wipe them all at once --- for example on logout:

```ruby
Funicular::Store.dispatch(:logout)   # clears every store registered for :logout
```

Pass a block to `cleared_on` to override the default full wipe with custom logic.

## In the demo

[funicular-demo](https://github.com/hasumikin/funicular-demo):

- [`stores/draft_store.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/stores/draft_store.rb) persists unsent message drafts in IndexedDB.
- [`chat_component.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/components/chat_component.rb) creates a `Funicular::Cable` consumer and subscribes to `ChatChannel`.
- [`chat_components/message_input_component.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/components/chat_components/message_input_component.rb) reads and writes the draft store as the user types.
