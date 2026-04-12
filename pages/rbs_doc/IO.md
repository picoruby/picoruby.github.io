---
title: class IO
keywords: IO
tags: [class]
summary: IO class of PicoRuby
sidebar: picoruby_sidebar
permalink: IO.html
folder: rbs_doc
---
## Singleton methods
### clear_screen

```ruby
IO.clear_screen() -> nil
```
### get_cursor_position

```ruby
IO.get_cursor_position-> ([Integer, Integer])
```
### wait_terminal

```ruby
IO.wait_terminal(?timeout: Integer|Float) -> String
```
## Instance methods
### cooked

```ruby
instance.cooked() { (IO io) -> untyped } -> untyped
```
### cooked!

```ruby
instance.cooked!() -> self
```
### echo=

```ruby
instance.echo=(bool mode) -> bool
```
### echo?

```ruby
instance.echo?() -> bool
```
### getch

```ruby
instance.getch() -> String
```
### raw

```ruby
instance.raw() { (IO io) -> untyped } -> untyped
```
### raw!

```ruby
instance.raw!() -> self
```
## Type aliases
### fd_t
```ruby
Integer | IO
```
