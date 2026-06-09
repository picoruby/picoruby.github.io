---
title: class Funicular::Model::Validations::EachValidator
keywords: Funicular::Model::Validations::EachValidator
tags: [class]
summary: Funicular::Model::Validations::EachValidator class of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Model_Validations_EachValidator.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Funicular::Model::Validations::EachValidator.new(attributes: Array[Symbol], **untyped options) -> void
```
## Instance methods
### blank?

```ruby
instance.blank?(untyped value) -> bool
```
### kind

```ruby
instance.kind() -> Symbol
```
### present?

```ruby
instance.present?(untyped value) -> bool
```
### validate

```ruby
instance.validate(untyped record) -> void
```
### validate_each

```ruby
instance.validate_each(untyped record, Symbol attribute, untyped value) -> void
```
## Attr accessors
### attributes (reader)
```ruby
instance.attributes -> Array[Symbol]
```
### options (reader)
```ruby
instance.options -> Hash[Symbol, untyped]
```
