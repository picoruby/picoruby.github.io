---
keywords: documentation
layout: page
tags: [tips]
title:  Tutorials
sidebar: picoruby_sidebar
permalink: r2p2-tutorials
folder: r2p2
---

### Tutorial of R2P2

#### 1-1 Getting start with R2P2

- Download the latest `R2P2-*.uf2` from [the releases page of the repository](https://github.com/picoruby/picoruby/releases)
- Drag and drop it into the RPI-RP2 drive
- Open a proper port in your terminal emulator. See also [terminal-emulator](/terminal-emulator)

<iframe width="560" height="315" src="https://www.youtube.com/embed/s4M4rBnPSus?si=--2VC4Od8wssmHUs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

#### 1-2 R2P2 shell has some UNIX-like commands

- Try some UNIX-like commands like `ls`, `mkdir` and `touch`

<iframe width="560" height="315" src="https://www.youtube.com/embed/ISU6TbIoIlQ?si=VL2SBugfvCiDQgXx" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

#### 1-3 R2P2 has PicoIRB

- Open PicoIRB with `irb` command

<iframe width="560" height="315" src="https://www.youtube.com/embed/2ZKpOOjzKJc?si=jisnwrIq8FRYuOWq" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

#### 2-1 LED blinking (L-chika) with PicoRuby

- Turn on the on-board LED using PicoIRB
- Note: If you use "Pico W" or "Pico 2 W", use `led = CYW43::GPIO.new(CYW43::GPIO::LED_PIN)`.CYW43 must be initialized with `CYW43.init` in advance

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

#### 3-4 ~~You can drag and drop your Ruby script from your laptop~~

**NOTE**: From PicoRuby version 3.4, this feature is no longer available. Use PicoRuby Web Terminal described in [terminal-emulator](/terminal-emulator) instead.

- This is what you want to do in a real development

<iframe width="560" height="315" src="https://www.youtube.com/embed/7nHNEUZnuKQ?si=ozardWECykiTqGU2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>


#### 3-5 /home/app.rb automatically starts Pi Pico

- Now your Pi Pico is a stand-alone device

<iframe width="560" height="315" src="https://www.youtube.com/embed/6_RomLChvYE?si=uc4Ec2GKRjLuXxBQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

