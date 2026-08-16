---
title: class Funicular::Model
keywords: Funicular::Model
tags: [class]
summary: Funicular::Model class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Model.html
folder: rbs_doc
---
## Include
[Validations](Validations.html)
## Singleton methods
### __assert_association_name_free

```ruby
Funicular::Model.__assert_association_name_free(Symbol key) -> nil
```
### __assert_no_association_conflict

```ruby
Funicular::Model.__assert_no_association_conflict(Array[String] names) -> nil
```
### __association_target

```ruby
Funicular::Model.__association_target(Symbol key, String class_name) -> untyped
```
### __associations

```ruby
Funicular::Model.__associations() -> Hash[Symbol, Hash[Symbol, untyped]]
```
### __camelize

```ruby
Funicular::Model.__camelize(String name) -> String
```
### __pluralize

```ruby
Funicular::Model.__pluralize(String name) -> String
```
### __register_association

```ruby
Funicular::Model.__register_association(Symbol key) -> nil
```
### __register_model

```ruby
Funicular::Model.__register_model(untyped subclass) -> nil
```
### __registered_models

```ruby
Funicular::Model.__registered_models() -> Array[untyped]
```
### __reject_association_options

```ruby
Funicular::Model.__reject_association_options(Symbol kind, Symbol | String name, Hash[Symbol, untyped] rest) -> nil
```
### __resolve_association_constant

```ruby
Funicular::Model.__resolve_association_constant(Symbol key, String class_name) -> untyped
```
### __singularize

```ruby
Funicular::Model.__singularize(String name) -> String
```
### __unresolvable_association

```ruby
Funicular::Model.__unresolvable_association(Symbol key, String class_name) -> String
```
### __write_through_delete

```ruby
Funicular::Model.__write_through_delete(untyped id) -> void
```
### __write_through_upsert

```ruby
Funicular::Model.__write_through_upsert(untyped attrs) -> void
```
### __write_through_upsert_all

```ruby
Funicular::Model.__write_through_upsert_all(untyped rows) -> void
```
### all

```ruby
Funicular::Model.all(?Hash[untyped, untyped] params) ?{ (Array[Model]? instances, untyped error) -> void } -> untyped
```
### belongs_to

```ruby
Funicular::Model.belongs_to(Symbol | String name, ?class_name: (String | Symbol)?, ?foreign_key: (String | Symbol)?, **untyped rest) -> nil
```
### build_from_local

```ruby
Funicular::Model.build_from_local(Hash[untyped, untyped] attrs) -> Model
```
### count

```ruby
Funicular::Model.count() -> Integer
```
### create

```ruby
Funicular::Model.create(?Hash[untyped, untyped] attrs, **untyped kw) ?{ (Model? instance, untyped error) -> void } -> untyped
```
### define_local_accessor

```ruby
Funicular::Model.define_local_accessor(String name, Array[Symbol] existing) -> void
```
### define_local_accessors

```ruby
Funicular::Model.define_local_accessors(Hash[String, Symbol] columns) -> void
```
### delete_all

```ruby
Funicular::Model.delete_all() -> Integer
```
### demodulized_snake_name

```ruby
Funicular::Model.demodulized_snake_name() -> String
```
### derive_replica_columns

```ruby
Funicular::Model.derive_replica_columns() -> Hash[String, Symbol]
```
### derive_table_name

```ruby
Funicular::Model.derive_table_name() -> String
```
### destroy

```ruby
Funicular::Model.destroy(?untyped id) ?{ (bool? success, untyped error) -> void } -> untyped
```
### endpoints

```ruby
Funicular::Model.endpoints() -> Hash[String, Hash[String, String]]
```
### endpoints=

```ruby
Funicular::Model.endpoints=(Hash[String, Hash[String, String]] endpoints) -> Hash[String, Hash[String, String]]
```
### ephemeral?

```ruby
Funicular::Model.ephemeral?() -> bool
```
### exists?

```ruby
Funicular::Model.exists?() -> bool
```
### find

```ruby
Funicular::Model.find(?untyped id, ?endpoint_name: String, ?model_class: singleton(Model)) ?{ (Model? instance, untyped error) -> void } -> untyped
```
### find_by

```ruby
Funicular::Model.find_by(Hash[untyped, untyped] conditions) -> untyped
```
### first

```ruby
Funicular::Model.first() -> untyped
```
### has_many

```ruby
Funicular::Model.has_many(Symbol | String name, ?class_name: (String | Symbol)?, ?foreign_key: (String | Symbol)?, **untyped rest) -> nil
```
### inherited

