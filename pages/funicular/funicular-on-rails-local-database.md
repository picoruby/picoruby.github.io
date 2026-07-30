---
keywords: documentation
layout: page
tags: [Rails, Funicular]
title: "Funicular on Rails: Local Database (SQLite)"
sidebar: picoruby_sidebar
permalink: funicular-on-rails-local-database
folder: funicular
---

Funicular can provide a real relational database inside the browser: **SQLite,
compiled to WebAssembly, queried from Ruby with an ActiveRecord-flavored
API**. Reads are instant and synchronous --- no spinner, no network:

```ruby
Post.local.where(published: true).order(created_at: :desc).limit(10).each do |post|
  # instant, synchronous -- this never touches the network
end
```

The subsystem is **disabled by default**; an application that does not opt in
remains REST-only and never opens SQLite, IndexedDB, or Web Locks.

> **Requirements**: the local database needs **Funicular 0.5.0 or later**
> and, on the npm side, **`@picoruby/wasm-wasi` 4.0.3 or later**.

## Mental model

**The Rails server is the source of truth. The local database is a
structured, queryable replica plus a home for client-only data.**

Every row in the local database belongs to one of two categories:

- **Replica data** --- a local copy of rows that live in your Rails database.
  It arrives via the REST API you already have. Losing it costs nothing but a
  refetch; it exists so that reads are instant and relational.
- **Client-only data** --- drafts, local preferences, unsent form state.
  It exists nowhere but this browser, so it is persisted more aggressively
  and never dropped because of anything the server does.

Physically these are two separate SQLite databases, each snapshotted
independently to IndexedDB. You never open or manage them yourself; model
declarations decide where a model's table lives.

One lexical rule runs through the whole API:

- **The bare class talks to the model's source of truth.** For replica
  models that is the server, so the bare class speaks REST: `Post.all { }`,
  `Post.find(id) { }` --- asynchronous, callback-based, `(result, error)`.
- **`.local` is the local database view.** `Post.local.where(...)` is
  instant and synchronous, but possibly stale --- writing `.local` is how
  you acknowledge "this may be a cache".

For `storage :local` models the local database IS the source of truth, so
the `.local` prefix is optional there: `Draft.where(...)` ==
`Draft.local.where(...)`.

## Enabling the feature

Opt in on the Rails side, and declare how browser storage is isolated ---
both are mandatory:

```ruby
# config/initializers/funicular.rb (Rails)
Funicular.configure do |config|
  config.local_database = true
  config.application_id = "my_app"        # default: "funicular"
  config.user_key = ->(controller) {
    controller.current_user&.storage_key  # a stable, non-reusable id (UUID column is ideal)
  }
end
```

An application with no user accounts can deliberately share one anonymous
namespace instead:

```ruby
Funicular.configure do |config|
  config.local_database = true
  config.anonymous_only = true
end
```

Enabling the feature without exactly one of these identity declarations
fails during Rails startup. Snapshots are namespaced per application and
per user, so when user B signs in on a machine where user A never logged
out, user B's boot opens user B's namespace and never sees user A's drafts.
The framework also tracks a **session epoch** that rotates on every
login/logout; a tab whose session changed underneath it discards the
response, stops writing, and reloads (override with
`config.on_session_change`).

## Quick start

```ruby
# app/funicular/models/post.rb
class Post < Funicular::Model
  belongs_to :user
  has_many :comments
end

# app/funicular/models/draft.rb
class Draft < Funicular::Model
  storage :local do
    migrate 1 do |t|
      t.string  :title
      t.text    :body
      t.integer :post_id
      t.timestamps
    end
  end
end

# app/funicular/components/blog_index_component.rb
class BlogIndexComponent < Funicular::Component
  def initialize_state
    { posts: [] }
  end

  def component_mounted
    watch(:posts) { Post.local.where(published: true).order(created_at: :desc) }
    Post.all { |_posts, error| patch(error: error) if error }
  end

  def render
    div do
      state[:posts].each { |post| component PostRow, post: post }
    end
  end
end
```

