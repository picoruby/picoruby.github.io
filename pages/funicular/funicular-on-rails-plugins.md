---
keywords: documentation
layout: page
tags: [Rails, Funicular, Plugins, Testing]
title: "Funicular on Rails: Plugins"
sidebar: picoruby_sidebar
permalink: funicular-on-rails-plugins
folder: funicular
---

Funicular plugins are ordinary Ruby gems that provide client-side Ruby source for a Rails app. A plugin can package reusable components, stores, models, helpers, and browser assets such as CSS.

There is no plugin generator. A Funicular plugin is intentionally just a gem with a small convention:

- Ruby source lives under `lib/`.
- CSS assets, when needed, live under `assets/`.
- A Rails app opts in by putting the gem in the `:funicular` Bundler group.

## Using a plugin in Rails

Add the plugin gem to a dedicated `:funicular` group:

```ruby
# Gemfile
group :funicular do
  gem "funicular-datepicker"
end
```

During `bin/rails funicular:compile`, Funicular asks Bundler for the gems in that group. Each plugin's `lib/**/*.rb` files are loaded before the Rails app's `app/funicular/**/*.rb` files and compiled into the same `app.mrb`.

That means application code can use plugin constants directly:

```ruby
class SettingsComponent < Funicular::Component
  def render
    component Funicular::Plugins::DatePicker::Component,
              value: state.birthday,
              on_change: ->(value) { patch(birthday: value) }
  end
end
```

For local development, use a path gem:

```ruby
group :funicular do
  gem "funicular-datepicker"
end
```

Run `bundle install` after changing the Gemfile.

## Plugin layout

A small component plugin can look like this:

```
funicular-datepicker/
  funicular-datepicker.gemspec
  lib/
    date_picker.rb
    components/
      date_picker_component.rb
  assets/
    date_picker.css
```

The source order is nested files first, then top-level files. That lets a top-level entry file refer to classes defined below a subdirectory:

```ruby
# lib/date_picker.rb
module Funicular
  module Plugins
    module DatePicker
      Component = DatePickerComponent
    end
  end
end
```

```ruby
# lib/components/date_picker_component.rb
class DatePickerComponent < Funicular::Component
  def render
    div(class: "funicular-date-picker") do
      "Date picker"
    end
  end
end
```

Plugin CSS is copied into the Rails app's asset build directory when Funicular compiles:

```
app/assets/builds/funicular/plugins/funicular_datepicker/date_picker.css
```

Render plugin browser assets from the Rails layout:

```erb
<%= funicular_plugin_include_tags %>
```

## Plugin gemspec

A Funicular plugin does not need `mrbgem.rake`. It is a CRubygem: Ruby source is kept as source, then Funicular compiles it together with the host app.

The gemspec only needs to package the source and assets:

```ruby
# funicular-datepicker.gemspec
Gem::Specification.new do |spec|
  spec.name = "funicular-datepicker"
  spec.version = "0.1.0"
  spec.summary = "Date picker component for Funicular"
  spec.license = "MIT"

  spec.files = Dir[
    "assets/**/*",
    "lib/**/*.rb",
    "README.md"
  ].reject { |path| File.directory?(path) }

  spec.require_paths = ["lib"]
end
```

## Testing a plugin

Plugins can use the same PicoRuby.wasm + picotest runner used by Rails apps.
The plugin does not need a dummy Rails application.

Add Funicular as a test dependency:

```ruby
# Gemfile
source "https://rubygems.org"

group :test do
  gem "funicular"
end
```

Add `jsdom` for the Node.js DOM environment:

```json
{
  "private": true,
  "devDependencies": {
    "jsdom": "^26.1.0"
  }
}
```

Install dependencies:

```bash
bundle install
npm install
```

Use a normal Minitest wrapper to call `Funicular::Testing.run!`:

```ruby
# test/funicular_plugin_test.rb
require_relative "test_helper"

class FunicularPluginTest < Minitest::Test
  def test_picotests
    result = Funicular::Testing.run!(
      app_root: File.expand_path("..", __dir__),
      source_dir: File.expand_path("../lib", __dir__),
      test_glob: "test/**/*_picotest.rb",
      timeout_ms: 10_000
    )
    assert result.success?, result.output
  end
end
```

Then write plugin picotests under `test/`:

```ruby
# test/datepicker_picotest.rb
class DatePickerComponentTest < Funicular::Testing::DOMTest
  def test_calendar_button_opens_panel
    mount Funicular::Plugins::DatePicker::Component, value: "2000-01-02"

    click ".funicular-date-picker__button"
    assert_selector ".funicular-date-picker__panel"
  end
end
```

Run the plugin tests with:

```bash
bundle exec rake test
```

The runner loads the plugin's `lib/**/*.rb` files, then loads
`test/**/*_picotest.rb`, mounts components into a `jsdom` document, and returns
the picotest result to Minitest.

## Notes

- Keep plugin code browser-compatible. It is compiled for PicoRuby.wasm, not executed as normal server-side Ruby.
- Do not put plugin gems in the default Gemfile group unless the Rails server also needs to load them.
- The `:funicular` group is a build-time convention. It tells Funicular which gems should be compiled into the browser bundle.
- Testing a plugin requires a small amount of local setup: `funicular` in the test bundle and `jsdom` in `package.json`. This is documented convention rather than generated scaffolding.

## In the demo

[funicular-demo](https://github.com/hasumikin/funicular-demo) uses a local
datepicker plugin and a local image uploader plugin:

```ruby
group :funicular do
  gem "funicular-datepicker"
  gem "funicular-image-uploader"
end
```

`funicular-image-uploader` demonstrates the recommended shape for upload
plugins. The component handles browser-side file selection, preview, and
FormData upload, while the Rails application owns persistence. The receiving
controller can store bytes directly, attach to Active Storage, or forward the
file to another service as long as it accepts the configured file field and
returns JSON.
