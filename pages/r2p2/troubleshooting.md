---
keywords: documentation
layout: page
tags: [tips]
title:  Troubleshooting
sidebar: picoruby_sidebar
permalink: troubleshooting
folder: r2p2
---

## Troubleshooting

### If R2P2 hang up (sorry for a bug😓)
- Plug off, wait 3 seconds, and plug in again

### NoMethodError???

Picoruby is a small implementation for limited resources.
It has less classes and methods than your usual CRuby.
You can check API documentation here: https://picoruby.github.io/Array.html

### If you `app.rb` doesn't work as you wish and you get lost control of Raspi Pico

- If you put `/home/app.rb` in your R2P2, it will run automatically at startup. But sometimes it may not work as you wish and you may get lost control of R2P2 shell.
- At startup of R2P2, pressing "S" key will skip running the `app.rb` and R2P2 shell will be in control

  ![](/images/skip-apprb.png)

### When you're stuck in a dead end, it may be ROM corruption

See [R2P2 ROM corruption on RP2040/RP2350](/rom-corruption)
