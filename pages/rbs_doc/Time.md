---
title: Time
sidebar: picoruby_sidebar
permalink: Time.html
folder: rbs_doc
---
## Type aliases
### subsec_unit
```ruby
:msec | :millisecond | :usec | :microsecond | :nsec | :nanosecond
```
## Singleton methods
### at

```ruby
Time.at((Integer|Time), ?in: String | Integer | nil) -> Time
```
### new

```ruby
Time.new(?Integer? year, ?Integer? month, ?Integer? day, ?Integer? hour, ?Integer? min, ?Integer? sec, ?String | Integer | nil) -> void
Time.new(?Integer? year, ?Integer? month, ?Integer? day, ?Integer? hour, ?Integer? min, ?Integer? sec, in: String | Integer | nil) -> void
Time.new(String, ?in: string | int | nil, ?precision: int) -> void
```
### local

```ruby
Time.local(Integer year, ?Integer | String month, ?Integer day, ?Integer hour, ?Integer min, ?Integer sec, ?Integer usec_with_frac) -> Time
```
### mktime

```ruby
Time.mktime(Integer year, ?Integer | String month, ?Integer day, ?Integer hour, ?Integer min, ?Integer sec, ?Integer usec_with_frac) -> Time
```
### now

```ruby
Time.now(?in: String | Integer | nil) -> Time
```
### time_methods

```ruby
Time.time_methods() -> Time::TimeMethods
```
## Instance methods
### +

```ruby
+(Integer arg0) -> Time
```
### -

```ruby
-(Time arg0) -> Float
-(Integer arg0) -> Time
```
### <

```ruby
<(Time arg0) -> bool
```
### <=

```ruby
<=(Time arg0) -> bool
```
### <=>

```ruby
<=>(Time other) -> Integer
<=>(untyped other) -> Integer?
```
### >

```ruby
>(Time arg0) -> bool
```
### >=

```ruby
>=(Time arg0) -> bool
```
### friday?

```ruby
friday?() -> bool
```
### hour

```ruby
hour() -> Integer
```
### inspect

```ruby
inspect() -> String
```
### mday

```ruby
mday() -> Integer
```
### min

```ruby
min() -> Integer
```
### mon

```ruby
mon() -> Integer
```
### monday?

```ruby
monday?() -> bool
```
### saturday?

```ruby
saturday?() -> bool
```
### sec

```ruby
sec() -> Integer
```
### sunday?

```ruby
sunday?() -> bool
```
### thursday?

```ruby
thursday?() -> bool
```
### to_f

```ruby
to_f() -> Float
```
### to_i

```ruby
to_i() -> Integer
```
### to_s

```ruby
to_s() -> String
```
### tuesday?

```ruby
tuesday?() -> bool
```
### usec

```ruby
usec() -> Integer
```
### wday

```ruby
wday() -> Integer
```
### wednesday?

```ruby
wednesday?() -> bool
```
### year

```ruby
year() -> Integer
```
