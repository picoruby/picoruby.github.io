---
title: class IndexedDB::Store
keywords: IndexedDB::Store
tags: [class]
summary: IndexedDB::Store class of PicoRuby
sidebar: picoruby_sidebar
permalink: IndexedDB_Store.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
IndexedDB::Store.new(Database database, String name, ?js_store: untyped, ?upgrading: bool) -> void
```
## Instance methods
### await_request

```ruby
instance.await_request(untyped req) -> untyped
```
### clear

```ruby
instance.clear() -> nil
```
### count

```ruby
instance.count(?untyped? key_or_range) -> Integer
```
### create_index

```ruby
instance.create_index(String index_name, String key_path, ?unique: bool, ?multi_entry: bool) -> nil
```
### delete

```ruby
instance.delete(untyped key) -> nil
```
### delete_index

```ruby
instance.delete_index(String index_name) -> nil
```
### each

```ruby
instance.each(?untyped? range, ?direction: Symbol) ?{ ([untyped, untyped]) -> void } -> (Enumerator[[untyped, untyped], void] | void)
```
### get

```ruby
instance.get(untyped key) -> untyped
```
### index

```ruby
instance.index(String index_name) -> Index
```
### index_names

```ruby
instance.index_names() -> Array[String]
```
### js_array_to_ruby

```ruby
instance.js_array_to_ruby(untyped js_arr) -> Array[untyped]
```
### js_to_ruby

```ruby
instance.js_to_ruby(untyped js_val) -> untyped
```
### keys

```ruby
instance.keys(?untyped? range) -> Array[untyped]
```
### put

```ruby
instance.put(untyped value, ?key: untyped?) -> untyped
```
### to_a

```ruby
instance.to_a(?untyped? range) -> Array[untyped]
```
### to_js_key

```ruby
instance.to_js_key(untyped key) -> untyped
```
### with_readonly_store

```ruby
instance.with_readonly_store[T] () { (untyped) -> T } -> T
```
## Attr accessors
### name (reader)
```ruby
instance.name -> String
```
