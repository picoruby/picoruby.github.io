---
title: module JS::WebAudio
keywords: JS::WebAudio
tags: [module]
summary: JS::WebAudio module of PicoRuby
sidebar: picoruby_sidebar
permalink: JS_WebAudio.html
folder: rbs_doc
---
## Type aliases
### source_t
```ruby
MIDIBASE::Router::source_t
```
### js_node_t
```ruby
untyped
```
### tone_value_t
```ruby
String | Integer | Float
```
### validated_tone_value_t
```ruby
String | Float
```
### tone_key_t
```ruby
:waveform | :attack | :decay | :sustain | :release | :detune | :cutoff | :resonance
```
### tone_t
```ruby
{
      waveform: String,
      attack: Float,
      decay: Float,
      sustain: Float,
      release: Float,
      detune: Float,
      cutoff: Float,
      resonance: Float
    }
```
### tone_attributes_t
```ruby
Hash[tone_key_t, tone_value_t]
```
### snapshot_t
```ruby
{
      source: js_node_t,
      channel: Integer,
      volume: Integer,
      expression: Integer,
      pan: Integer,
      pitch_bend: Integer,
      tone: tone_t,
      percussion: bool
    }
```
## Singleton methods
### create_context

```ruby
JS::WebAudio.create_context() -> js_node_t
```
### supported?

```ruby
JS::WebAudio.supported?() -> bool
```
