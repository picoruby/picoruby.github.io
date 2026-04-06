---
keywords: documentation
layout: page
tags: [funicular, SPA, Virtual DOM]
title: Getting Started with Funicular
sidebar: picoruby_sidebar
permalink: funicular
folder: funicular
---

Funicular is a React-inspired SPA framework for PicoRuby.
It lets you build interactive web UIs by writing Ruby — the same Ruby you use on the server, now running in the browser via WebAssembly.

## Live Demo: Tic-Tac-Toe

The app below is ported from the [ReactJS Tic-Tac-Toe tutorial](https://react.dev/learn/tutorial-tic-tac-toe).
The entire UI — components, state management, event handling — is written in PicoRuby and runs in the browser.

<iframe src="/funicular-tic-tac-toe"
        style="width:100%; height:260px; border:1px solid #ddd; border-radius:4px;"
        title="Tic-Tac-Toe Funicular Demo">
</iframe>

---

## Full Source Code

```ruby
def calculate_winner(squares)
  lines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ]
  lines.each do |line|
    a, b, c = line
    if squares[a] && squares[a] == squares[b] && squares[a] == squares[c]
      return squares[a]
    end
  end
  nil
end

class Square < Funicular::Component
  def handle_click(event)
    event.preventDefault
    on_click = props[:on_click]
    on_click.call if on_click
  end

  def render
    button(class: 'square', onclick: :handle_click) do
      props[:value] || ''
    end
  end
end

class Board < Funicular::Component
  def handle_click(i)
    -> {
      squares = props[:squares]
      return if calculate_winner(squares) || squares[i]
      on_play = props[:on_play]
      on_play.call(i) if on_play
    }
  end

  def render
    squares = props[:squares]
    x_is_next = props[:x_is_next]

    winner = calculate_winner(squares)
    status = if winner
      "Winner: #{winner}"
    else
      "Next player: #{x_is_next ? 'X' : 'O'}"
    end

    div do
      div(class: 'status') { status }
      div(class: 'board-row') do
        component(Square, value: squares[0], on_click: handle_click(0))
        component(Square, value: squares[1], on_click: handle_click(1))
        component(Square, value: squares[2], on_click: handle_click(2))
      end
      div(class: 'board-row') do
        component(Square, value: squares[3], on_click: handle_click(3))
        component(Square, value: squares[4], on_click: handle_click(4))
        component(Square, value: squares[5], on_click: handle_click(5))
      end
      div(class: 'board-row') do
        component(Square, value: squares[6], on_click: handle_click(6))
        component(Square, value: squares[7], on_click: handle_click(7))
        component(Square, value: squares[8], on_click: handle_click(8))
      end
    end
  end
end

class Game < Funicular::Component
  def initialize_state
    {
      history: [Array.new(9, nil)],
      current_move: 0
    }
  end

  def handle_play(i)
    history = state.history
    current_move = state.current_move
    current_squares = history[current_move].dup

    current_squares[i] = (current_move % 2 == 0) ? 'X' : 'O'

    next_history = history[0..current_move] + [current_squares]
    patch(
      history: next_history,
      current_move: next_history.length - 1
    )
  end

  def jump_to(move)
    -> {
      patch(current_move: move)
    }
  end

  def render
    history = state.history
    current_move = state.current_move
    x_is_next = (current_move % 2 == 0)
    current_squares = history[current_move]

    div(class: 'game') do
      div(class: 'game-board') do
        component(Board,
          x_is_next: x_is_next,
          squares: current_squares,
          on_play: ->(i) { handle_play(i) }
        )
      end
      div(class: 'game-info') do
        ol do
          history.each_with_index do |_squares, move|
            description = if move > 0
              "Go to move ##{move}"
            else
              'Go to game start'
            end
            li(key: move) do
              button(onclick: jump_to(move)) { description }
            end
          end
        end
      end
    end
  end
end

Funicular.start(Game, container: 'app')
```

---

## How It Works

### 0. Loading the Runtime

Funicular is **bundled into PicoRuby.wasm by default** — no extra installation is required.
Add a single `<script>` tag at the end of your `<body>` to load the runtime:

```html
<script src="https://cdn.jsdelivr.net/npm/@picoruby/wasm-wasi@3.4.4/dist/init.iife.js"></script>
```

This script processes any `<script type="text/ruby">` blocks on the page and executes them with PicoRuby inside WebAssembly.
Because Funicular is part of the standard PicoRuby.wasm build, `Funicular::Component` and `Funicular.start` are available immediately in your Ruby code.

### 1. Components

Every UI piece is a class that inherits `Funicular::Component`.
The `render` method describes what the component should display, using a Ruby DSL for HTML elements.

```ruby
class Square < Funicular::Component
  def render
    button(class: 'square', onclick: :handle_click) do
      props[:value] || ''
    end
  end
end
```

HTML tags like `div`, `button`, `ol`, `li` are available as methods.
Passing a block to them sets their children.

### 2. Props

Data is passed into a component as keyword arguments and read via `props[:key]`.

```ruby
# Passing props when embedding a child component:
component(Square, value: squares[0], on_click: handle_click(0))

# Reading props inside the component:
props[:value]
props[:on_click]
```

### 3. State

State is internal, mutable data owned by a component.
Initialize it by defining `initialize_state`, which returns a Hash.
Read it via `state.key` (dot notation).

```ruby
def initialize_state
  {
    history: [Array.new(9, nil)],
    current_move: 0
  }
end

# Reading state:
state.history
state.current_move
```

### 4. Updating State with `patch`

Call `patch` with a Hash of keys to update.
Funicular re-renders the component (and its children) automatically.

```ruby
patch(
  history: next_history,
  current_move: next_history.length - 1
)
```

### 5. Event Handlers

Pass a method name as a Symbol to wire up a DOM event handler.
The method receives the browser event object.

```ruby
def handle_click(event)
  event.preventDefault
  on_click = props[:on_click]
  on_click.call if on_click
end

def render
  button(onclick: :handle_click) { 'Click me' }
end
```

You can also pass a **lambda** as the event handler.
This is useful when you need to capture a value at render time:

```ruby
def handle_click(i)
  -> {
    # `i` is captured from the outer scope
    props[:on_play].call(i)
  }
end

component(Square, on_click: handle_click(0))
```

### 6. Mounting the App

Call `Funicular.start` with the root component class and the ID of the container element.

```html
<div id="app"><!-- App will be mounted here --></div>

<script type="text/ruby">
  # Write the Ruby code
</script>
<script src="https://cdn.jsdelivr.net/npm/@picoruby/wasm-wasi@3.4.4/dist/init.iife.js"></script>
```

The `<script type="text/ruby">` block is picked up and executed by the PicoRuby WASM runtime loaded by `init.iife.js`.

---

**Tip:**

Instead of writing Ruby code between `<script>`, you can load `.rb` files from remote resources as follows:

```html
<script type="text/ruby" src="app.rb"></script>
<script src="https://cdn.jsdelivr.net/npm/@picoruby/wasm-wasi@3.4.4/dist/init.iife.js"></script>
```

Also, especially if your app code is big, loading `.mrb` file precompiled by picorbc is preferable:

```html
<script type="application/x-mrb" src="precompiled_app.mrb"></script>
<script src="https://cdn.jsdelivr.net/npm/@picoruby/wasm-wasi@3.4.4/dist/init.iife.js"></script>
```
---

## Learn More

For the full API reference, routing, server communication via ActionCable, and Rails integration, see the Funicular repository:

[https://github.com/picoruby/funicular](https://github.com/picoruby/funicular)
