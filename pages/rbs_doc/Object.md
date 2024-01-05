---
title: Object
sidebar: picoruby_sidebar
permalink: Object.html
folder: rbs_doc
---
## Instance methods
### <=>

```ruby
<=>(untyped) -> Integer?
```
### ===

```ruby
===(untyped) -> bool
```
### attr_accessor

```ruby
attr_accessor(*Symbol) -> void
```
### attr_reader

```ruby
attr_reader(*Symbol) -> void
```
### block_given?

```ruby
block_given?() -> bool
```
### class

```ruby
class-> class
```
### dup

```ruby
dup() -> self
```
### exit

```ruby
exit(?Integer) -> void
```
### inspect

```ruby
inspect() -> String
```
### is_a?

```ruby
is_a?(untyped) -> bool
```
### nil?

```ruby
nil?() -> bool
```
### object_id

```ruby
object_id() -> Integer
```
### p

```ruby
p[T < _Inspect] (T arg0) -> T
p(_Inspect arg0, _Inspect arg1, *_Inspect rest) -> Array[_Inspect]
p() -> nil
```
### print

```ruby
print(*_ToS args) -> nil
```
### printf

```ruby
printf() -> nil
printf(String fmt, *untyped args) -> nil
```
### puts

```ruby
puts(*_ToS objects) -> nil
```
### raise

```ruby
raise() -> bot
raise(string message) -> bot
raise(Exception exception, ?String cause) -> bot
raise(_Exception exception, ?String cause) -> bot
```
### sleep

```ruby
sleep(Integer | Float) -> Integer
```
### sleep_ms

```ruby
sleep_ms(Integer) -> Integer
```
### sprintf

```ruby
sprintf(String format, *untyped args) -> String
```
### to_s

```ruby
to_s() -> String
```
## Instance methods (picoruby-require)
### extern

```ruby
extern(String path, ?bool force) -> (bool|nil)
```
### load

```ruby
load(String) -> bool
```
### load_file

```ruby
load_file(String) -> bool
```
### require

```ruby
require(String) -> bool
```
### require_file

```ruby
require_file(String) -> bool
```
### require_relative

```ruby
require_relative(String) -> bool
```
### required?

```ruby
required?(String) -> bool
```
