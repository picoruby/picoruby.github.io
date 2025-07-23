---
title: class Picotest::Test
keywords: Picotest::Test
tags: [class]
summary: Picotest::Test class of PicoRuby
sidebar: picoruby_sidebar
permalink: Picotest_Test.html
folder: rbs_doc
---
## Singleton methods
### description

```ruby
Picotest::Test.description(String description) -> void
```
## Instance methods
### assert

```ruby
instance.assert(bool result) -> void
```
### assert_delta

```ruby
instance.assert_delta(Integer | Float expected, Integer | Float actual, ?Float delta) -> void
```
### assert_equal

```ruby
instance.assert_equal(untyped expected, untyped actual) -> void
```
### assert_false

```ruby
instance.assert_false(bool result) -> void
```
### assert_nil

```ruby
instance.assert_nil(untyped obj) -> void
```
### assert_not_equal

```ruby
instance.assert_not_equal(untyped expected, untyped actual) -> void
```
### assert_raise

```ruby
instance.assert_raise(*(Class | String) exceptions_and_message) { () -> void } -> void
```
### assert_true

```ruby
instance.assert_true(bool result) -> void
```
### list_tests

```ruby
instance.list_tests() -> Array[Symbol]
```
### report_exeption

```ruby
instance.report_exeption(untyped data) -> void
```
### setup

```ruby
instance.setup() -> void
```
### teardown

```ruby
instance.teardown() -> void
```
