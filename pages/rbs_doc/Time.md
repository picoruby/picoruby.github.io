---
title: class Time
keywords: Time
tags: [class]
summary: Time class of PicoRuby
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
instance.+(Integer arg0) -> Time
```
### -

```ruby
instance.-(Time arg0) -> Float
instance.-(Integer arg0) -> Time
```
### <

```ruby
instance.<(Time arg0) -> bool
```
### <=

```ruby
instance.<=(Time arg0) -> bool
```
### <=>

```ruby
instance.<=>(Time other) -> Integer
instance.<=>(untyped other) -> Integer?
```
### >

```ruby
instance.>(Time arg0) -> bool
```
### >=

```ruby
instance.>=(Time arg0) -> bool
```
### friday?

```ruby
instance.friday?() -> bool
```
### hour

```ruby
instance.hour() -> Integer
```
### inspect

```ruby
instance.inspect() -> String
```
### mday

```ruby
instance.mday() -> Integer
```
### min

```ruby
instance.min() -> Integer
```
### mon

```ruby
instance.mon() -> Integer
```
### monday?

```ruby
instance.monday?() -> bool
```
### saturday?

```ruby
instance.saturday?() -> bool
```
### sec

```ruby
instance.sec() -> Integer
```
### sunday?

```ruby
instance.sunday?() -> bool
```
### thursday?

```ruby
instance.thursday?() -> bool
```
### to_f

```ruby
instance.to_f() -> Float
```
### to_i

```ruby
instance.to_i() -> Integer
```
### to_s

```ruby
instance.to_s() -> String
```
### tuesday?

```ruby
instance.tuesday?() -> bool
```
### usec

```ruby
instance.usec() -> Integer
```
### wday

```ruby
instance.wday() -> Integer
```
### wednesday?

```ruby
instance.wednesday?() -> bool
```
### year

```ruby
instance.year() -> Integer
```
