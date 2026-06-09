---
keywords: documentation
layout: page
tags: [Rails, Funicular]
title: "Funicular on Rails: Setup"
sidebar: picoruby_sidebar
permalink: funicular-on-rails
folder: funicular
---

[Getting Started with Funicular](/funicular) showed how to run a standalone Funicular app from a single `<script>` tag. This guide is the entry point to a different setting: **Funicular as a Rails plugin**, where your client-side Ruby lives next to your Rails code, is compiled to mruby bytecode, and is served through the asset pipeline.

This series assumes you already know Rails. We will not explain controllers,
models, or migrations --- only the parts that are specific to Funicular.

## What the gem gives you

The `funicular` gem turns a Rails app into the host of a Funicular SPA:

- **A vendored PicoRuby.wasm runtime.** Both a `dist` (production) and a `debug` (development) build ship inside the gem, so you self-host the runtime instead of relying on a CDN.
- **A vendored `picorbc` compiler.** The mruby compiler is bundled as a WebAssembly module and run through Node.js. You write `.rb` files; the gem compiles them to a single `app.mrb`.
- **Asset pipeline integration.** Your Funicular sources compile into `app/assets/builds/app.mrb`, which Propshaft serves with cache busting. In development, a middleware recompiles automatically whenever a source file changes.
- **Rails-style helpers.** `picoruby_include_tag`, `funicular_app_container`, and `funicular_state_tag` wire the runtime into your layout.
- **Rails test integration.** Client-side Funicular tests can live under `test/funicular/client/` and run as part of `bin/rails test`.

## Prerequisites

Funicular runs the bundled `picorbc` compiler through Node.js. Make sure Node.js is installed on any machine that compiles Funicular code --- your development workstation, CI, and anything that runs `assets:precompile`.

```bash
node --version
```

You do **not** need to install `@picoruby/picorbc` from npm; the compiler is already vendored in the gem.

## 1. Add the gem

```ruby
# Gemfile
gem "funicular"
```

```bash
bundle install
```

## 2. Run the installer

```bash
bin/rails funicular:install
```

This runs three sub-tasks.

### `funicular:install:wasm`

Copies the PicoRuby.wasm runtime --- both builds --- into `public/`:

```
public/
  picoruby/
    dist/          # production build (smaller, no debug symbols)
      init.iife.js
      picoruby.js
      picoruby.wasm
    debug/         # development build (larger, with debug symbols)
      init.iife.js
      picoruby.js
      picoruby.wasm
```

These files come straight from the gem's vendored copy. Add `public/picoruby/` to `.gitignore` and re-run the task after upgrading the gem so the runtime stays in sync.

### `funicular:install:debug_assets`

Copies the development component highlighter and an initializer template:

```
app/assets/javascripts/funicular_debug.js
app/assets/stylesheets/funicular_debug.css
config/initializers/funicular.rb
```

The generated `config/initializers/funicular.rb` is where you configure which runtime build `picoruby_include_tag` serves, and where you set options such as `Funicular.debug_color` (see [Debugging](/funicular-on-rails-debugging)).

### `funicular:install:test`

Adds a Rails test wrapper, a directory for client-side tests, and the Node.js DOM dependency used by the test runner:

```
test/
  test_helper.rb                         # created only when missing
  funicular/
    application_test.rb                  # calls Funicular::Testing.run!
    client/
      .keep                              # put client-side tests here
package.json                            # adds jsdom as a devDependency
.gitignore                              # adds /node_modules when possible
```

After the installer updates `package.json`, install the JavaScript dependency:

```bash
npm install
```

`test/funicular/application_test.rb` is a normal Rails Minitest file. It loads `funicular/testing`, runs the Node.js test runner, and fails the Rails test if any client-side test fails:

```ruby
require_relative "../test_helper"
require "funicular/testing"

class FunicularApplicationTest < ActiveSupport::TestCase
  test "client-side Funicular tests" do
    result = Funicular::Testing.run!(timeout_ms: 10_000)
    assert result.success?, result.output
  end
end
```

Write client tests under `test/funicular/client/**/*_picotest.rb`; they run through `bin/rails test` with the rest of your Rails test suite. See [Testing](/funicular-on-rails-testing) for the test runner and DOM helper API.

## 3. Wire up your layout

Load the runtime with the view helper instead of a hardcoded `<script>` tag:

```erb
<%# app/views/layouts/application.html.erb %>
<head>
  ...
  <%= csrf_meta_tags %>
  <%= picoruby_include_tag %>
</head>
```

`picoruby_include_tag` picks the right build automatically:

| Environment | Default source | Path served                       |
|-------------|----------------|-----------------------------------|
| development | `:local_debug` | `/picoruby/debug/init.iife.js`    |
| test        | `:local_debug` | `/picoruby/debug/init.iife.js`    |
| production  | `:local_dist`  | `/picoruby/dist/init.iife.js`     |

Then mount the app and load your compiled bytecode in the view that hosts the
SPA:

```erb
<%# e.g. app/views/home/index.html.erb %>
<%= funicular_app_container %>
<script type="application/x-mrb" src="<%= asset_path('app.mrb') %>"></script>
```

