---
title: class Object
keywords: Object
tags: [class]
summary: Object class of PicoRuby
sidebar: picoruby_sidebar
permalink: Object.html
folder: rbs_doc
---
## Instance methods (picoruby-metaprog)
### __id__

```ruby
instance.__id__() -> Integer
```
### instance_of?

```ruby
instance.instance_of?(Class klass) -> bool
```
### instance_variable_get

```ruby
instance.instance_variable_get(Symbol name) -> Object
```
### instance_variable_set

```ruby
instance.instance_variable_set(Symbol name, Object value) -> Object
```
### instance_variables

```ruby
instance.instance_variables() -> Array[Symbol]
```
### methods

```ruby
instance.methods() -> Array[Symbol]
```
### respond_to?

```ruby
instance.respond_to?(Symbol | String name) -> bool
```
### send

```ruby
instance.send(Symbol | String name, *Object args) -> Object
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
### loop

```ruby
instance.loop() { () -> void }-> void
```
### nil?

```ruby
instance.nil?() -> bool
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
