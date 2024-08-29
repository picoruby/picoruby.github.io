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
### cooked!

```ruby
IO.cooked!-> self
```
### get_cursor_position

```ruby
IO.get_cursor_position-> ([Integer, Integer])
```
### get_nonblock

```ruby
IO.get_nonblock(Integer) -> String?
```
### getc

```ruby
IO.getc-> String?
```
### getch

```ruby
IO.getch-> String
```
### raw

```ruby
IO.raw() { () -> untyped } -> untyped
```
### raw!

```ruby
IO.raw!-> self
```
### read_nonblock

```ruby
IO.read_nonblock(Integer) -> String
```
### wait_terminal

```ruby
IO.wait_terminal(?timeout: Integer|Float|nil) -> bool
```
## Instance methods
### <<

```ruby
instance.<<(untyped) -> self
```
### flush

```ruby
instance.flush-> self
```
### getch

```ruby
instance.getch-> String
```
### iflush

```ruby
instance.iflush-> self
```
### noecho

```ruby
instance.noecho() { (untyped) -> untyped } -> untyped
```
### raw

```ruby
instance.raw() { (untyped) -> untyped } -> untyped
```
## Instance methods
### read_nonblock

```ruby
instance.read_nonblock(Integer maxlen) -> String
```