What happens here:

1. `Post` is an ordinary schema-loaded model. With the local database
   enabled, the default `storage :replica` gives it a table auto-created
   from the schema your Rails server already delivers.
2. `Post.all { ... }` fetches from REST as it always has; the framework
   additionally upserts every fetched row into the replica table
   (**fetch-through**).
3. `watch(:posts)` binds `state[:posts]` to a local query. Whenever the
   `posts` table changes --- a fetch landed, a write went through --- the
   block re-runs and the component re-renders.

## Declaring models

### `storage` --- where the model's data lives

```ruby
storage :replica     # default; you do not write this
storage :ephemeral
storage :local
```

- **`:replica`** (default). Backed by a local table derived from the server
  schema. REST results flow into it automatically. The table is dropped and
  rebuilt whenever the server schema changes --- replicas are disposable by
  design.
- **`:ephemeral`**. No local table, nothing written to disk; the model is
  REST-only, exactly like classic Funicular. Use this for sensitive models
  whose data must not rest in browser storage (authentication/session
  models are the canonical case).
- **`:local`**. Client-only table, declared with `migrate` blocks (below).
  No server schema, no REST integration; writes are local and synchronous.

Table names derive from the class name with naive pluralization
(`Post` -> `posts`, `Category` -> `categories`); irregular names must be
declared with `table_name "people"`.

### Associations

```ruby
class Post < Funicular::Model
  belongs_to :user       # post.user     -> User.local.find_by(id: post.user_id)
  has_many   :comments   # post.comments -> Comment.local.where(post_id: post.id), chainable
end
```

Associations are local-query sugar over the `<name>_id` convention and
always read locally --- an instance you are holding already came out of the
local database, so its neighborhood reads locally too. `class_name:` and
`foreign_key:` are supported; `through:`, eager loading, and polymorphic
associations are not (v1). The classic N+1 concern barely applies: each
"+1" is a microsecond query against local memory.

### `storage :local do ... end` --- table shape and evolution

The table IS the fold of its numbered `migrate` blocks: block 1 creates it,
and every later change is simply the next block. There is no separate
schema declaration to keep in sync.

```ruby
storage :local do
  migrate 1 do |t|
    t.string :title
    t.string :body
    t.timestamps
  end
  migrate 2 do |t|
    t.rename :body, :content            # destructive steps are ordinary steps
    t.string :status, default: "draft"  # in later blocks this is ADD COLUMN
  end
end
```

Builder vocabulary: `t.string` / `t.text` / `t.integer` / `t.float` /
`t.boolean` / `t.datetime` (options: `default:`, `null:`), `t.timestamps`,
`t.index` / `t.remove_index`, `t.rename`, `t.remove`, and `t.execute "..."`
as the raw-SQL escape hatch. Every table gets an implicit
`id INTEGER PRIMARY KEY`. Booleans map to 0/1 and `datetime` to UTC ISO
8601 TEXT, converted at the Ruby boundary by one shared codec.

Migrations apply per table on boot, inside one transaction; failure rolls
back --- user data is never left half-migrated. Three reset mechanisms
exist for when "throw it away" is the right tool:

- **Development auto-reset**: a failing migration in development drops and
  rebuilds the table with a console warning. Never in production.
- **`migrate 4, reset: true do ... end`**: a new baseline (a complete table
  definition, not a diff). Clients below it are rebuilt from scratch; older
  blocks may be deleted from the code. This doubles as history squashing.
- **`Draft.reset_local`**: drop and rebuild right now --- for a "clear
  local data" button or console debugging.

## Querying

`where`, `order`, `limit`, and `offset` build a lazy, chainable Relation;
SQL executes once, when you materialize it.

```ruby
Post.local.where(done: false)                      # equality
Post.local.where(id: [1, 2, 3])                    # IN
Post.local.where(created_at: t1..t2)               # range (BETWEEN)
Post.local.where("published_at < ?", now_iso8601)  # raw SQL fragment

Post.local.order(:pinned, created_at: :desc).limit(20).offset(40)
```

