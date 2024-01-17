---
title: VFS
keywords: VFS
tags: [class]
summary: VFS class of PicoRuby
sidebar: picoruby_sidebar
permalink: VFS.html
folder: rbs_doc
---
## Type aliases
### driver_t
```ruby
FAT
```
### volume_t
```ruby
{mountpoint: String, driver: driver_t}
```
### file_t
```ruby
FAT::File
```
### dir_t
```ruby
FAT::Dir
```
## Singleton methods
### chdir

```ruby
VFS.chdir(String dir) -> 0
```
### chmod

```ruby
VFS.chmod(Integer mode, String path) -> 0
```
### directory?

```ruby
VFS.directory?(String path) -> untyped
```
### exist?

```ruby
VFS.exist?(String path) -> bool
```
### mkdir

```ruby
VFS.mkdir(String path, ?Integer mode) -> 0
```
### mount

```ruby
VFS.mount(driver_t driver, String mountpoint) -> void
```
### pwd

```ruby
VFS.pwd-> String
```
### rename

```ruby
VFS.rename(String from, String to) -> 0
```
### sanitize

```ruby
VFS.sanitize(String path) -> String
```
### sanitize_and_split

```ruby
VFS.sanitize_and_split(String path) -> [volume_t, String]
```
### split

```ruby
VFS.split(String sanitized_path) -> [volume_t, String]
```
### unlink

```ruby
VFS.unlink(String path) -> 0
```
### unmount

```ruby
VFS.unmount(driver_t driver, ?bool force) -> void
```
### volume_index

```ruby
VFS.volume_index(untyped mountpoint) -> Integer?
```
