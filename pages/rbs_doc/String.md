---
title: String
sidebar: picoruby_sidebar
permalink: String.html
folder: rbs_doc
---
## Singleton methods
### new

```ruby
String.new(?string str) -> void
```
## Instance methods
### !

```ruby
!() -> bool
```
### *

```ruby
*(int n) -> String
```
### +

```ruby
+(string other_str) -> String
```
### <<

```ruby
<<(string | Integer str_or_codepoint) -> String
```
### <=>

```ruby
<=>(string other) -> Integer
<=>(untyped other) -> Integer?
```
### ==

```ruby
==(untyped obj) -> bool
```
### ===

```ruby
===(untyped obj) -> bool
```
### []

```ruby
[](int index) -> String?
[](int start, int length) -> String?
[](Range[Integer] | Range[Integer?] range) -> String?
[](String match_str) -> String?
```
### []=

```ruby
[]=(int pos, String new_str) -> String
[]=(int begin_pos, int end_pos, String new_str) -> String
[]=(Range[Integer] | Range[Integer?] range, String new_str) -> String
[]=(String other_str, String new_str) -> String
```
### __ljust_rjust_argcheck

```ruby
__ljust_rjust_argcheck(Integer width, String padding) -> void
```
### bytes

```ruby
bytes() -> Array[Integer]
bytes() { (Integer byte) -> void } -> String
```
### chomp

```ruby
chomp(?string separator) -> String
```
### chomp!

```ruby
chomp!(?string separator) -> String?
```
### clear

```ruby
clear() -> String
```
### downcase

```ruby
downcase() -> String
downcase(:ascii | :fold | :lithuanian | :turkic) -> String
downcase(:lithuanian, :turkic) -> String
downcase(:turkic, :lithuanian) -> String
```
### downcase!

```ruby
downcase!() -> String?
downcase!(:ascii | :fold | :lithuanian | :turkic) -> String?
downcase!(:lithuanian, :turkic) -> String?
downcase!(:turkic, :lithuanian) -> String?
```
### each_byte

```ruby
each_byte() { (Integer byte) -> void } -> self
```
### each_char

```ruby
each_char() { (String char) -> void } -> self
```
### empty?

```ruby
empty?() -> bool
```
### end_with?

```ruby
end_with?(*string suffixes) -> bool
```
### getbyte

```ruby
getbyte(int index) -> Integer?
```
### include?

```ruby
include?(string other_str) -> bool
```
### index

```ruby
index(string substr_or_regexp, ?int offset) -> Integer?
```
### inspect

```ruby
inspect() -> String
```
### intern

```ruby
intern() -> Symbol
```
### length

```ruby
length() -> Integer
```
### ljust

```ruby
ljust(Integer width, ?string padstr) -> String
```
### lstrip

```ruby
lstrip() -> String
```
### lstrip!

```ruby
lstrip!() -> self?
```
### ord

```ruby
ord() -> Integer
```
### rjust

```ruby
rjust(Integer width, ?string padstr) -> String
```
### rstrip

```ruby
rstrip() -> String
```
### rstrip!

```ruby
rstrip!() -> self?
```
### split

```ruby
split(?string pattern, ?int limit) -> Array[String]
```
### start_with?

```ruby
start_with?(*string prefixes) -> bool
```
### strip

```ruby
strip() -> String
```
### strip!

```ruby
strip!() -> self?
```
### to_f

```ruby
to_f() -> Float
```
### to_i

```ruby
to_i(?int base) -> Integer
```
### to_s

```ruby
to_s() -> String
```
### to_sym

```ruby
to_sym() -> Symbol
```
### tr

```ruby
tr(string from_str, string to_str) -> String
```
### tr!

```ruby
tr!(string from_str, string to_str) -> String?
```
### upcase

```ruby
upcase() -> String
upcase(:ascii | :lithuanian | :turkic) -> String
upcase(:lithuanian, :turkic) -> String
upcase(:turkic, :lithuanian) -> String
```
### upcase!

```ruby
upcase!() -> self?
upcase!(:ascii | :lithuanian | :turkic) -> self?
upcase!(:lithuanian, :turkic) -> self?
upcase!(:turkic, :lithuanian) -> self?
```
