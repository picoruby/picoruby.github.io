---
title: class IRQ::IRQInstance
keywords: IRQ::IRQInstance
tags: [class]
summary: IRQ::IRQInstance class of PicoRuby
sidebar: picoruby_sidebar
permalink: IRQ_IRQInstance.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
IRQ::IRQInstance.new(irq_peri_t peripheral, irq_event_type_t event_type, Hash[Symbol, untyped] opts, Proc callback) -> void
```
## Instance methods
### call

```ruby
instance.call(irq_event_type_t event_type) -> void
```
### disable

```ruby
instance.disable() -> bool
```
### enable

```ruby
instance.enable() -> bool
```
### enabled?

```ruby
instance.enabled?() -> bool
```
### unregister

```ruby
instance.unregister() -> bool
```
## Attr accessors
### peripheral (reader)
```ruby
instance.peripheral -> irq_peri_t
```
### event_type (reader)
```ruby
instance.event_type -> irq_event_type_t
```