Edge semantics are pinned down ActiveRecord-style: `where(x: nil)` emits
`IS NULL`, `where(id: [])` is an always-empty relation, unknown column
names raise instead of reaching SQL, and multiple `where` calls AND
together.

Materializers:

```ruby
relation.each { |m| ... }   # enumerate model instances
relation.to_a               # array of instances
relation.first              # instance or nil (adds LIMIT 1)
relation.count              # SELECT COUNT(*)
relation.exists?            # SELECT 1 LIMIT 1

Post.local.find(42)         # instance, or raises Funicular::RecordNotFound
Post.local.find_by(id: 42)  # instance or nil
```

Rows come back as instances of your model class --- the same class the REST
mapper returns --- with attribute readers, validations, and associations.

`JOIN`, `OR`, `GROUP BY`, and everything else SQL can do remain available
through the raw handles. After a raw **write**, tell the framework so
watches fire and persistence is scheduled:

```ruby
Funicular::DB.local.execute("UPDATE drafts SET title = TRIM(title)")
Funicular::DB.notify_changed(Draft)
```

## Writing data

### Replica models: writes go through the server

The server owns replica data, so writes keep their existing REST form ---
and the local replica follows automatically (**write-through**):

```ruby
Post.create({ title: "Hello" }) do |post, error|
  # the server's authoritative row was upserted into the replica;
  # every watch on Post has already re-rendered
end

post.update(title: "Edited") do |post, error| ... end  # post = updated instance
post.destroy do |ok, error| ... end                    # ok = true on success
```

The framework applies the server's **response** (not your request) to the
replica, so the local copy reflects what the server actually stored ---
defaults, callbacks, and normalizations included.

> **Breaking change vs Funicular <= 0.4**: every REST callback is now
> uniformly `(result, error)`. `update` and `destroy` used to yield
> `(true/false, data_or_error)`; callsites reading the first argument as a
> boolean must be updated.

There is no local bulk delete for replica models
(`Funicular::DB::ReplicaWriteError`); deletions reach the replica through
write-through `destroy`.

### Local models: writes are local, synchronous, validated

```ruby
draft = Draft.create(title: "untitled", body: "")   # returns the instance
draft.update(body: "...")                           # true/false (validations)
draft.errors                                        # standard validation errors
draft.destroy                                       # true
Draft.where("updated_at < ?", cutoff).delete_all    # bulk delete
```

No blocks --- these cannot fail like a network call can. Validation
failures report through `valid?`/`errors` exactly like the REST mapper.
`created_at`/`updated_at` (via `t.timestamps`) are maintained
automatically.

## Reactivity: `watch`

`watch` binds a state key to a Relation. The block runs once immediately,
and re-runs (patching the key and re-rendering) whenever the underlying
table changes --- fetch-through, write-through, local write, or wipe:

```ruby
def component_mounted
  watch(:todos) { Todo.local.where(done: false).order(:id) }
end
```

Subscriptions die with the component; unmount cleans up automatically.
Change events fire only after the surrounding transaction commits, at most
once per changed table per transaction, and are never delivered inside
another component update. For derived values (counts, combined queries),
use the primitive plus an ordinary `patch`:

```ruby
def component_mounted
  @sub = Todo.on_change { patch(open_count: Todo.local.where(done: false).count) }
  patch(open_count: Todo.local.where(done: false).count)
end

def component_will_unmount
  Todo.off_change(@sub)
end
```

`render` keeps its existing rule: it reads `state`, nothing else. `watch`
exists so that "state" and "live view of the local DB" are the same thing.

## Persistence and durability

SQLite runs in wasm memory; durability comes from snapshotting each
database into IndexedDB, automatically:

|                        | replica DB                 | local DB                 |
|------------------------|----------------------------|--------------------------|
| Contains               | server-recoverable copies  | unrecoverable user data  |
| Auto-persist (debounced) | ~5 s quiet               | ~500 ms quiet            |
| Extra persist          | on tab hidden              | on tab hidden            |
| On schema mismatch     | dropped and rebuilt        | never dropped; migrated  |

