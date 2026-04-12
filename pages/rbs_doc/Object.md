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
### alias_method

```ruby
instance.alias_method(Symbol|String new_name, Symbol|String old_name) -> Symbol
```
### class?

```ruby
instance.class?() -> bool
```
### const_defined?

```ruby
instance.const_defined?(Symbol | String name) -> bool
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
instance.instance_variable_get(Symbol | String name) -> untyped
```
### instance_variable_set

```ruby
instance.instance_variable_set(Symbol | String name, untyped value) -> untyped
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
### relinquish

```ruby
instance.relinquish() -> bool
```
### sleep

```ruby
instance.sleep(Integer | Float) -> Integer
```
### sleep_ms

```ruby
instance.sleep_ms(Integer) -> Integer
```
## Instance methods
### open

```ruby
instance.open[T] (String file, ?String mode) { (IO) -> T } -> T
instance.open(String file, ?String mode) -> (IO | nil)
```
## Instance methods
### exit

```ruby
instance.exit(?Integer) -> void
```
### loop

```ruby
instance.loop() { () -> void } -> void
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
