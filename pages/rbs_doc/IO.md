---
title: class IO
keywords: IO
tags: [class]
summary: IO class of PicoRuby
sidebar: picoruby_sidebar
permalink: IO.html
folder: rbs_doc
---
## Type aliases
### fd_t
```ruby
Integer | IO
```
## Singleton methods
### new

```ruby
IO.new(*Object args) ?{ (untyped) -> untyped } -> IO
```
### open

```ruby
IO.open(*Object args) -> IO
IO.open(*Object args) { (IO) -> untyped } -> untyped
```
### pipe

```ruby
IO.pipe() -> [IO, IO]
IO.pipe{ (IO, IO) -> void } -> untyped
```
### popen

```ruby
IO.popen(String command, ?String mode, ?in: fd_t, ?out: fd_t, ?err: fd_t) -> IO
IO.popen(String command, ?String mode, ?in: fd_t, ?out: fd_t, ?err: fd_t) { (IO) -> untyped } -> untyped
```
### select

```ruby
IO.select(Array[fd_t] readfds, ?Array[fd_t] writefds, ?Array[fd_t] exceptfds, ?Integer timeout) -> ([[IO]] | nil)
```
### sysopen

```ruby
IO.sysopen(String path, ?String mode, ?Integer perm) -> Integer
```
## Instance methods
### <<

```ruby
instance.<<(String input) -> self
```
### close

```ruby
instance.close() -> nil
```
### close_on_exec=

```ruby
instance.close_on_exec=(bool) -> bool
```
### close_on_exec?

```ruby
instance.close_on_exec?() -> bool
```
### close_write

```ruby
instance.close_write() -> nil
```
### closed?

```ruby
instance.closed?() -> bool
```
### each

```ruby
instance.each() ?{ (String) -> void } -> self
```
### each_byte

```ruby
instance.each_byte() ?{ (Integer) -> void } -> self
```
### each_char

```ruby
instance.each_char() ?{ (String) -> void } -> self
```
### eof?

```ruby
instance.eof?() -> bool
```
### fileno

```ruby
instance.fileno() -> Integer
```
### flush

```ruby
instance.flush() -> self
```
### getbyte

```ruby
instance.getbyte() -> (Integer | nil)
```
### getc

```ruby
instance.getc() -> (String | nil)
```
### gets

```ruby
instance.gets(?String rs, ?Integer limit) -> (String | nil)
```
### isatty

```ruby
instance.isatty() -> bool
```
### path=

```ruby
instance.path=(string) -> string
```
### pid

```ruby
instance.pid() -> (Integer | nil)
```
### pos

```ruby
instance.pos() -> Integer
```
### pos=

```ruby
instance.pos=(Integer) -> Integer
```
### pread

```ruby
instance.pread(Integer length, Integer offset, ?String outbuf) -> String
```
### print

```ruby
instance.print(*_ToS args) -> nil
```
### printf

```ruby
instance.printf(*String str) -> nil
```
### puts

```ruby
instance.puts(*_ToS line) -> nil
```
### pwrite

```ruby
instance.pwrite(String input, Integer offset) -> Integer
```
### read

```ruby
instance.read(?(Integer | nil) length, ?String outbuf) -> (String | nil)
```
### readbyte

```ruby
instance.readbyte() -> Integer
```
### readchar

```ruby
instance.readchar() -> String
```
### readline

```ruby
instance.readline(?String sep, ?Integer limit) -> String
```
### readlines

```ruby
instance.readlines(?String sep, ?Integer limit) -> Array[String]
```
### rewind

```ruby
instance.rewind() -> Integer
```
### seek

```ruby
instance.seek(Integer offset, ?Integer whence) -> Integer
```
### sync

```ruby
instance.sync() -> bool
```
### sync=

```ruby
instance.sync=(bool) -> bool
```
### sysread

```ruby
instance.sysread(Integer length, ?String outbuf) -> String
```
### syswrite

```ruby
instance.syswrite(String input) -> Integer
```
### ungetbyte

```ruby
instance.ungetbyte(String | Integer byte) -> nil
```
### ungetc

```ruby
instance.ungetc(String char) -> nil
```
### write

```ruby
instance.write(String input) -> Integer
```
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
IO.wait_terminal(?timeout: Integer|Float|nil) -> bool
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
### read_nonblock

```ruby
instance.read_nonblock(Integer maxlen) -> String
```
