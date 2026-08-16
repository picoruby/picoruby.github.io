---
title: class JS::WebAudio::Voice
keywords: JS::WebAudio::Voice
tags: [class]
summary: JS::WebAudio::Voice class of PicoRuby
sidebar: picoruby_sidebar
permalink: JS_WebAudio_Voice.html
folder: rbs_doc
---
## Type aliases
### status_t
```ruby
:idle | :active | :releasing
```
### voice_snapshot_t
```ruby
{
        id: Integer,
        source: js_node_t,
        channel: Integer?,
        note: Integer,
        status: Voice::status_t
      }
```
## Singleton methods
### new

```ruby
JS::WebAudio::Voice.new(Synth owner, js_node_t context, Integer id) -> void
```
## Instance methods
### cleanup_finished

```ruby
instance.cleanup_finished(Float now) -> bool
```
### ended

```ruby
instance.ended(Integer generation) -> void
```
### release

```ruby
instance.release() -> self
```
### silence

```ruby
instance.silence() -> self
```
### snapshot

```ruby
instance.snapshot() -> voice_snapshot_t
```
### start

```ruby
instance.start(source_t source, Channel channel, Integer note, Integer velocity) -> self
```
### update_pitch

```ruby
instance.update_pitch() -> void
```
### update_tone

```ruby
instance.update_tone(::Array[tone_key_t] changed_keys) -> void
```
## Attr accessors
### id (reader)
```ruby
instance.id -> Integer
```
### analyser (reader)
```ruby
instance.analyser -> js_node_t
```
### source (reader)
```ruby
instance.source -> source_t
```
### channel (reader)
```ruby
instance.channel -> Channel?
```
### note (reader)
```ruby
instance.note -> Integer
```
### generation (reader)
```ruby
instance.generation -> Integer
```
### status (reader)
```ruby
instance.status -> status_t
```
