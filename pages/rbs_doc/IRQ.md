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
GPIO | _BridgePeripheral
```
### irq_source_t
```ruby
Integer
```
## Singleton methods
### _dispatch_loop

```ruby
IRQ._dispatch_loop(Task::Queue queue, Hash[Integer, Proc] handlers) -> void
```
### bind

```ruby
IRQ.bind(irq_source_t source, Task::Queue queue) -> Task::Queue
```
### process

```ruby
IRQ.process(?Integer max_count) -> Integer
```
### register

```ruby
IRQ.register(IRQInstance irq, Hash[Symbol, untyped] opts) -> irq_id_t
```
### simulate

```ruby
IRQ.simulate(irq_source_t source, Integer bits) -> nil
```
### start

```ruby
IRQ.start() -> bool
```
### stop

```ruby
IRQ.stop() -> bool
```
### take

```ruby
IRQ.take(irq_source_t source) -> Integer
```
### unbind

```ruby
IRQ.unbind(irq_source_t source) -> bool
```
### unregister

```ruby
IRQ.unregister(irq_id_t id) -> bool
```
## Instance methods
### irq

```ruby
instance.irq(irq_event_type_t event_type, **untyped opts) { (irq_peri_t peri, irq_event_type_t event_type, Object capture) -> void } -> IRQInstance
```
