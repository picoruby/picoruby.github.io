---
title: class Object
keywords: Object
tags: [class]
summary: Object class of PicoRuby
sidebar: picoruby_sidebar
permalink: Object.html
folder: rbs_doc
---
## Instance methods
### <=>

```ruby
instance.<=>(untyped) -> Integer?
```
### ===

```ruby
instance.===(untyped) -> bool
```
### attr_accessor

```ruby
instance.attr_accessor(*Symbol) -> void
```
### attr_reader

```ruby
instance.attr_reader(*Symbol) -> void
```
### block_given?

```ruby
instance.block_given?() -> bool
```
### class

```ruby
instance.class-> class
```
### dup

```ruby
instance.dup() -> self
```
### exit

```ruby
instance.exit(?Integer) -> void
```
### include

```ruby
instance.include(Module) -> void
```
### inspect

```ruby
instance.inspect() -> String
```
### is_a?

```ruby
instance.is_a?(untyped) -> bool
```
### nil?

```ruby
instance.nil?() -> bool
```
### object_id

```ruby
instance.object_id() -> Integer
```
### p

```ruby
instance.p[T < _Inspect] (T arg0) -> T
instance.p(_Inspect arg0, _Inspect arg1, *_Inspect rest) -> Array[_Inspect]
instance.p() -> nil
```
### print

```ruby
instance.print(*_ToS args) -> nil
```
### printf

```ruby
instance.printf() -> nil
instance.printf(String fmt, *untyped args) -> nil
```
### puts

```ruby
instance.puts(*_ToS objects) -> nil
```
### raise

```ruby
instance.raise() -> bot
instance.raise(string message) -> bot
instance.raise(Exception exception, ?String cause) -> bot
instance.raise(_Exception exception, ?String cause) -> bot
```
### sleep

```ruby
instance.sleep(Integer | Float) -> Integer
```
### sleep_ms

```ruby
instance.sleep_ms(Integer) -> Integer
```
### sprintf

```ruby
instance.sprintf(String format, *untyped args) -> String
```
### to_s

```ruby
instance.to_s() -> String
```
## Instance methods (picoruby-require)
### load

```ruby
instance.load(String path) -> bool
```
### require

```ruby
instance.require(String name) -> bool
```