A page reload restores both databases from their last snapshot --- the
replica gives you instant first paint from the previous session's data
(stale until your fetches revalidate it). A crash can lose the seconds
since the last snapshot: browser storage is best-effort, not a transaction
log. **Data the user must never lose should eventually reach the server**;
the local DB is not a substitute for that.

When at least one `storage :local` model is declared, the framework
requests persistent storage (`navigator.storage.persist()`); opt out with
`config.request_persistent_storage = false`. `Funicular::DB.flush` forces a
snapshot right now (rarely needed), and persistence failures are logged and
reported through `config.on_persist_error`.

### Multiple tabs: one writer per namespace

Two tabs snapshotting the same name would silently overwrite each other, so
the framework elects a single writer per namespace using a Web Lock. Every
page runs in exactly one of three durability states, decided instantly at
boot:

- **`persistent_writer`** --- the tab holding the lock: restores, persists,
  writes. Exactly one per namespace.
- **`persistent_reader`** --- any additional tab, for the life of the page.
  The replica works fully, but `storage :local` writes raise
  `Funicular::DB::ReadOnlyTabError` --- unrecoverable data is never written
  where it would be silently lost. To write, reload after the writer tab
  has closed.
- **`volatile`** --- Web Locks or IndexedDB unavailable (e.g. blocking
  private modes): everything works, including local writes, but nothing
  persists, and that is announced loudly rather than faked.

### Logout: wiping local data

Namespaces already isolate users, so `wipe` is a cleanup tool, not a
security requirement --- call it when the product wants no trace left on a
shared machine:

```ruby
Funicular::DB.wipe
```

One call drops every table in both databases of the current namespace and
deletes its snapshots. In-flight REST responses are discarded, pending
persists are cancelled, and watches re-render onto empty tables.

## Server-side rendering

Local queries do not exist on the server. If a component's SSR path reaches
one, it raises `Funicular::DB::UnavailableError` --- deliberately loud,
because silently rendering an empty list would defeat SSR and hide the bug.
Components rendered through SSR read their data from state seeded by the
controller (see [SSR & Hydration](/funicular-on-rails-ssr));
`watch`-driven components belong on client-rendered routes.

## Configuration reference

Runtime DB hooks and tuning are optional, in
`app/funicular/initializer.rb`:

```ruby
Funicular::DB.configure do
  config.replica_debounce_ms         = 5000   # default
  config.local_debounce_ms           = 500    # default
  config.request_persistent_storage  = true   # default
  config.on_persist_error            = nil    # ->(error) { ... }
  config.on_boot_error               = nil    # ->(errors) { ... }
  config.on_session_change           = nil    # default: reload the page
end
```

The application/user namespace and session epoch are configured on the
Rails side (`Funicular.configure`), not here.

## Limitations (v1)

- **Whole-database snapshots**: persistence cost scales with database size.
  Replicate what your screens need, not your whole warehouse.
- **Memory-bound**: both databases live in wasm memory. Same advice.
- **Binary attributes are not replicated** (they never ride the REST JSON;
  use Blob/object URLs or the Cache API for assets).
- **Replica rows need an `id`** (integer or UUID; keyless models must
  declare `storage :ephemeral`).
- **`JOIN`, `OR`, aggregates** beyond `count`: raw SQL escape hatch only.
- **No optimistic writes** for replica models: a `create`/`update` shows up
  locally when the server confirms it, not before.
- **No reader-to-writer promotion**: a reader tab that needs to write
  reloads once the writer tab is gone.

## Relationship to Stores

The local database supersedes the Store layer
([Stores & Realtime](/funicular-on-rails-stores)). Store remains available
and unchanged for now, but no new features will build on it; new code
should use models and `watch`.

## Further reading

The complete design document --- including boot order, schema
fingerprinting, the session epoch, and every guarantee stated precisely ---
lives in the gem repository:
[docs/local_database.md](https://github.com/picoruby/funicular/blob/master/docs/local_database.md).
