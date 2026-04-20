---
title: Type aliases
sidebar: picoruby_sidebar
permalink: /type_alias.html
folder: rbs_doc
---

## bdffont_result_t
```rbs
[Integer, Integer,     Array[Integer], Array[Array[Integer]]]
```

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

