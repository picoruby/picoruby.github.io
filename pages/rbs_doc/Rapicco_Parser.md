---
title: class Rapicco::Parser
keywords: Rapicco::Parser
tags: [class]
summary: Rapicco::Parser class of PicoRuby
sidebar: picoruby_sidebar
permalink: Rapicco_Parser.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Rapicco::Parser.new(?font: Symbol, ?title_font: Symbol, ?code_font: Symbol, ?bold_color: Symbol) -> void
```
### parse_attrs

```ruby
Rapicco::Parser.parse_attrs(String str) -> Hash[Symbol, String]
```
### parse_inline

```ruby
Rapicco::Parser.parse_inline(String src, Symbol base_color, Symbol bold_color) -> parser_dump_t
```
## Instance methods
### default_font

```ruby
instance.default_font(String | nil str) -> Symbol
```
### dump

```ruby
instance.dump() -> parser_dump_t
```
### parse

```ruby
instance.parse(String raw_line) -> void
```
