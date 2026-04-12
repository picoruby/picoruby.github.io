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
### assert_equal

```ruby
instance.assert_equal(untyped expected, untyped actual) -> void
```
### assert_false

```ruby
instance.assert_false(bool result) -> void
```
### assert_in_delta

```ruby
instance.assert_in_delta(Numeric expected, Numeric actual, ?Float delta) -> void
```
### assert_nil

```ruby
instance.assert_nil(untyped obj) -> void
```
### assert_not_equal

```ruby
instance.assert_not_equal(untyped expected, untyped actual) -> void
```
### assert_not_nil

```ruby
instance.assert_not_nil(untyped obj) -> void
```
### assert_raise

```ruby
instance.assert_raise(*(Class | String) exceptions_and_message) { () -> void } -> void
```
### assert_true

```ruby
instance.assert_true(bool result) -> void
```
### clear_doubles

```ruby
instance.clear_doubles() -> void
```
### list_tests

```ruby
instance.list_tests() -> Array[Symbol]
```
### mock

```ruby
instance.mock(untyped doubled_obj) -> Picotest::Double
```
### mock_any_instance_of

```ruby
instance.mock_any_instance_of(Class klass) -> Picotest::Double
```
### mock_methods

```ruby
instance.mock_methods() -> void
```
### mruby?

```ruby
instance.mruby?() -> bool
```
### mrubyc?

```ruby
instance.mrubyc?() -> bool
```
### report_exception

```ruby
instance.report_exception(untyped data) -> void
```
### report_skip

```ruby
instance.report_skip(untyped data) -> void
```
### run_script

```ruby
instance.run_script(String script) -> String
```
### setup

```ruby
instance.setup() -> void
```
### skip

```ruby
instance.skip(?String reason) -> void
```
### stub

```ruby
instance.stub(untyped doubled_obj) -> Picotest::Double
```
### stub_any_instance_of

```ruby
instance.stub_any_instance_of(Class klass) -> Picotest::Double
```
### teardown

```ruby
instance.teardown() -> void
```
