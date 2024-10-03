---
title: module JWT
keywords: JWT
tags: [module]
summary: JWT module of PicoRuby
sidebar: picoruby_sidebar
permalink: JWT.html
folder: rbs_doc
---
## Singleton methods
### decode

```ruby
JWT.decode(String token, ?String|nil secret, ?bool validate) -> [Object, Hash[String, Object]]
```
### encode

```ruby
JWT.encode(String payload, ?String|nil secret, ?String algorithm) -> String
```
