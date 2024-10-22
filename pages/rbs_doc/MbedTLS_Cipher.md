---
title: class MbedTLS::Cipher
keywords: MbedTLS::Cipher
tags: [class]
summary: MbedTLS::Cipher class of PicoRuby
sidebar: picoruby_sidebar
permalink: MbedTLS_Cipher.html
folder: rbs_doc
---
## Type aliases
### cipher_t
```ruby
"AES-128-CBC"
                    | "AES-192-CBC"
                    | "AES-256-CBC"
                    | "AES-128-GCM"
                    | "AES-192-GCM"
                    | "AES-256-GCM"
```
## Singleton methods
### ciphers

```ruby
MbedTLS::Cipher.ciphers() -> Array[cipher_t]
```
### new

```ruby
MbedTLS::Cipher.new(cipher_t cipher_suite) -> MbedTLS::Cipher
```
## Instance methods
### check_tag

```ruby
instance.check_tag(String tag) -> bool
```
### decrypt

```ruby
instance.decrypt() -> MbedTLS::Cipher
```
### encrypt

```ruby
instance.encrypt() -> MbedTLS::Cipher
```
### finish

```ruby
instance.finish() -> String
```
### iv=

```ruby
instance.iv=(String iv) -> String
```
### iv_len

```ruby
instance.iv_len() -> Integer
```
### key=

```ruby
instance.key=(String key) -> String
```
### key_len

```ruby
instance.key_len() -> Integer
```
### update

```ruby
instance.update(String input) -> String
```
### update_ad

```ruby
instance.update_ad(String input) -> MbedTLS::Cipher
```
### write_tag

```ruby
instance.write_tag() -> String
```
