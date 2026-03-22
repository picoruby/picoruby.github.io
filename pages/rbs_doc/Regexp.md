---
title: class Regexp
keywords: Regexp
tags: [class]
summary: Regexp class of PicoRuby
sidebar: picoruby_sidebar
permalink: Regexp.html
folder: rbs_doc
---
## Singleton methods
### compile

```ruby
Regexp.compile(String pattern, ?String | Integer | nil flags, ?untyped encoding) -> Regexp
```
### new

```ruby
Regexp.new(String pattern, ?String | Integer | nil flags, ?untyped encoding) -> Regexp
```
## Instance methods
### ===

```ruby
instance.===(String str) -> bool
```
### =~

```ruby
instance.=~(String str) -> Integer?
```
### casefold?

```ruby
instance.casefold?() -> bool
```
### free

```ruby
instance.free() -> nil
```
### inspect

```ruby
instance.inspect() -> String
```
### match

```ruby
instance.match(String str) -> MatchData?
```
### match?

```ruby
instance.match?(String str) -> bool
```
### options

```ruby
instance.options() -> Integer
```
### source

```ruby
instance.source() -> String
```
### to_s

```ruby
instance.to_s() -> String
```
