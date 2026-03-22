---
title: class PIO::Assembler
keywords: PIO::Assembler
tags: [class]
summary: PIO::Assembler class of PicoRuby
sidebar: picoruby_sidebar
permalink: PIO_Assembler.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
PIO::Assembler.new(?side_set: Integer, ?side_set_optional: bool) -> void
```
## Instance methods
### assemble

```ruby
instance.assemble() -> Program
```
### in_

```ruby
instance.in_(in_source_t source, Integer bit_count, ?side: Integer?, ?delay: Integer) -> void
```
### irq

```ruby
instance.irq(Integer index, ?wait: bool, ?clear: bool, ?relative: bool, ?side: Integer?, ?delay: Integer) -> void
```
### jmp

```ruby
instance.jmp(Symbol | Integer addr, ?cond: jmp_condition_t, ?side: Integer?, ?delay: Integer) -> void
```
### label

```ruby
instance.label(Symbol name) -> void
```
### mov

```ruby
instance.mov(mov_dest_t dest, mov_source_t source, ?op: mov_op_t, ?side: Integer?, ?delay: Integer) -> void
```
### nop

```ruby
instance.nop(?side: Integer?, ?delay: Integer) -> void
```
### out

```ruby
instance.out(out_dest_t dest, Integer bit_count, ?side: Integer?, ?delay: Integer) -> void
```
### pull

```ruby
instance.pull(?ifempty: bool, ?block: bool, ?side: Integer?, ?delay: Integer) -> void
```
### push

```ruby
instance.push(?iffull: bool, ?block: bool, ?side: Integer?, ?delay: Integer) -> void
```
### set

```ruby
instance.set(set_dest_t dest, Integer value, ?side: Integer?, ?delay: Integer) -> void
```
### wait

```ruby
instance.wait(Integer polarity, wait_source_t source, Integer index, ?side: Integer?, ?delay: Integer) -> void
```
### wrap

```ruby
instance.wrap() -> void
```
### wrap_target

```ruby
instance.wrap_target() -> void
```
