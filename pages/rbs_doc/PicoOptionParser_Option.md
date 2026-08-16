---
title: class PicoOptionParser::Option
keywords: PicoOptionParser::Option
tags: [class]
summary: PicoOptionParser::Option class of PicoRuby
sidebar: picoruby_sidebar
permalink: PicoOptionParser_Option.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
PicoOptionParser::Option.new(Symbol key, Array[String] names, PicoOptionParser::opt_type type, Array[untyped]? choices, untyped default, String? desc, bool help, bool negate) -> void
```
## Attr accessors
### key (reader)
```ruby
instance.key -> Symbol
```
### names (reader)
```ruby
instance.names -> Array[String]
```
### type (reader)
```ruby
instance.type -> PicoOptionParser::opt_type
```
### choices (reader)
```ruby
instance.choices -> Array[untyped]?
```
### default (reader)
```ruby
instance.default -> untyped
```
### desc (reader)
```ruby
instance.desc -> String?
```
### help (reader)
```ruby
instance.help -> bool
```
### negate (reader)
```ruby
instance.negate -> bool
```
