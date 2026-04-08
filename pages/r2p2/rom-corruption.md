---
keywords: documentation
layout: page
tags: [tips]
title: R2P2 ROM Corruption on RP2040/RP2350
sidebar: picoruby_sidebar
permalink: rom-corruption
folder: r2p2
---

## Use the `flash_nuke.uf2`

R2P2 formats part of the flash ROM as a storage device during its first startup and generates the directories and files necessary for the system.
This process sometimes fails, causing R2P2 to become uncontrollable or behave strangely.

If this happens, download `flash_nuke.uf2` from the page below and install it on the *RPI-RP2* (for Pico) or *RP2350* (for Pico2) drive that shows at reboot with BOOTSEL button.

[https://www.raspberrypi.com/documentation/microcontrollers/pico-series.html#resetting-flash-memory](https://www.raspberrypi.com/documentation/microcontrollers/pico-series.html#resetting-flash-memory)

Since the microcontroller's ROM will be zero-cleared, install R2P2 again.

Even in cases other than the above, if you feel that the ROM has become corrupted, use `flash_nuke.uf2` to initialize the microcontroller.
