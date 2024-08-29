---
title: class String
keywords: String
tags: [class]
summary: String class of PicoRuby
sidebar: picoruby_sidebar
permalink: String.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
String.new(?string str) -> instance
```
## Instance methods
### !

```ruby
instance.!() -> bool
```
### *

```ruby
instance.*(int n) -> String
```
### +

```ruby
instance.+(string other_str) -> String
```
### <<

```ruby
instance.<<(string | Integer str_or_codepoint) -> String
```
### <=>

```ruby
instance.<=>(string other) -> Integer
instance.<=>(untyped other) -> Integer?
```
### ==

```ruby
instance.==(untyped obj) -> bool
```
### ===

```ruby
instance.===(untyped obj) -> bool
```
### []

```ruby
instance.[](int index) -> String?
instance.[](int start, int length) -> String?
instance.[](Range[Integer] | Range[Integer?] range) -> String?
instance.[](String match_str) -> String?
```
### []=

```ruby
instance.[]=(int pos, String new_str) -> String
instance.[]=(int begin_pos, int end_pos, String new_str) -> String
instance.[]=(Range[Integer] | Range[Integer?] range, String new_str) -> String
instance.[]=(String other_str, String new_str) -> String
```
### __ljust_rjust_argcheck

```ruby
instance.__ljust_rjust_argcheck(Integer width, String padding) -> void
```
### bytes

```ruby
instance.bytes() -> Array[Integer]
instance.bytes() { (Integer byte) -> void } -> String
```
### chomp

```ruby
instance.chomp(?string separator) -> String
```
### chomp!

```ruby
instance.chomp!(?string separator) -> String?
```
### clear

```ruby
instance.clear() -> String
```
### downcase

```ruby
instance.downcase() -> String
instance.downcase(:ascii | :fold | :lithuanian | :turkic) -> String
instance.downcase(:lithuanian, :turkic) -> String
instance.downcase(:turkic, :lithuanian) -> String
```
### downcase!

```ruby
instance.downcase!() -> String?
instance.downcase!(:ascii | :fold | :lithuanian | :turkic) -> String?
instance.downcase!(:lithuanian, :turkic) -> String?
instance.downcase!(:turkic, :lithuanian) -> String?
```
### each_byte

```ruby
instance.each_byte() { (Integer byte) -> void } -> self
```
### each_char

```ruby
instance.each_char() { (String char) -> void } -> self
```
### empty?

```ruby
instance.empty?() -> bool
```
### end_with?

```ruby
instance.end_with?(*string suffixes) -> bool
```
### getbyte

```ruby
instance.getbyte(int index) -> Integer?
```
### include?

```ruby
instance.include?(string other_str) -> bool
```
### index

```ruby
instance.index(string substr_or_regexp, ?int offset) -> Integer?
```
### inspect

```ruby
instance.inspect() -> String
```
### intern

```ruby
instance.intern() -> Symbol
```
### length

```ruby
instance.length() -> Integer
```
### ljust

```ruby
instance.ljust(Integer width, ?string padstr) -> String
```
### lstrip

```ruby
instance.lstrip() -> String
```
### lstrip!

```ruby
instance.lstrip!() -> self?
```
### ord

```ruby
instance.ord() -> Integer
```
### rjust

```ruby
instance.rjust(Integer width, ?string padstr) -> String
```
### rstrip

```ruby
instance.rstrip() -> String
```
### rstrip!

```ruby
instance.rstrip!() -> self?
```
### split

```ruby
instance.split(?string pattern, ?int limit) -> Array[String]
```
### start_with?

```ruby
instance.start_with?(*string prefixes) -> bool
```
### strip

```ruby
instance.strip() -> String
```
### strip!

```ruby
instance.strip!() -> self?
```
### to_f

```ruby
instance.to_f() -> Float
```
### to_i

```ruby
instance.to_i(?int base) -> Integer
```
### to_s

```ruby
instance.to_s() -> String
```
### to_sym

```ruby
instance.to_sym() -> Symbol
```
### tr

```ruby
instance.tr(string from_str, string to_str) -> String
```
### tr!

```ruby
instance.tr!(string from_str, string to_str) -> String?
```
### upcase

```ruby
instance.upcase() -> String
instance.upcase(:ascii | :lithuanian | :turkic) -> String
instance.upcase(:lithuanian, :turkic) -> String
instance.upcase(:turkic, :lithuanian) -> String
```
### upcase!

```ruby
instance.upcase!() -> self?
instance.upcase!(:ascii | :lithuanian | :turkic) -> self?
instance.upcase!(:lithuanian, :turkic) -> self?
instance.upcase!(:turkic, :lithuanian) -> self?
```
