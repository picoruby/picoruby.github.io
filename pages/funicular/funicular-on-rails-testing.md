---
keywords: documentation
layout: page
tags: [Rails, Funicular, Testing]
title: "Funicular on Rails: Testing"
sidebar: picoruby_sidebar
permalink: funicular-on-rails-testing
folder: funicular
---

Funicular's Rails test integration lets you test client-side Ruby components inside the normal Rails test command. You write tests in Ruby, name them `*_picotest.rb`, place them under `test/funicular/client/`, and run them with:

```bash
bin/rails test
```

The tests run in Node.js with `jsdom`, not in a real browser. That keeps them fast and CI-friendly while still giving your component code a DOM, events, `window`, `document`, `localStorage`, and the PicoRuby.wasm runtime.

## What the installer adds

`bin/rails funicular:install` runs `funicular:install:test`, which creates or updates the Rails-side test integration:

```
test/
  test_helper.rb
  funicular/
    application_test.rb
    client/
      .keep
package.json
.gitignore
```

`test/test_helper.rb` is created only when it does not already exist. The generated `test/funicular/application_test.rb` is a normal Rails Minitest test:

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

The installer also adds `jsdom` to `package.json` as a development dependency.
Install it once after running the installer:

```bash
npm install
```

If your app already had `package.json`, the installer preserves it and only adds the missing `devDependencies.jsdom` entry.

## How the runner works

When `bin/rails test` reaches `FunicularApplicationTest`, the test calls `Funicular::Testing.run!`. That method:

1. Builds a manifest for the Rails app.
2. Starts a Node.js runner from the `funicular` gem.
3. Creates a `jsdom` document with `<div id="app"></div>`.
4. Loads the PicoRuby.wasm test runtime.
5. Loads your Funicular source files from `app/funicular/`.
6. Loads client tests from `test/funicular/client/**/*_picotest.rb`.
7. Runs every `Picotest::Test` subclass and returns the result to Rails.

The default Funicular source order is the same order used by the compiler, but startup initializers are skipped: `app/funicular/initializer.rb` and `app/funicular/*_initializer.rb` are not loaded by the test runner. Tests mount the component they need directly.

The default client test glob is:

```
test/funicular/client/**/*_picotest.rb
```

The suffix is intentional. Rails and CRuby Minitest discover `*_test.rb` files, so Funicular client tests use `*_picotest.rb` to keep them out of the server-side test loader while still making their purpose obvious.

You can override runner options from the Rails wrapper:

```ruby
result = Funicular::Testing.run!(
  test_glob: "test/funicular/client/login/**/*_picotest.rb",
  timeout_ms: 20_000
)
```

Useful options:

| Option        | Default                         | Description |
|---------------|---------------------------------|-------------|
| `source_dir`  | `app/funicular`                 | Directory containing Funicular app source |
| `test_glob`   | `test/funicular/client/**/*_picotest.rb` | Client-side test files |
| `timeout_ms`  | `5000`                          | Node runner timeout |
| `node`        | `ENV["NODE"]` or `node`         | Node.js executable |
| `runtime_dir` | vendored test runtime           | PicoRuby.wasm test runtime directory |

## Writing a component test

Client tests inherit from `Funicular::Testing::DOMTest`. A test method mounts a component, interacts with the DOM, and makes assertions:

```ruby
# test/funicular/client/login_component_picotest.rb
class LoginComponentTest < Funicular::Testing::DOMTest
  def test_empty_submit_shows_validation_error
    mount LoginComponent
    submit "form"

    assert_text "Please enter username and password"
  end
end
```

`DOMTest` resets the document body before each test:

```html
<div id="app"></div>
```

`mount LoginComponent` creates the component, mounts it into `#app`, drains the runtime once, and returns the component instance. You can keep that return value when you need to inspect component state:

```ruby
component = mount CounterComponent

assert_equal 0, component.state.count
click "button"
assert_equal 1, component.state.count
```

