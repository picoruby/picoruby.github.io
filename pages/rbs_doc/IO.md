---
title: IO
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
<<(untyped) -> self
```
### flush

```ruby
flush-> self
```
### getch

```ruby
getch-> String
```
### iflush

```ruby
iflush-> self
```
### noecho

```ruby
noecho() { (untyped) -> untyped } -> untyped
```
### raw

```ruby
raw() { (untyped) -> untyped } -> untyped
```
## Instance methods
### read_nonblock

```ruby
read_nonblock(Integer maxlen) -> String
```
