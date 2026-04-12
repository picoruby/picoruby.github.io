---
title: Type aliases
sidebar: picoruby_sidebar
permalink: /type_alias.html
folder: rbs_doc
---

## gpio_pin_t
```rbs
Integer|String|Symbol
```

## header_t
```rbs
Hash[String, String | nil]
```

## httpreturn
```rbs
{
  status: Integer,
  headers: header_t,
  body: String
}
```

