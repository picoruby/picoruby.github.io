---
title: class USB::CDC::MIDIOutput
keywords: USB::CDC::MIDIOutput
tags: [class]
summary: USB::CDC::MIDIOutput class of PicoRuby
sidebar: picoruby_sidebar
permalink: USB_CDC_MIDIOutput.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
USB::CDC::MIDIOutput.new(?write_timeout_ms: Integer) -> void
```
## Instance methods
### connected?

```ruby
instance.connected?() -> bool
```
### handle

```ruby
instance.handle(MIDIBASE::event_t event, **MIDIBASE::context_value_t context) -> (Integer | false)
```
### handle_midi

```ruby
instance.handle_midi(MIDIBASE::event_t event, MIDIBASE::Router::source_t source, Integer priority, Integer? timestamp_us) -> (Integer | false)
```
### putevent

```ruby
instance.putevent(Symbol command, *(Integer | String) values) -> (Integer | false)
```
