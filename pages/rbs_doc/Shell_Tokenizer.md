---
title: class Shell::Tokenizer
keywords: Shell::Tokenizer
tags: [class]
summary: Shell::Tokenizer class of PicoRuby
sidebar: picoruby_sidebar
permalink: Shell_Tokenizer.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Shell::Tokenizer.new(String input) -> void
```
## Instance methods
### create_token

```ruby
instance.create_token(Symbol type, Integer start_pos, Integer length) -> token_hash
```
### eof?

```ruby
instance.eof?() -> bool
```
### next_token

```ruby
instance.next_token() -> token_hash?
```
### skip_whitespace

```ruby
instance.skip_whitespace() -> void
```
### tokenize_quoted_string

```ruby
instance.tokenize_quoted_string(String quote_char, Integer start_pos) -> token_hash
```
### tokenize_whitespace

```ruby
instance.tokenize_whitespace(Integer start_pos) -> token_hash
```
### tokenize_word

```ruby
instance.tokenize_word(Integer start_pos) -> token_hash
```
