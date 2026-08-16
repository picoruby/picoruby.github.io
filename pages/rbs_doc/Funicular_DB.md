---
title: module Funicular::DB
keywords: Funicular::DB
tags: [module]
summary: Funicular::DB module of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_DB.html
folder: rbs_doc
---
## Singleton methods
### __begin_deferral

```ruby
Funicular::DB.__begin_deferral(Symbol role) -> void
```
### __commit_deferral

```ruby
Funicular::DB.__commit_deferral(Symbol role) -> void
```
### __drain_events

```ruby
Funicular::DB.__drain_events() -> nil
```
### __ensure_local_database_enabled

```ruby
Funicular::DB.__ensure_local_database_enabled(untyped operation) -> bool
```
### __fail_boot

```ruby
Funicular::DB.__fail_boot(Array[untyped] errors) -> bool
```
### __install_visibility_hook

```ruby
Funicular::DB.__install_visibility_hook() -> bool
```
### __latch_page_epoch

```ruby
Funicular::DB.__latch_page_epoch() -> untyped
```
### __model_local_db

```ruby
Funicular::DB.__model_local_db(untyped model) -> GuardedDatabase
```
### __model_replica_db

```ruby
Funicular::DB.__model_replica_db() -> GuardedDatabase?
```
### __page_metadata

```ruby
Funicular::DB.__page_metadata() -> Hash[Symbol, untyped]
```
### __persist_timer_fired

```ruby
Funicular::DB.__persist_timer_fired(Symbol role, Integer? token) -> nil
```
### __persist_timer_token

```ruby
Funicular::DB.__persist_timer_token(Symbol role) -> Integer?
```
### __register_database

```ruby
Funicular::DB.__register_database(Symbol role, untyped raw_db, Array[untyped] models) -> nil
```
### __registered_database

```ruby
Funicular::DB.__registered_database(Symbol role) -> untyped
```
### __report_boot_errors

```ruby
Funicular::DB.__report_boot_errors(Array[untyped] errors) -> bool
```
### __reset_boot

```ruby
Funicular::DB.__reset_boot() -> nil
```
### __reset_config

```ruby
Funicular::DB.__reset_config() -> nil
```
### __rollback_deferral

```ruby
Funicular::DB.__rollback_deferral(Symbol role) -> void
```
### __session_epoch_ok?

```ruby
Funicular::DB.__session_epoch_ok?(String? header) -> bool
```
### __set_boot_state

```ruby
Funicular::DB.__set_boot_state(Symbol state) -> Symbol
```
### __set_durability

```ruby
Funicular::DB.__set_durability(Symbol state) -> Symbol
```
### __set_local_database_enabled

```ruby
Funicular::DB.__set_local_database_enabled(untyped value) -> bool
```
### __set_session_epoch

```ruby
Funicular::DB.__set_session_epoch(untyped value) -> untyped
```
### __set_snapshot_identity

```ruby
Funicular::DB.__set_snapshot_identity(String? identity) -> String?
```
### __set_snapshot_store

```ruby
Funicular::DB.__set_snapshot_store(untyped store) -> untyped
```
### __set_tick_scheduler

```ruby
Funicular::DB.__set_tick_scheduler(Proc? scheduler) -> Proc?
```
### __terminate_session

```ruby
Funicular::DB.__terminate_session(String? header) -> nil
```
### __visibility_flush

```ruby
Funicular::DB.__visibility_flush() -> nil
```
### apply_local_migrations

```ruby
Funicular::DB.apply_local_migrations(untyped db, untyped model) -> Integer
```
### boot

```ruby
Funicular::DB.boot(?models: Array[untyped]?, ?metadata: Hash[Symbol, untyped]?) -> bool
```
### boot_state

```ruby
Funicular::DB.boot_state() -> Symbol
```
### build_replica_tables

```ruby
Funicular::DB.build_replica_tables(untyped db, Array[untyped] models) -> bool
```
### cancel_persist_timers

```ruby
Funicular::DB.cancel_persist_timers() -> nil
```
### canonical_replica_schema

```ruby
Funicular::DB.canonical_replica_schema(Array[untyped] models) -> String
```
### config

```ruby
Funicular::DB.config() -> Config
```
### configure

```ruby
Funicular::DB.configure() { () -> void } -> nil
```
### durability

```ruby
Funicular::DB.durability() -> Symbol
```
### elect_writer

