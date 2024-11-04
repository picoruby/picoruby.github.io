---
title: class Picotest::Double
keywords: Picotest::Double
tags: [class]
summary: Picotest::Double class of PicoRuby
sidebar: picoruby_sidebar
permalink: Picotest_Double.html
folder: rbs_doc
---
## Type aliases
### type_t
```ruby
:stub | :mock | :any_instance_of
```
### double_data_t
```ruby
{
      type: type_t,
      any_instance_of: bool,
      doubled_obj_id: Integer,
      method_id: Symbol?,
      return_value: untyped,
      singleton_class_name: String?,
      ?expected_count: Integer,
      ?actual_count: Integer
    }
```
## Singleton methods
### _init

```ruby
Picotest::Double._init(type_t type, untyped untyped, ?any_instance_of: bool) -> Double
```
## Instance methods
### remove_singleton

```ruby
instance.remove_singleton() -> nil
```
## Attr accessors
### double_data (accessor)
```ruby
instance.double_data -> double_data_t
```
### doubled_obj (accessor)
```ruby
instance.doubled_obj -> untyped
```
### singleton_class_name (accessor)
```ruby
instance.singleton_class_name -> String
```
