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
:aes_128_cbc
                               | :aes_192_cbc
                               | :aes_256_cbc
                               | :aes_128_gcm
                               | :aes_192_gcm
                               | :aes_256_gcm
```
### operation_t
```ruby
:encrypt | :decrypt
```
## Singleton methods
### new

```ruby
MbedTLS::Cipher.new(cipher_t cipher_suite, String key, operation_t operation) -> MbedTLS::Cipher
```
## Instance methods
### check_tag

```ruby
instance.check_tag(String tag) -> bool
```
### finish

```ruby
instance.finish() -> String
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