`funicular_app_container` renders the `<div id="app">` mount point (and, when you
use server-side rendering, the pre-rendered markup --- see
[SSR & Hydration](/funicular-on-rails-ssr)). `csrf_meta_tags` lets Funicular read
the CSRF token and attach it to non-GET requests automatically.

### Choosing the runtime source

Override the source per environment in `config/initializers/funicular.rb`:

```ruby
Funicular.configure do |config|
  # Use the jsDelivr CDN in production instead of self-hosting:
  config.production_source = :cdn

  # The CDN version defaults to the @picoruby/wasm-wasi version vendored in the
  # gem. Override only if you need a specific version:
  # config.cdn_version = "4.0.0"
end
```

| Value          | Description                                                              |
|----------------|--------------------------------------------------------------------------|
| `:local_debug` | `public/picoruby/debug/init.iife.js`                                     |
| `:local_dist`  | `public/picoruby/dist/init.iife.js`                                      |
| `:cdn`         | `https://cdn.jsdelivr.net/npm/@picoruby/wasm-wasi@<version>/dist/init.iife.js` |

You can also override a single tag: `<%= picoruby_include_tag source: :cdn %>`.

## 4. Where your code lives

Funicular sources live under `app/funicular/`:

```
app/funicular/
  models/              # UI models (ORM, validations)
    user.rb
    session.rb
  stores/              # client-side state (IndexedDB-backed)
    draft_store.rb
  components/          # UI components
    login_component.rb
    chat_component.rb
  initializer.rb       # routing and app startup (loaded last)
```

These files are **not** loaded by Rails autoloading --- they are compiled to mruby and run in the browser, not on the server. The compiler concatenates them in a fixed order so that definitions are available when they are used:

1. `app/funicular/models/**/*.rb` (alphabetically)
2. `app/funicular/stores/**/*.rb` (alphabetically)
3. `app/funicular/components/**/*.rb` (alphabetically)
4. `app/funicular/initializer.rb` and `app/funicular/*_initializer.rb`

`initializer.rb` is loaded last. Use it to load schemas, define routes, and start the app:

```ruby
# app/funicular/initializer.rb
Funicular.load_schemas({ User => "user", Session => "session", Channel => "channel" }) do
  Funicular.start(container: 'app') do |router|
    router.get('/login', to: LoginComponent, as: 'login')
    router.get('/chat/:channel_id', to: ChatComponent, as: 'chat_channel')
    router.get('/settings', to: SettingsComponent, as: 'settings')
    router.set_default('/login')
  end
end
```

## 5. Compilation and the asset pipeline

Funicular compiles `app/funicular/**/*.rb` into a single `app/assets/builds/app.mrb`, which Propshaft then serves (with a digest in production).

```
app/
  funicular/                 # source (version controlled)
  assets/
    builds/
      app.mrb                # compiled output (gitignore this)
      .keep
```

### Development

A middleware watches `app/funicular/` and **recompiles on the next request whenever a source file changes** --- no manual step, no server restart. The development build includes debug symbols (`picorbc -g`) for readable errors and debugger support.

To compile by hand:

```bash
bin/rails funicular:compile
```

### Production

`bin/rails assets:precompile` runs `funicular:compile` first, producing bytecode **without** debug symbols (smaller output). Propshaft then fingerprints `app.mrb`, and `asset_path('app.mrb')` resolves to the digested URL for cache busting.

```bash
RAILS_ENV=production bin/rails funicular:compile
```

|                  | Development            | Production             |
|------------------|------------------------|------------------------|
| Recompile        | automatic (middleware) | at `assets:precompile` |
| Debug symbols    | yes (`-g`)             | no                     |
| Runtime build    | `debug`                | `dist` (or `:cdn`)     |

### Inspecting routes

```bash
bin/rails funicular:routes
```

```
Method   Path                Component         Helper
----------------------------------------------------------
GET      /login              LoginComponent    login_path
GET      /chat/:channel_id   ChatComponent     chat_channel_path
GET      /settings           SettingsComponent settings_path

Total: 3 routes
```

## Next steps

- [Debugging](/funicular-on-rails-debugging) --- `Funicular.debug_color` and the Chrome DevTools extension
- [Components & State](/funicular-on-rails-components)
- [Routing & Navigation](/funicular-on-rails-routing)
- [Forms & Validation](/funicular-on-rails-forms)
- [Data Fetching: HTTP, Models & Suspense](/funicular-on-rails-data)
- [Stores & Realtime](/funicular-on-rails-stores)
- [SSR & Hydration](/funicular-on-rails-ssr)
- [Testing](/funicular-on-rails-testing)
- [Styling & Advanced](/funicular-on-rails-styling)
- [Plugins](/funicular-on-rails-plugins)

## A complete example app

[funicular-demo](https://github.com/hasumikin/funicular-demo) is a full Rails + Funicular application (a chat and blog) that exercises every feature in this series. Throughout these pages, the **"In the demo"** notes point to the file that demonstrates the topic at hand. For setup specifically, see its
[`Gemfile`](https://github.com/hasumikin/funicular-demo/blob/master/Gemfile),
[`config/initializers/funicular.rb`](https://github.com/hasumikin/funicular-demo/blob/master/config/initializers/funicular.rb), and [`app/funicular/initializer.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/initializer.rb).
