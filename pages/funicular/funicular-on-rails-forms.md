---
keywords: documentation
layout: page
tags: [Rails, Funicular]
title: "Funicular on Rails: Forms & Validation"
sidebar: picoruby_sidebar
permalink: funicular-on-rails-forms
folder: funicular
---

Funicular brings Rails-style `form_for` to the browser, with two-way binding and automatic inline error display. Pair it with `Funicular::Model` validations and your forms can validate **in the browser** with no server round-trip --- and reuse the very `validates` rules you already declared on your ActiveRecord models.

Forms live in `app/funicular/components/`; models in `app/funicular/models/` (see [Setup](/funicular-on-rails)).

## Tutorial: a signup form

`form_for(:user, ...)` binds to `state.user` and yields a builder. Field helpers mirror Rails:

```ruby
# app/funicular/components/signup_component.rb
class SignupComponent < Funicular::Component
  def initialize_state
    { user: { username: "", email: "", password: "" }, errors: {} }
  end

  def handle_submit(form_data)
    User.create(form_data) do |user, errors|
      if errors
        patch(errors: errors)
      else
        Funicular.router.navigate('/welcome')
      end
    end
  end

  def render
    form_for(:user, on_submit: :handle_submit) do |f|
      f.label(:username)
      f.text_field(:username, autofocus: true)

      f.label(:email)
      f.email_field(:email)

      f.label(:password)
      f.password_field(:password)

      f.submit("Sign Up")
    end
  end
end
```

Three things happen for free:

- **Two-way binding.** Field values track `state.user`; typing updates the model.
- **No `preventDefault`.** `form_for` already cancels the native submit; your `on_submit` handler receives the form data hash (here, `state.user`).
- **Inline errors.** When `state.errors` has a key matching a field, `form_for` renders the message under that field and adds an error class to the input. So `patch(errors: ...)` is all you need to show errors.

## Validating in the browser

A `Funicular::Model` validates itself client-side using an ActiveModel-style API:

```ruby
# app/funicular/models/user.rb
class User < Funicular::Model
  validates :username, presence: true, length: { maximum: 30 }
  validates :email, presence: true
end
```

`valid?` runs the validators and fills `errors`; `invalid?` is its inverse.
`Model.create` and `Model#update` validate first and behave like `ActiveRecord#save`: when the instance is invalid they **skip the HTTP request** and hand the errors to your callback, so the form shows them with no network trip:

```ruby
user.update(display_name: name) do |success, result|
  if success
    # saved
  elsif result.respond_to?(:messages)
    patch(errors: result.messages)            # client-side validation errors
  else
    patch(message: "Error: #{result}")        # server error (e.g. 422)
  end
end
```

The server still validates and may return 422 --- client validation is an additive pre-flight layer, not a replacement.

### Reusing ActiveRecord validations

Rather than restate your server rules on the client, derive them. On the server, `Funicular::Schema.build` introspects an AR model's `validators_on` and emits the rules inline with each attribute; the client's `load_schema` turns them into client validators:

```ruby
# app/controllers/api/schema_controller.rb (Rails side)
class Api::SchemaController < ApplicationController
  def user
    render json: Funicular::Schema.build(
      User,
      attributes: {
        "display_name" => { type: "string", readonly: false },
        "username"     => { type: "string", readonly: true }
      },
      endpoints: { "update" => { method: "PATCH", path: "/users/:id" } },
      except: { username: [:format] }
    )
  end
end
```

The exposure is an allowlist: validations are derived only for attributes you declare, and `except:` suppresses specific kinds. Rules that cannot run in the browser are skipped automatically --- `uniqueness` (database-only), custom validators, and conditional/context validators (`if:`, `unless:`, `on:`).
Client-declared and schema-derived validators merge; if both define the same kind for an attribute, the client declaration wins.

Load schemas at startup before mounting the app:

```ruby
# app/funicular/initializer.rb
Funicular.load_schemas({ User => "user", Comment => "comment" }) do
  Funicular.start(container: 'app') { |router| ... }
end
```

### The `format` regexp caveat

