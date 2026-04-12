---
title: Introduction
keywords: PicoRuby documentation
tags: [introduction]
sidebar: picoruby_sidebar
permalink: index.html
summary: PicoRuby is the smallest Ruby implementation for one-chip microcontrollers.
---

## Presentation

<iframe width="560" height="315" src="https://www.youtube.com/embed/WiJC_v5Lus8?si=eZYU-ZcnVqaG7ZCW" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Products by PicoRuby

### R2P2

Microcontroller programming framework.

- See [Getting Start with R2P2](/setup)

#### Implementations

- For Raspberry Pi Pico: [https://github.com/picoruby/picoruby/tree/master/mrbgems/picoruby-r2p2](https://github.com/picoruby/picoruby/tree/master/mrbgems/picoruby-r2p2)
- For ESP32: [https://github.com/picoruby/R2P2-ESP32](https://github.com/picoruby/R2P2-ESP32)

#### Porting for peripherals and networking

|           |Raspi Pico|Raspi Pico W|ESP32|
|-----------|----------|------------|-----|
|picoruby-adc|✓|✓|✓|
|picoruby-ble| |✓| |
|picoruby-cyw43| |✓| |
|picoruby-env|✓|✓|✓|
|picoruby-gpio|✓|✓|✓|
|picoruby-i2c|✓|✓|✓|
|picoruby-io-console|✓|✓|✓|
|picoruby-irq|✓|✓|✓|
|picoruby-littlefs|✓|✓|✓|
|picoruby-machine|✓|✓|✓|
|picoruby-net-http| |✓|✓|
|picoruby-net-mqtt| |✓|✓|
|picoruby-net-ntp| |✓|✓|
|picoruby-net-websocket| |✓|✓|
|picoruby-pwm|✓|✓|✓|
|picoruby-rng|✓|✓|✓|
|picoruby-spi|✓|✓|✓|
|picoruby-uart|✓|✓|✓|
|picoruby-watchdog|✓|✓| |

### PicoRuby.wasm

PicoRuby port to WebAssembly.

- See [wasm](/wasm)
- [https://www.npmjs.com/package/@picoruby/wasm-wasi](https://www.npmjs.com/package/@picoruby/wasm-wasi)

### PRK Firmware (deprecated)

Firmware framework for DIY keyboards.

- [https://github.com/picoruby/prk_firmware](https://github.com/picoruby/prk_firmware)
- [KBD.news] PRK firmware: PRK is a PicoRuby-based keyboard firmware running on RP2040 chips. [https://kbd.news/PRK-firmware-1370.html](https://kbd.news/PRK-firmware-1370.html)

**NOTE:** As of 2026, PRK Firmware is no longer maintaind. Use Keyboard class in R2P2 instead. See [https://github.com/picoruby/picoruby/tree/master/mrbgems/picoruby-keyboard](https://github.com/picoruby/picoruby/tree/master/mrbgems/picoruby-keyboard)
