---
title: class PicoLine
keywords: PicoLine
tags: [class]
summary: PicoLine class of PicoRuby
sidebar: picoruby_sidebar
permalink: PicoLine.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
PicoLine.new(?editor: Editor::Line?) -> void
```
## Instance methods
### ask

```ruby
instance.ask(String, ?allow_empty: bool) ?{ (Question) -> void } -> String
```
### readline

```ruby
instance.readline(String prompt) -> String?
```
### say

```ruby
instance.say(String message) -> self
```
