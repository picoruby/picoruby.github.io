---
keywords: documentation
layout: page
tags: [wasm, webassembly]
title: PicoRuby on Browser
sidebar: picoruby_sidebar
permalink: wasm
folder: wasm
---

PicoRuby also works on web browsers.
What's noteworthy is its small size.

|                        |CRuby.wasm 4.0 with stdlib |CRuby.wasm 4.0 without stdlib |PicoRuby.wasm 4.0 with Funicular|
|------------------------|---------------------------|------------------------------|--------------------------------|
|`Kernel#sleep`          |❌                         |❌                            |✅                              |
|Multithreading          |No `Thread` support        |No `Thread` support           |`Task` support                  |
|Binary size (compressed)|31.0 MB (8.6 MB)           |17.2 MB (4.4 MB)              |1.3 MB (530 KB)                 |

## PicoRuby.WASM

**PicoRuby.wasm** is a dedicated build as WebAssembly, producing the [`@picoruby/wasm-wasi`](npm/picoruby/) npm package.
It uses the mruby VM to run Ruby in the browser with full JavaScript interoperability.

See the official documentation for more details: [https://github.com/picoruby/picoruby/blob/master/mrbgems/picoruby-wasm/npm/picoruby/README.md](https://github.com/picoruby/picoruby/blob/master/mrbgems/picoruby-wasm/npm/picoruby/README.md)

## Funicular

**Funicular** is a single-page application (SPA) framework powered by PicoRuby.wasm.

- Write client-side code in Ruby instead of JavaScript
- Seamless Rails integration

See the next page for more details: [Getting Started with Funicular](/funicular)
