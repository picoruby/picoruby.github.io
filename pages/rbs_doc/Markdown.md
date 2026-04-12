---
title: class Markdown
keywords: Markdown
tags: [class]
summary: Markdown class of PicoRuby
sidebar: picoruby_sidebar
permalink: Markdown.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Markdown.new(String text) -> void
```
## Instance methods
### count_leading_spaces

```ruby
instance.count_leading_spaces(String line) -> Integer
```
### escape_html

```ruby
instance.escape_html(String text) -> String
```
### gsub_with_pairing

```ruby
instance.gsub_with_pairing(String line, String marker, String open_tag, String close_tag, ?(Symbol | bool) process_content) -> String
```
### horizontal_rule?

```ruby
instance.horizontal_rule?(String line) -> bool
```
### ordered_list_item?

```ruby
instance.ordered_list_item?(String line) -> bool
```
### process_inline_formats

```ruby
instance.process_inline_formats(String line) -> String
```
### process_list

```ruby
instance.process_list(Integer start_index, Symbol type, ?Integer base_indent) -> [String, Integer]
```
### protect_html_tags

```ruby
instance.protect_html_tags(String line) -> [String, Array[String]]
```
### replace_footnote_references

```ruby
instance.replace_footnote_references(String line) -> String
```
### replace_links_and_images

```ruby
instance.replace_links_and_images(String line) -> String
```
### restore_html_tags

```ruby
instance.restore_html_tags(String line, Array[String] protected_tags) -> String
```
### to_html

```ruby
instance.to_html() -> String
```
## Attr accessors
### front_matter (reader)
```ruby
instance.front_matter -> Hash[String, untyped]
```
### footnotes (reader)
```ruby
instance.footnotes -> Hash[String, String]
```
