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

### PicoRuby.wasm

PicoRuby port to WebAssembly.

- [https://www.npmjs.com/package/@picoruby/wasm-wasi](https://www.npmjs.com/package/@picoruby/wasm-wasi)

### PRK Firmware

Firmware framework for DIY keyboards.

- [https://github.com/picoruby/prk_firmware](https://github.com/picoruby/prk_firmware)
- [KBD.news] PRK firmware: PRK is a PicoRuby-based keyboard firmware running on RP2040 chips. [https://kbd.news/PRK-firmware-1370.html](https://kbd.news/PRK-firmware-1370.html)

### R2P2

Microcontroller programming framework.

- For Raspberry Pi Pico: [https://github.com/picoruby/R2P2](https://github.com/picoruby/R2P2)
- For ESP32: [https://github.com/picoruby/R2P2-ESP32](https://github.com/picoruby/R2P2-ESP32)

#### Porting

|           |Raspi Pico|Raspi Pico W|ESP32|
|-----------|----------|------------|-----|
|picoruby-adc|✓|✓|✓|
|picoruby-ble| |✓| |
|picoruby-cyw43| |✓| |
|picoruby-env|✓|✓|✓|
|picoruby-filesystem-fat|✓|✓|✓|
|picoruby-gpio|✓|✓|✓|
|picoruby-i2c|✓|✓|✓|
|picoruby-io-console|✓|✓|✓|
|picoruby-machine|✓|✓|✓|
|picoruby-net| |✓| |
|picoruby-pwm|✓|✓|✓|
|picoruby-rng|✓|✓|✓|
|picoruby-spi|✓|✓|✓|
|picoruby-uart|✓|✓|✓|
|picoruby-watchdog|✓|✓| |

### Tutorial of R2P2

#### 1-1 Getting start with R2P2

- Download the latest `R2P2-*.uf2` from [the releases page of the repository](https://github.com/picoruby/R2P2/releases)
- Drag and drop it into the RPI-RP2 drive
- Open a proper port in your terminal emulator
- Check if the ROM is sane. See [R2P2 ROM corruption on RP2040/RP2350](rom-corruption)

<iframe width="560" height="315" src="https://www.youtube.com/embed/s4M4rBnPSus?si=--2VC4Od8wssmHUs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

#### 1-2 R2P2 shell has some UNIX-like commands

- Try some UNIX-like commands like `ls`, `mkdir` and `touch`

<iframe width="560" height="315" src="https://www.youtube.com/embed/ISU6TbIoIlQ?si=VL2SBugfvCiDQgXx" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

#### 1-3 R2P2 has PicoIRB

- Open PicoIRB with `irb` command

<iframe width="560" height="315" src="https://www.youtube.com/embed/2ZKpOOjzKJc?si=jisnwrIq8FRYuOWq" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

#### 2-1 LED blinking (L-chika) with PicoRuby

- Turn on the on-board LED using PicoIRB
- If you use "Pico W", write `led = CYW43::GPIO.new(CYW43::GPIO::LED_PIN)` but CYW43 must be initialized first with `CYW43.init`

<iframe width="560" height="315" src="https://www.youtube.com/embed/qbs25xDu7t8?si=zcAU2jCnh-boiyow" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

#### 2-2 `require "adc"` loads ADC class

- You can load pre-built libraries like "picoruby-adc" and use ADC class

<iframe width="560" height="315" src="https://www.youtube.com/embed/dPGCyQrX6Zg?si=jHUfKimEBT-Hy7qP" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

#### 3-1 PicoIRB has multi-line editor!

- That's cool, right?

<iframe width="560" height="315" src="https://www.youtube.com/embed/PVkP_uNBOo0?si=wDVw0IofVLliIoxQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

#### 3-2 PicoRuby has Time class working with RTC in MCU

- The clock will be persistent if you connect a battery-driven RTC module. Try it :)

<iframe width="560" height="315" src="https://www.youtube.com/embed/0uj4m4RI7lE?si=r-2cBloVC9x_YsTZ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

#### 3-3 You can even use a Vim-like editor in R2P2

- It's not for a serious usage but for demonstrating the viability of PicoRuby ;)

<iframe width="560" height="315" src="https://www.youtube.com/embed/X1RdA6IE780?si=IQwKJFjDSUemjCde" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

#### 3-4 You can drag and drop your Ruby script from your laptop

- This is what you want to do in a real development

<iframe width="560" height="315" src="https://www.youtube.com/embed/7nHNEUZnuKQ?si=ozardWECykiTqGU2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

#### 3-5 /home/app.rb automatically starts Pi Pico

- Now your Pi Pico is a stand-alone device

<iframe width="560" height="315" src="https://www.youtube.com/embed/6_RomLChvYE?si=uc4Ec2GKRjLuXxBQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

