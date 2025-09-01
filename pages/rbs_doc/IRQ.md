---
title: module IRQ
keywords: IRQ
tags: [module]
summary: IRQ module of PicoRuby
sidebar: picoruby_sidebar
permalink: IRQ.html
folder: rbs_doc
---
## Type aliases
### irq_id_t
```ruby
Integer
```
### irq_event_type_t
```ruby
Integer
```
### irq_peri_t
```ruby
GPIO
```
## Singleton methods
### process

```ruby
IRQ.process(?Integer max_count) -> Integer
```
### register

```ruby
IRQ.register(IRQInstance irq, Hash[Symbol, untyped] opts) -> irq_id_t
```
### unregister

```ruby
IRQ.unregister(irq_id_t id) -> bool
```
## Instance methods
### irq

```ruby
instance.irq(irq_event_type_t event_type, **untyped opts) { (irq_peri_t peri, irq_event_type_t event_type, Object capture) -> void } -> void
```
