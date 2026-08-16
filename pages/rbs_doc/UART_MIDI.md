---
title: class UART::MIDI
keywords: UART::MIDI
tags: [class]
summary: UART::MIDI class of PicoRuby
sidebar: picoruby_sidebar
permalink: UART_MIDI.html
folder: rbs_doc
---
## Include
[MIDIBASE](MIDIBASE.html)
## Singleton methods
### new

```ruby
UART::MIDI.new(
      unit: UART::unit_t,
      ?txd_pin: Integer,
      ?rxd_pin: Integer,
      ?baudrate: Integer,
      ?rx_buffer_size: Integer?,
      ?time_signature: Array[Integer],
      ?max_sysex_bytes: Integer
    ) -> void
```
