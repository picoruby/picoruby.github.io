---
title: class PitchDetector::Note
keywords: PitchDetector::Note
tags: [class]
summary: PitchDetector::Note class of PicoRuby
sidebar: picoruby_sidebar
permalink: PitchDetector_Note.html
folder: rbs_doc
---
## Type aliases
### note_t
```ruby
{ note: String, octave: Integer, cents: Integer, frequency: String }
```
## Singleton methods
### new

```ruby
PitchDetector::Note.new(Float | Integer reference) -> void
```
## Instance methods
### freq_to_note

```ruby
instance.freq_to_note(Float | Integer frequency) -> note_t
```
### note_to_freq

```ruby
instance.note_to_freq(String note, Integer octave) -> (Float | nil)
```
