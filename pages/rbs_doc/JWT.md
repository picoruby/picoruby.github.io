---
title: module JWT
keywords: JWT
tags: [module]
summary: JWT module of PicoRuby
sidebar: picoruby_sidebar
permalink: JWT.html
folder: rbs_doc
---
## Type aliases
### secret_t
```ruby
MbedTLS::PKey::RSA | String | nil
```
### key_t
```ruby
MbedTLS::PKey::RSA | String | nil
```
### alg_t
```ruby
"rs256" | "RS256" | "hs256" | "HS256" | "none" | "NONE"
```
### header_t
```ruby
Hash[String | Symbol, Object]
```
### payload_t
```ruby
Hash[String, Object]
```
## Singleton methods
### decode

```ruby
JWT.decode(String token, ?key_t key, ?validate: bool, ?algorithm: alg_t, ?ignore_exp: bool) -> [payload_t, header_t]
```
### encode

```ruby
JWT.encode(String payload, ?secret_t secret, ?String algorithm, ?header_t headers ) -> String
```
