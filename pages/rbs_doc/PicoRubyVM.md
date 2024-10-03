---
title: class PicoRubyVM
keywords: PicoRubyVM
tags: [class]
summary: PicoRubyVM class of PicoRuby
sidebar: picoruby_sidebar
permalink: PicoRubyVM.html
folder: rbs_doc
---
## Type aliases
### alloc_stat_t
```ruby
{total: Integer, used: Integer, free: Integer, frag: Integer}
```
### alloc_prof_t
```ruby
{peak: Integer, valley: Integer}
```
## Singleton methods
### memory_statistics

```ruby
PicoRubyVM.memory_statistics-> alloc_stat_t
```
### profile_alloc

```ruby
PicoRubyVM.profile_alloc() {() -> untyped} -> untyped
```
