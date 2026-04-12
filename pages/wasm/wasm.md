---
keywords: documentation
layout: page
tags: [wasm, webassembly]
title: Ruby on Browser
sidebar: picoruby_sidebar
permalink: wasm
folder: wasm
---

PicoRuby also works on browsers.
Because of its portability, PicoRuby.wasm supports the language's full features while CRuby.wasm doesn't.

| |CRuby.wasm (4.0)|PicoRuby.wasm (3.4)|
|-|----------|-------------|
|`Kernel#sleep`|❌|✅|
|Multithreading|No `Thread` support|`Task` support|
|Binary size (compressed)|17.2 MB (4.4 MB)|1.1 MB (470 KB)|

## PicoRuby.WASM

**PicoRuby.wasm** is a dedicated build as WebAssembly, producing the [`@picoruby/wasm-wasi`](npm/picoruby/) npm package.
It uses the mruby VM to run Ruby in the browser with full JavaScript interoperability.

See the official documentation for more details: [https://github.com/picoruby/picoruby/blob/master/mrbgems/picoruby-wasm/npm/picoruby/README.md](https://github.com/picoruby/picoruby/blob/master/mrbgems/picoruby-wasm/npm/picoruby/README.md)

## Funicular

**Funicular** is a single-page application (SPA) framework powered by PicoRuby.wasm.

- Write client-side code in Ruby instead of JavaScript
- Seamless Rails integration

See the next page for more details: [Getting Started with Funicular](/funicular-getting-started)
