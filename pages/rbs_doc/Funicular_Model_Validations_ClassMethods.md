---
title: module Funicular::Model::Validations::ClassMethods
keywords: Funicular::Model::Validations::ClassMethods
tags: [module]
summary: Funicular::Model::Validations::ClassMethods module of PicoRuby
sidebar: picoruby_sidebar
permalink: Funicular_Model_Validations_ClassMethods.html
folder: rbs_doc
---
## Instance methods
### add_schema_validator

```ruby
instance.add_schema_validator(Symbol | String attribute, Symbol | String kind, untyped opts) -> void
```
### symbolize_keys

```ruby
instance.symbolize_keys(untyped hash) -> Hash[Symbol, untyped]
```
### validates

```ruby
instance.validates(*Symbol | String attributes, **untyped options) -> void
```
### validator_class_for

```ruby
instance.validator_class_for(Symbol | String key) -> singleton(EachValidator)?
```
### validators

```ruby
instance.validators() -> Array[EachValidator]
```
### validators_on

```ruby
instance.validators_on(Symbol | String attribute) -> Array[EachValidator]
```
