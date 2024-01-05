---
title: FAT
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
### _chdir

```ruby
FAT._chdir(String path) -> 0
```
### _chmod

```ruby
FAT._chmod(Integer mode, String path) -> 0
```
### _directory?

```ruby
FAT._directory?(String path) -> bool
```
### _erase

```ruby
FAT._erase(String path) -> 0
```
### _exist?

```ruby
FAT._exist?(String path) -> bool
```
### _mkdir

```ruby
FAT._mkdir(String path, Integer mode) -> 0
```
### _rename

```ruby
FAT._rename(String from, String to) -> 0
```
### _stat

```ruby
FAT._stat(String path) -> stat_t
```
### _unlink

```ruby
FAT._unlink(String path) -> 0
```
### _utime

```ruby
FAT._utime(Integer unixtime, String path) -> Integer
```
### init_spi

```ruby
FAT.init_spi(String unit, Integer sck_pin, Integer cipo_pin, Integer copi_pin, Integer cs_pin) -> 0
```
### new

```ruby
FAT.new(Symbol|String device, ?label: String?, ?driver: driver_t) -> void
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
### _getlabel

```ruby
_getlabel(String) -> String
```
### _mkfs

```ruby
_mkfs(String path) -> self
```
### _mount

```ruby
_mount(String path) -> 0
```
### _setlabel

```ruby
_setlabel(String) -> 0
```
### _unmount

```ruby
_unmount(String path) -> 0
```
### chdir

```ruby
chdir(String path) -> 0
```
### chmod

```ruby
chmod(Integer mode, String path) -> 0
```
### directory?

```ruby
directory?(String path) -> bool
```
### erase

```ruby
erase-> 0
```
### exist?

```ruby
exist?(String path) -> bool
```
### getfree

```ruby
getfree(String path) -> Integer
```
### getlabel

```ruby
getlabel-> String
```
### mkdir

```ruby
mkdir(String path, ?Integer mode) -> 0
```
### mkfs

```ruby
mkfs-> FAT
```
### mount

```ruby
mount(String mountpoint) -> 0
```
### open_dir

```ruby
open_dir(String path) -> FAT::Dir
```
### open_file

```ruby
open_file(String path, String mode) -> FAT::File
```
### rename

```ruby
rename(String from, String to) -> 0
```
### sector_count

```ruby
sector_count-> {total: Integer, free: Integer}
```
### setlabel

```ruby
setlabel-> 0
```
### stat

```ruby
stat(String path) -> Stat
```
### unlink

```ruby
unlink(String path) -> 0
```
### unmount

```ruby
unmount-> nil
```
### utime

```ruby
utime(Time atime, Time mtime, String path) -> Integer
```
