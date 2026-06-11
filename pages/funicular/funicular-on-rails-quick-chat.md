---
keywords: documentation
layout: page
tags: [Rails, Funicular, Generator, Chat]
title: "Funicular on Rails: Quick Chat"
sidebar: picoruby_sidebar
permalink: funicular-on-rails-quick-chat
folder: funicular
---

This page is a quick tutorial for building a small realtime chat application with Funicular on Rails. It is intentionally different from a reference guide: the goal is to give you a working vertical slice first, then let you inspect the generated code and expand it in the direction your own application needs.

## What this generator is

`funicular:chat` is not a universal application generator.

It is a quick tutorial feature. It generates the minimum set of pieces needed for one SPA-shaped example: a realtime chat screen. The generated code crosses the Rails/Funicular boundary on purpose:

- a Rails model and migration for messages
- Rails controllers for the host page and JSON endpoints
- an ActionCable channel
- a Funicular component that loads, renders, and sends messages
- a Funicular route for the chat screen
- a Picotest component test
- a small CSS file that does not depend on Tailwind or another build step

This is a thin, vertical integration. It is not meant to decide the architecture of every Funicular application. It is meant to show how the pieces fit together in a working Rails app.

## Why chat?

Chat is a good first demo because it quickly becomes more than server-rendered HTML. Even a small chat screen needs client-side state, realtime updates, form input, error handling, a scrollable message list, and tests. Those are exactly the places where a Rails application can start to feel like it needs a JavaScript SPA stack.

Funicular gives you another path: keep Rails as the backend and write the interactive client-side surface in Ruby.

This does not mean every chat application should use Funicular. Hotwire and Turbo Streams are still a strong default for many Rails applications. The point of this tutorial is narrower: when one part of your Rails app becomes a stateful client-side application, Funicular lets you keep that part in Ruby too.

## Create a Rails app

Start from a new Rails application:

```bash
rails new funicular_chat_demo
cd funicular_chat_demo
```

Add Funicular to the Gemfile:

```ruby
gem "funicular"
```

Install dependencies:

```bash
bundle install
```

## Install Funicular

Run the Funicular installer:

```bash
bin/rails funicular:install
```

This installs the PicoRuby.wasm runtime, the Rails initializer, debug assets, and the client-side test wrapper. The installer also updates `package.json` with the `jsdom` dependency used by Funicular client tests.

Install the JavaScript test dependency:

```bash
npm install
```

## Generate the chat example

Run:

```bash
bin/rails generate funicular:chat
```

The generator creates a complete but small chat example. You can inspect the generated files before running the app:

```bash
bin/rails routes -g funicular_chat
```

The important files are:

```text
app/funicular/components/funicular_chat_component.rb
app/funicular/initializer.rb
app/controllers/funicular_chat_controller.rb
app/controllers/funicular_chat_messages_controller.rb
app/channels/funicular_chat_channel.rb
app/models/funicular_chat_message.rb
app/views/funicular_chat/show.html.erb
app/assets/stylesheets/funicular_chat.css
test/funicular/client/funicular_chat_component_picotest.rb
```

If your Rails application already has `app/funicular/initializer.rb`, the generator will not edit it automatically. Add this route inside your existing `Funicular.start` block:

```ruby
router.get("/funicular_chat", to: FunicularChatComponent, as: "funicular_chat")
```

## Migrate and compile

Create the messages table:

```bash
bin/rails db:migrate
```

Compile the Funicular Ruby code to `app.mrb`:

```bash
bin/rails funicular:compile
```

Start Rails:

```bash
bin/rails server
```

Open the chat screen:

```text
http://localhost:3000/funicular_chat
```

Open it in two browser windows and send a message. The message is saved by Rails and broadcast through ActionCable. The Funicular component receives the broadcast and patches its local state.

## What to look at

Open `app/funicular/components/funicular_chat_component.rb`.

The component has local state:

```ruby
def initialize_state
  {
    name: "Rails developer",
    body: "",
    messages: [],
    error: nil,
    sending: false,
    connected: false
  }
end
```

When the component mounts, it loads the existing messages and subscribes to ActionCable:

```ruby
def component_mounted
  load_messages
  subscribe
end
```

The Rails endpoint is called from client-side Ruby:

```ruby
Funicular::HTTP.get("/funicular_chat/messages") do |response|
  # ...
end
```

The ActionCable subscription is also created from client-side Ruby:

```ruby
@consumer = Funicular::Cable.create_consumer("/cable")
@subscription = @consumer.subscriptions.create(channel: "FunicularChatChannel") do |message|
  patch(messages: state.messages + [message])
end
```

The important thing is the boundary: Rails owns persistence and broadcasting; Funicular owns the interactive stateful UI.

## Run the test

The generator also creates a client-side component test:

```bash
bin/rails test test/funicular/application_test.rb
```

The test file lives here:

```text
test/funicular/client/funicular_chat_component_picotest.rb
```

It runs inside the normal Rails test command, but the component code being tested is Funicular client-side Ruby.

## Where to go from here

This generator is deliberately small. It gives you a working chat example, but it does not try to become a complete application framework inside the framework.

If you want to go further, treat the generated files as a map:

- copy the shape of the component into your own screen
- replace the message model with your own domain model
- change the ActionCable channel contract
- split the component into smaller components
- add local stores for drafts or preferences
- add server-side rendering only where it makes sense
- replace the CSS with your own design system

In other words: observe what the generator produced, then expand it horizontally for your application.

We do plan to develop more general Funicular generators in the future. The open question is what those generators should cover. Should they generate only components? Routes? Rails endpoints? Stores? Tests? Plugin setup? SSR wiring?

`funicular:chat` is the first experiment. It is intentionally concrete. If this helped you understand Funicular, or if it generated too much or too little, please tell us what coverage you would expect from a more general generator.
