---
keywords: documentation
layout: page
tags: [tips]
title:  Setup & General Information
sidebar: picoruby_sidebar
permalink: setup
folder: r2p2
---

This section describes how to set up R2P2 and provides general information for R2P2 newbies.

## **IMPORTANT**: Laptop Security Settings

If your laptop is configured to prohibit writing to USB memory devices, likely due to your company's security policy, it will not function😣

### Mac Issues

- From our experience, Mac laptops occasionally encounter issues during the workshop
- We are unsure of the specific models that may have problems. Both Intel Macs and M1/M2/M3 Macs have had issues in the past
- Please be aware that we will not be able to know if your Mac will work until the day of the workshop

## Install R2P2 into Raspi Pico

There are two ways to download the R2P2 binary:

### Method 1: Automated Download (Recommended)

First, navigate to the directory where you want to download the binary:

```sh
cd path/to/your/directory
```

Then run the following command in your terminal:

<div style="position: relative; margin: 16px 0;">
<pre style="position: relative; margin: 0;"><code>curl -fsSL https://picoruby.org/r2p2-latest.sh | sh</code></pre>
<button onclick="copyToClipboard('curl -fsSL https://picoruby.org/r2p2-latest.sh | sh')" style="position: absolute; top: 8px; right: 8px; padding: 5px 10px; background-color: #0366d6; color: white; border: none; border-radius: 3px; cursor: pointer; font-size: 12px;">Copy</button>
</div>

<span id="copy-feedback" style="color: green; font-size: 12px; display: none;">Copied to clipboard!</span>

<script>
function copyToClipboard(text) {
  navigator.clipboard.writeText(text).then(function() {
    var feedback = document.getElementById('copy-feedback');
    feedback.style.display = 'inline';
    setTimeout(function() {
      feedback.style.display = 'none';
    }, 2000);
  }).catch(function(err) {
    alert('Failed to copy: ' + err);
  });
}
</script>

This script will:
- Display available binaries for Raspberry Pi Pico series
- Download the selected binary from GitHub and decompress it in the current directory automatically

**For downloadable options, see the image in the section below.**

### Method 2: Manual Download

- Download the latest *R2P2-PICORUBY-\*.uf2* from GitHub [https://github.com/picoruby/R2P2/releases/latest](https://github.com/picoruby/R2P2/releases/latest) (Of course, unzip or tar it)

  ![*-PICO-*.ufs for Raspi Pico (works on Pico W but no wireless feature. *-PICO2_W-*.uf2 for Pico 2 W (works on Pico 2)](/images/download-r2p2.png)

### Install the UF2 File

Regardless of which download method you used, you need to manually install the UF2 file to your Pi Pico:

- Connect Pi Pico and PC while\\npressing the BOOTSEL button. Then you'll find *RPI-RP2* (for Raspi Pico) or *RP2350* (for Pico2) drive in file manager (File Explorer or Finder)

  ![](/images/bootsel-button.png)

- Drag & drop *R2P2-\*.uf2* into RPI-RP2 drive

  ![](/images/drag-and-drop.png)

- You'll find "R2P2" drive (sometimes naming the drive fails and it shows "USB Drive" or something like that. But it would be working anyway)

  ![](/images/r2p2-drive.png)

- Open a proper serial port on the terminal emulator. Information about terminal emulators can be found in [/terminal-emulator](/terminal-emulator)

  ![](/images/open-com-port.png)

- If you could see a screen like this, congrats, now you are at the gate🎉

  ![](/images/r2p2.png)

  - R2P2 shell is a Unix-like shell, so you can use commands like `ls`, `cd`, `cat`, `rm`, etc.
  - `irb` command starts an interactive Ruby shell

Congratulations! Now you at the gate!

Before starting to dig into R2P2, we would like you to **stargaze** at the [picoruby/picoruby](https://github.com/picoruby/picoruby) repo🌟

