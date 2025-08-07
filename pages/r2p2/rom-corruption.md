---
keywords: documentation
layout: page
tags: [tips]
title: R2P2 ROM corruption on RP2040/RP2350
sidebar: picoruby_sidebar
permalink: rom-corruption
folder: r2p2
---

R2P2 formats part of the flash ROM as a FAT disk during its first startup and generates the directories and files necessary for the system.
This process may sometimes fail, so please follow the steps below to verify that initialization has been successful.

- Start R2P2 and connect to a terminal emulator
- If initialization is complete, regardless it's successful or not, the shell should be running
- Execute the `reboot` command here
- The microcontroller will restart, and R2P2's initialization process should be displayed on the terminal
- At this time, file integrity checks may fail as shown in the image below

  ![](/images/r2p2-init-failure.png)

- If this happens, please `reboot` again
- If the same file check fails again, of if another file fails, it is suspected that the flash ROM state has become corrupted
- Download `flash_nuke.uf2` from the page below and install it on the microcontroller

    [https://www.raspberrypi.com/documentation/microcontrollers/pico-series.html#resetting-flash-memory](https://www.raspberrypi.com/documentation/microcontrollers/pico-series.html#resetting-flash-memory)

- Since the microcontroller's ROM will be zero-cleared, install R2P2 again and repeat this procedure until all checks pass as shown in the image below

  ![](/images/r2p2-init-success.png)

Even in cases other than the above, if you feel that the ROM has become corrupted, please refer to this procedure to initialize the microcontroller.
