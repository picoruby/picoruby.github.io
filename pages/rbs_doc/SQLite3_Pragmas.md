---
title: module SQLite3::Pragmas
keywords: SQLite3::Pragmas
tags: [module]
summary: SQLite3::Pragmas module of PicoRuby
sidebar: picoruby_sidebar
permalink: SQLite3_Pragmas.html
folder: rbs_doc
---
## Instance methods
### auto_vacuum

```ruby
instance.auto_vacuum() -> Integer
```
### auto_vacuum=

```ruby
instance.auto_vacuum=(Integer | String | Symbol mode) -> untyped
```
### cache_size

```ruby
instance.cache_size() -> Integer
```
### cache_size=

```ruby
instance.cache_size=(Integer size) -> untyped
```
### foreign_keys

```ruby
instance.foreign_keys() -> bool
```
### foreign_keys=

```ruby
instance.foreign_keys=(bool enabled) -> untyped
```
### freelist_count

```ruby
instance.freelist_count() -> Integer
```
### int_pragma

```ruby
instance.int_pragma(String name) -> Integer
```
### integrity_check

```ruby
instance.integrity_check() -> String
```
### journal_mode

```ruby
instance.journal_mode() -> String
```
### journal_mode=

```ruby
instance.journal_mode=(String | Symbol mode) -> untyped
```
### page_size

```ruby
instance.page_size() -> Integer
```
### page_size=

```ruby
instance.page_size=(Integer size) -> untyped
```
### pragma

```ruby
instance.pragma(String name, ?untyped value) -> Array[untyped]
```
### pragma_token

```ruby
instance.pragma_token(untyped value) -> String
```
### pragma_value

```ruby
instance.pragma_value(untyped value) -> String
```
### synchronous

```ruby
instance.synchronous() -> Integer
```
### synchronous=

```ruby
instance.synchronous=(Integer | String | Symbol mode) -> untyped
```
### user_version

```ruby
instance.user_version() -> Integer
```
### user_version=

```ruby
instance.user_version=(Integer version) -> untyped
```
