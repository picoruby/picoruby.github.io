---
title: class Object
keywords: Object
tags: [class]
summary: Object class of PicoRuby
sidebar: picoruby_sidebar
permalink: Object.html
folder: rbs_doc
---
## Include
[Kernel](Kernel.html)
## Singleton methods (picoruby-metaprog)
### ancestors

```ruby
Object.ancestors() -> Array[Class]
```
## Instance methods (picoruby-metaprog)
### __id__

```ruby
instance.__id__() -> Integer
```
### class?

```ruby
instance.class?() -> bool
```
### const_get

```ruby
instance.const_get(Symbol name) -> untyped
```
### instance_eval

```ruby
instance.instance_eval() { (self) -> untyped } -> Object
```
### instance_of?

```ruby
instance.instance_of?(Class klass) -> bool
```
### instance_variable_get

```ruby
instance.instance_variable_get(Symbol name) -> untyped
```
### instance_variable_set

```ruby
instance.instance_variable_set(Symbol name, untyped value) -> untyped
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
instance.send(Symbol | String name, *untyped args) -> untyped
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
### private

```ruby
instance.private(?Symbol) -> void
```
### raise

```ruby
instance.raise() -> bot
instance.raise(string message) -> bot
instance.raise(Exception exception, ?String cause) -> bot
instance.raise(_Exception exception, ?String cause) -> bot
```
### relinquish

```ruby
instance.relinquish-> bool
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
