---
title: class Shell::Parser
keywords: Shell::Parser
tags: [class]
summary: Shell::Parser class of PicoRuby
sidebar: picoruby_sidebar
permalink: Shell_Parser.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
Shell::Parser.new(String input) -> void
```
## Instance methods
### advance

```ruby
instance.advance() -> void
```
### consume

```ruby
instance.consume(Symbol type, ?String? value) -> token_hash?
```
### expect

```ruby
instance.expect(Symbol type, ?String? value) -> token_hash
```
### expect_word_or_quoted_string

```ruby
instance.expect_word_or_quoted_string() -> token_hash
```
### parse

```ruby
instance.parse() -> Node?
```
### parse_argument

```ruby
instance.parse_argument() -> String
```
### parse_command

```ruby
instance.parse_command() -> Node
```
### parse_program

```ruby
instance.parse_program() -> Node?
```
### parse_redirection

```ruby
instance.parse_redirection() -> Node?
```
### skip_whitespace

```ruby
instance.skip_whitespace() -> void
```
### token_value

```ruby
instance.token_value(?token_hash? token) -> String
```
