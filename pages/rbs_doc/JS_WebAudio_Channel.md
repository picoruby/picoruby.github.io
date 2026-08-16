---
title: class JS::WebAudio::Channel
keywords: JS::WebAudio::Channel
tags: [class]
summary: JS::WebAudio::Channel class of PicoRuby
sidebar: picoruby_sidebar
permalink: JS_WebAudio_Channel.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
JS::WebAudio::Channel.new(js_node_t context, js_node_t destination, source_t source, Integer number) -> void
```
## Instance methods
### bend_cents

```ruby
instance.bend_cents() -> Float
```
### destination

```ruby
instance.destination() -> js_node_t
```
### expression=

```ruby
instance.expression=(Integer value) -> Integer
```
### pan=

```ruby
instance.pan=(Integer value) -> Integer
```
### percussion?

```ruby
instance.percussion?() -> bool
```
### pitch_bend=

```ruby
instance.pitch_bend=(Integer value) -> Integer
```
### reset

```ruby
instance.reset() -> self
```
### snapshot

```ruby
instance.snapshot() -> snapshot_t
```
### update_tone

```ruby
instance.update_tone(tone_attributes_t attributes) -> self
```
### volume=

```ruby
instance.volume=(Integer value) -> Integer
```
## Attr accessors
### source (reader)
```ruby
instance.source -> source_t
```
### number (reader)
```ruby
instance.number -> Integer
```
### tone (reader)
```ruby
instance.tone -> tone_t
```
