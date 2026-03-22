---
title: module PIO
keywords: PIO
tags: [module]
summary: PIO module of PicoRuby
sidebar: picoruby_sidebar
permalink: PIO.html
folder: rbs_doc
---
## Type aliases
### pio_num_t
```ruby
0 | 1
```
### fifo_join_t
```ruby
0 | 1 | 2
```
### jmp_condition_t
```ruby
:always | :not_x | :x_dec | :not_y | :y_dec | :x_ne_y | :pin | :not_osre
```
### wait_source_t
```ruby
:gpio | :pin | :irq
```
### in_source_t
```ruby
:pins | :x | :y | :null | :isr | :osr
```
### out_dest_t
```ruby
:pins | :x | :y | :null | :pindirs | :pc | :isr | :exec
```
### mov_dest_t
```ruby
:pins | :x | :y | :exec | :pc | :isr | :osr
```
### mov_source_t
```ruby
:pins | :x | :y | :null | :status | :isr | :osr
```
### mov_op_t
```ruby
:none | :invert | :reverse
```
### set_dest_t
```ruby
:pins | :x | :y | :pindirs
```
## Singleton methods
### asm

```ruby
PIO.asm(?side_set: Integer, ?side_set_optional: bool) { (?) -> void } -> Program
```
