---
title: module Funicular::FileUpload
keywords: Funicular::FileUpload
tags: [module]
summary: Funicular::FileUpload module of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_FileUpload.html
folder: rbs_doc
---
## Singleton methods
### mount

```ruby
Funicular::FileUpload.mount() -> void
```
### retrieve_file

```ruby
Funicular::FileUpload.retrieve_file(?String storage_key) -> JS::Object?
```
### select_file_with_preview

```ruby
Funicular::FileUpload.select_file_with_preview(String input_id) { (JS::Object? file, String? preview_url) -> void } -> void
```
### store_file

```ruby
Funicular::FileUpload.store_file(String input_id, ?String storage_key) -> JS::Object?
```
### upload_with_formdata

```ruby
Funicular::FileUpload.upload_with_formdata(
      String url,
      ?fields: Hash[untyped, untyped],
      ?file_field: String?,
      ?file: JS::Object?
    ) { (Hash[untyped, untyped] result) -> void } -> void
```
