---
title: class LooperCLIOptions
keywords: LooperCLIOptions
tags: [class]
summary: LooperCLIOptions class of PicoRuby
sidebar: picoruby_sidebar
permalink: LooperCLIOptions.html
folder: rbs_doc
---
## Singleton methods
### build_parser

```ruby
LooperCLIOptions.build_parser() -> PicoOptionParser
```
## Instance methods
### parse

```ruby
instance.parse(Array[String] args) -> (self | Symbol)
```
## Attr accessors
### audio (reader)
```ruby
instance.audio -> Symbol
```
### midi_out (reader)
```ruby
instance.midi_out -> Symbol
```
### click_out (reader)
```ruby
instance.click_out -> Symbol
```
### midi_thru (reader)
```ruby
instance.midi_thru -> bool
```
### polyphony (reader)
```ruby
instance.polyphony -> Integer
```
### click_voice_cost (reader)
```ruby
instance.click_voice_cost -> Integer
```
### uart_unit (reader)
```ruby
instance.uart_unit -> Symbol
```
### rx (reader)
```ruby
instance.rx -> Integer
```
### tx (reader)
```ruby
instance.tx -> Integer
```
### baud (reader)
```ruby
instance.baud -> Integer
```
### left (reader)
```ruby
instance.left -> Integer
```
### right (reader)
```ruby
instance.right -> Integer
```
### ldac (reader)
```ruby
instance.ldac -> Integer
```
### cs (reader)
```ruby
instance.cs -> Integer
```
### sck (reader)
```ruby
instance.sck -> Integer
```
### copi (reader)
```ruby
instance.copi -> Integer
```