```ruby
Funicular::Model.inherited(untyped subclass) -> void
```
### new

```ruby
Funicular::Model.new(?Hash[untyped, untyped] attributes) -> void
```
### limit

```ruby
Funicular::Model.limit(Integer? n) -> Relation
```
### load_schema

```ruby
Funicular::Model.load_schema(Hash[String, untyped] schema_data) -> void
```
### local

```ruby
Funicular::Model.local() -> Relation
```
### local?

```ruby
Funicular::Model.local?() -> bool
```
### local_columns

```ruby
Funicular::Model.local_columns() -> Hash[String, Symbol]
```
### local_create

```ruby
Funicular::Model.local_create(?Hash[untyped, untyped] attrs) -> Model
```
### local_db

```ruby
Funicular::Model.local_db() -> untyped
```
### local_migrations

```ruby
Funicular::Model.local_migrations() -> Array[Hash[Symbol, untyped]]?
```
### local_query

```ruby
Funicular::Model.local_query(String method_name) -> Relation
```
### local_table_changed

```ruby
Funicular::Model.local_table_changed() -> void
```
### merge_keyword_attrs

```ruby
Funicular::Model.merge_keyword_attrs(Hash[untyped, untyped] attrs, Hash[Symbol, untyped] kw) -> Hash[untyped, untyped]
```
### migrate

```ruby
Funicular::Model.migrate(Integer version, ?reset: bool) { (untyped t) -> void } -> void
```
### normalize_validation_options

```ruby
Funicular::Model.normalize_validation_options(Symbol | String kind, untyped opts) -> untyped
```
### off_change

```ruby
Funicular::Model.off_change(Integer subscription) -> nil
```
### offset

```ruby
Funicular::Model.offset(Integer? n) -> Relation
```
### on_change

```ruby
Funicular::Model.on_change() { (Symbol role, String table) -> void } -> Integer
```
### order

```ruby
Funicular::Model.order(*untyped args) -> Relation
```
### refresh

```ruby
Funicular::Model.refresh(Symbol mode) -> Symbol
```
### refresh_mode

```ruby
Funicular::Model.refresh_mode() -> Symbol
```
### register_schema_validations

```ruby
Funicular::Model.register_schema_validations(untyped validations) -> void
```
### replica?

```ruby
Funicular::Model.replica?() -> bool
```
### replica_db

```ruby
Funicular::Model.replica_db() -> untyped
```
### reset_local

```ruby
Funicular::Model.reset_local() -> bool
```
### rest_attribute_type

```ruby
Funicular::Model.rest_attribute_type(String name) -> Symbol?
```
### schema

```ruby
Funicular::Model.schema() -> Hash[String, Hash[String, untyped]]
```
### schema=

```ruby
Funicular::Model.schema=(Hash[String, Hash[String, untyped]] schema) -> Hash[String, Hash[String, untyped]]
```
### storage

```ruby
Funicular::Model.storage(Symbol kind) ?{ () -> void } -> Symbol
```
### storage_kind

```ruby
Funicular::Model.storage_kind() -> Symbol
```
### table_name

```ruby
Funicular::Model.table_name(?(String | Symbol)? explicit) -> String
```
### validate_local_migrations

```ruby
Funicular::Model.validate_local_migrations() -> void
```
### where

```ruby
Funicular::Model.where(?Hash[untyped, untyped] | String | nil conditions, *untyped binds) -> Relation
```
## Instance methods
### __hydrate_local

```ruby
instance.__hydrate_local(Hash[untyped, untyped] attrs) -> void
```
### __local_destroy

```ruby
instance.__local_destroy() -> bool
```
### __local_insert

```ruby
instance.__local_insert() -> Model
```
### __local_update

```ruby
instance.__local_update(Hash[untyped, untyped]? attrs) -> bool
```
### __set_local_baseline

```ruby
instance.__set_local_baseline(Hash[untyped, untyped] attrs) -> void
```
### __sync_from_row

```ruby
instance.__sync_from_row() -> void
```
### __track_local_change

```ruby
instance.__track_local_change(String name, untyped value, untyped old) -> void
```
### destroy

```ruby
instance.destroy() ?{ (bool? success, untyped error) -> void } -> untyped
```
### new_record?

```ruby
instance.new_record?() -> bool
```
### reload

```ruby
instance.reload() ?{ (Model? instance, untyped error) -> void } -> untyped
```
### update

```ruby
instance.update(?Hash[untyped, untyped]? attrs) ?{ (Model? instance, untyped error) -> void } -> untyped
```
## Attr accessors
### id (reader)
```ruby
instance.id -> untyped
```
