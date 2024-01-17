---
title: FAT
keywords: FAT
tags: [class]
summary: FAT class of PicoRuby
sidebar: picoruby_sidebar
permalink: FAT.html
folder: rbs_doc
---
## Type aliases
### stat_t
```ruby
{size: Integer?, unixtime: Integer?, mode: Integer}
```
### driver_t
```ruby
nil|SPI
```
## Singleton methods
### init_spi

```ruby
FAT.init_spi(String unit, Integer sck_pin, Integer cipo_pin, Integer copi_pin, Integer cs_pin) -> 0
```
### new

```ruby
FAT.new(Symbol|String device, ?label: String?, ?driver: driver_t) -> FAT
```
### unixtime_offset=

```ruby
FAT.unixtime_offset=(Integer) -> Integer
```
### vfs_methods

```ruby
FAT.vfs_methods-> FAT::VFSMethods
```
## Instance methods
### chdir

```ruby
instance.chdir(String path) -> 0
```
### chmod

```ruby
instance.chmod(Integer mode, String path) -> 0
```
### directory?

```ruby
instance.directory?(String path) -> bool
```
### erase

```ruby
instance.erase-> 0
```
### exist?

```ruby
instance.exist?(String path) -> bool
```
### getfree

```ruby
instance.getfree(String path) -> Integer
```
### getlabel

```ruby
instance.getlabel-> String
```
### mkdir

```ruby
instance.mkdir(String path, ?Integer mode) -> 0
```
### mkfs

```ruby
instance.mkfs-> FAT
```
### mount

```ruby
instance.mount(String mountpoint) -> 0
```
### open_dir

```ruby
instance.open_dir(String path) -> FAT::Dir
```
### open_file

```ruby
instance.open_file(String path, String mode) -> FAT::File
```
### rename

```ruby
instance.rename(String from, String to) -> 0
```
### sector_count

```ruby
instance.sector_count-> {total: Integer, free: Integer}
```
### setlabel

```ruby
instance.setlabel-> 0
```
### stat

```ruby
instance.stat(String path) -> Stat
```
### unlink

```ruby
instance.unlink(String path) -> 0
```
### unmount

```ruby
instance.unmount-> nil
```
### utime

```ruby
instance.utime(Time atime, Time mtime, String path) -> Integer
```
## Attr accessors
### mountpoint (reader)
```ruby
instance.mountpoint -> String
```
### prefix (reader)
```ruby
instance.prefix -> String
```