On the client, `Regexp` wraps JavaScript's `RegExp`, not Ruby's Onigmo. Write `format` patterns in JavaScript syntax: use `^...$` instead of `\A...\z`, and avoid `/x` mode, POSIX classes (`[[:alpha:]]`), and `\h`/`\H`. When deriving a `format` validator from ActiveRecord, the schema builder translates common anchors and carries `i`/`m` flags but skips (with a warning) any pattern JavaScript cannot accept --- so `format` is the prime candidate for `except:`, declared directly on the `Funicular::Model` in JS-compatible syntax instead.

## Reference

### Available validators

`presence`, `absence`, `length` (`minimum`/`maximum`/`is`/`in`), `format` (`with:`/`without:`), `numericality` (`only_integer`, `greater_than`, `less_than`, `equal_to`, ...), `inclusion` (`in:`), `exclusion` (`in:`), `acceptance`, `confirmation`. The shared options `allow_nil` and `allow_blank` apply to every validator in a `validates` call. `errors[:attr]` returns an array of messages; `errors.messages` returns the `{ attribute => [messages] }` hash; `errors.full_messages` returns human-readable strings.

### Field helpers

```ruby
f.text_field(:username)
f.password_field(:password)
f.email_field(:email)
f.number_field(:age, min: 0, max: 120)
f.textarea(:bio, rows: 5)
f.checkbox(:agree_to_terms)
f.select(:country, ["USA", "Canada", "UK", "Japan"], prompt: "Select country")
f.select(:role, [["Administrator", "admin"], ["Editor", "editor"]])  # [label, value]
f.file_field(:avatar, accept: "image/*")
f.label(:username)                 # auto "Username"
f.label(:email) { "Email Address" } # custom text
f.submit("Save", disabled: state.is_submitting)
```

Boolean attributes (`autofocus`, `disabled`, `checked`, `readonly`, `required`, `multiple`) accept `true`/`false`.

### Nested fields

Use dot notation for nested model data; nested errors use the same keys:

```ruby
f.text_field("profile.bio")
f.select("settings.theme", ["light", "dark"])
# errors: { "profile.bio": "Bio is too long", name: "Name is required" }
```

### Error styling

By default, error messages use the gem's semantic classes `funicular-error` (message) and `funicular-field-error` (input). **The gem ships and injects the CSS for these**: `picoruby_include_tag` writes a small `<style>` block, so error highlighting works out of the box with no CSS-framework setup.
This matters because a tool like Tailwind only scans your own sources and never sees class names emitted from inside the gem. Pass `picoruby_include_tag(base_styles: false)` to provide the styles yourself.

Override the classes globally or per form --- but if you use utility classes, make sure your build actually generates them (class names under `app/funicular/` are scanned by Tailwind):

```ruby
# global, in app/funicular/initializer.rb
Funicular.configure_forms do |config|
  config[:error_class] = "text-red-600 text-sm mt-1"
  config[:field_error_class] = "border-red-500 border-2"
end

# per form
form_for(:user, on_submit: :handle_submit,
         error_class: "error-text", field_error_class: "error-border") do |f|
  ...
end
```

### Submit-button state

Disable while submitting:

```ruby
def handle_submit(form_data)
  patch(is_submitting: true)
  User.create(form_data) { |_user, errors| patch(is_submitting: false, errors: errors || {}) }
end

f.submit(state.is_submitting ? "Submitting..." : "Submit", disabled: state.is_submitting)
```

File fields integrate with `Funicular::FileUpload`; see
[Data Fetching](/funicular-on-rails-data) and
[Styling & Advanced](/funicular-on-rails-styling).

## In the demo

[funicular-demo](https://github.com/hasumikin/funicular-demo):

- [`login_component.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/components/login_component.rb) is a minimal `form_for` with error display.
- [`blog_post_component.rb`](https://github.com/hasumikin/funicular-demo/blob/master/app/funicular/components/blog_post_component.rb) posts a comment and renders validation errors inline.
- [`models/`](https://github.com/hasumikin/funicular-demo/tree/master/app/funicular/models) declares the `Funicular::Model` classes, and the app's `Api::SchemaController` derives validations from the matching ActiveRecord models.