## DOM helpers

`Funicular::Testing::DOMTest` provides the small set of helpers needed for component-level tests:

| Helper | Description |
|--------|-------------|
| `document` | The `jsdom` document |
| `container` | The `#app` element |
| `mount(ComponentClass, props = {})` | Mounts a component into `#app` |
| `query(selector)` | Returns the first matching DOM node |
| `assert_selector(selector)` | Fails unless a matching node exists |
| `text(selector = nil)` | Returns text from the selector, or the document body |
| `assert_text(expected, selector = nil)` | Fails unless text includes `expected` |
| `dispatch(selector, event_type)` | Dispatches a bubbling DOM event |
| `click(selector)` | Dispatches a `click` event |
| `submit(selector = "form")` | Dispatches a `submit` event |
| `input(selector, value)` | Sets an input value and dispatches an `input` event |
| `drain(ms = 20)` | Gives asynchronous PicoRuby tasks time to run |

Use ordinary Picotest assertions such as `assert`, `assert_equal`, `assert_nil`, and `assert_not_nil` alongside these DOM helpers.

## Testing user input

For input-driven components, set form field values through `input` and then dispatch the event that your component handles:

```ruby
class SearchComponentTest < Funicular::Testing::DOMTest
  def test_filters_results
    mount SearchComponent, items: ["Ruby", "Rails", "JavaScript"]

    input "input[type=search]", "Ruby"

    assert_text "Ruby"
    assert_equal false, text.include?("JavaScript")
  end
end
```

For buttons and links, prefer selectors that describe the rendered UI clearly:

```ruby
click "button[data-action=save]"
assert_text "Saved"
```

## Async behavior

The runner advances PicoRuby tasks while waiting for tests to finish, and `DOMTest` calls `drain` after `mount`, `dispatch`, `click`, `submit`, and `input`. If your component schedules extra asynchronous work, call `drain` explicitly before asserting:

```ruby
click "button.load"
drain 100

assert_text "Loaded"
```

Keep these tests focused on component behavior. For full browser behavior, navigation across real pages, CSS layout, or APIs that `jsdom` does not implement, use a browser-level system test in Rails instead.

## Running only client tests

Because the integration is a normal Rails test file, you can run just the Funicular wrapper:

```bash
bin/rails test test/funicular/application_test.rb
```

Or narrow the client glob inside that wrapper while developing:

```ruby
result = Funicular::Testing.run!(
  test_glob: "test/funicular/client/login_component_picotest.rb",
  timeout_ms: 10_000
)
```

Change the glob back before committing if you want the full client suite to run in CI.

## Troubleshooting

### `Funicular client tests require jsdom`

Install the dependency that `funicular:install:test` added to `package.json`:

```bash
npm install
```

The Node runner resolves `jsdom` from your Rails app root, so it must be installed in the app, not globally.

### Tests time out

Increase `timeout_ms` in `test/funicular/application_test.rb` while debugging:

```ruby
result = Funicular::Testing.run!(timeout_ms: 20_000)
```

Then look for async work that never settles, callbacks that are waiting for a browser API unavailable in `jsdom`, or a test that forgot to trigger the event the component expects.

### A component works in the browser but not in tests

Check whether the component depends on startup code from `app/funicular/initializer.rb`. The test runner skips initializers by design, so component tests should mount the component directly and pass the props, store state, or model data needed for the behavior under test.

## In the demo

[funicular-demo](https://github.com/hasumikin/funicular-demo) includes a small
client-side component test:

- [`test/funicular/application_test.rb`](https://github.com/hasumikin/funicular-demo/blob/master/test/funicular/application_test.rb) wires the client test runner into `bin/rails test`.
- [`test/funicular/client/login_component_picotest.rb`](https://github.com/hasumikin/funicular-demo/blob/master/test/funicular/client/login_component_picotest.rb) mounts `LoginComponent`, submits the form, and asserts that the validation message appears.