```ruby
Funicular::DB.elect_writer(String lock_name) -> Symbol
```
### enforce_read_only

```ruby
Funicular::DB.enforce_read_only(bool read_only, untyped raw_stmt) -> void
```
### flush

```ruby
Funicular::DB.flush() -> bool
```
### fold_local_columns

```ruby
Funicular::DB.fold_local_columns(untyped model) -> Hash[String, Symbol]
```
### guard_statement_sql

```ruby
Funicular::DB.guard_statement_sql(untyped sql) -> void
```
### local

```ruby
Funicular::DB.local() -> GuardedDatabase
```
### local_database_enabled?

```ruby
Funicular::DB.local_database_enabled?() -> bool
```
### lock_name

```ruby
Funicular::DB.lock_name(String identity) -> String
```
### mutation_generation

```ruby
Funicular::DB.mutation_generation() -> Integer
```
### namespace_identity

```ruby
Funicular::DB.namespace_identity(untyped application_id, untyped user_key, bool anonymous) -> String
```
### notify_changed

```ruby
Funicular::DB.notify_changed(untyped target, ?untyped table) -> nil
```
### open_snapshot_store

```ruby
Funicular::DB.open_snapshot_store() -> untyped
```
### persist_snapshot

```ruby
Funicular::DB.persist_snapshot(Symbol role) -> bool
```
### read_meta

```ruby
Funicular::DB.read_meta(untyped db, String key) -> String?
```
### read_page_metadata

```ruby
Funicular::DB.read_page_metadata() -> Hash[Symbol, untyped]
```
### rebuild_local_table

```ruby
Funicular::DB.rebuild_local_table(untyped db, untyped model, ?Array[TableBuilder]? builders) -> Integer
```
### release_writer_lock

```ruby
Funicular::DB.release_writer_lock() -> bool
```
### replica

```ruby
Funicular::DB.replica() -> GuardedDatabase
```
### replica_delete

```ruby
Funicular::DB.replica_delete(untyped db, untyped model, untyped id) -> bool
```
### replica_table_ddl

```ruby
Funicular::DB.replica_table_ddl(untyped model) -> String
```
### replica_upsert

```ruby
Funicular::DB.replica_upsert(untyped db, untyped model, Hash[untyped, untyped] attrs) -> bool
```
### replica_upsert_all

```ruby
Funicular::DB.replica_upsert_all(untyped db, untyped model, Array[untyped] rows) -> bool
```
### request_persistent_storage

```ruby
Funicular::DB.request_persistent_storage() -> Symbol
```
### reset_local_table

```ruby
Funicular::DB.reset_local_table(untyped model) -> bool
```
### resolve_namespace

```ruby
Funicular::DB.resolve_namespace(application_id: untyped, user_key: untyped, user_key_configured: bool, anonymous_only: bool) -> String
```
### restore_snapshot

```ruby
Funicular::DB.restore_snapshot(Symbol role) -> bool
```
### schema_lockdown

```ruby
Funicular::DB.schema_lockdown() -> untyped
```
### session_epoch

```ruby
Funicular::DB.session_epoch() -> untyped
```
### session_terminated?

```ruby
Funicular::DB.session_terminated?() -> bool
```
### snapshot_key

```ruby
Funicular::DB.snapshot_key(String identity, Symbol role) -> String
```
### snapshot_store

```ruby
Funicular::DB.snapshot_store() -> untyped
```
### stale_generation?

```ruby
Funicular::DB.stale_generation?(Integer token) -> bool
```
### stale_response_error

```ruby
Funicular::DB.stale_response_error() -> Error
```
### store_meta

```ruby
Funicular::DB.store_meta(untyped db, String key, String value) -> void
```
### store_table_version

```ruby
Funicular::DB.store_table_version(untyped db, String table, Integer version) -> void
```
### stored_table_version

```ruby
Funicular::DB.stored_table_version(untyped db, String table) -> Integer
```
### subscribe

```ruby
Funicular::DB.subscribe(Symbol role, untyped table) { (Symbol role, String table) -> void } -> Integer
```
### unsubscribe

```ruby
Funicular::DB.unsubscribe(Integer id) -> nil
```
### validate_identifier

```ruby
Funicular::DB.validate_identifier(untyped name) -> String
```
### validate_role

```ruby
Funicular::DB.validate_role(untyped role) -> Symbol
```
### wipe

```ruby
Funicular::DB.wipe() -> bool
```
