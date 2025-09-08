---
keywords: documentation
layout: page
tags: [tips]
title:  Terminal Emulator Setup for PicoRuby Shell (R2P2)
sidebar: picoruby_sidebar
permalink: terminal-emulator
folder: r2p2
---

This page explains how to set up a serial terminal emulator to operate the R2P2 from a PC.

## Required Preparation

A **serial terminal emulator** is required for communication with microcontroller boards. Please follow the setup instructions below according to your operating system.

---

## Windows Environment

### Installing Tera Term

We recommend **Tera Term**. It's free, user-friendly, and ideal for serial communication on Windows.

1. Download from the [Tera Term official website](https://teratermproject.github.io/index-en.html)
2. Run the installer to complete setup

---

## Linux Environment

### Installing GTKTerm

We recommend **GTKTerm**. It's a lightweight, GUI-based serial terminal.

#### Ubuntu/Debian-based systems
```bash
sudo apt update
sudo apt install gtkterm
```

#### CentOS/RHEL/Fedora-based systems
```bash
# Fedora
sudo dnf install gtkterm

# CentOS/RHEL (requires EPEL repository)
sudo yum install epel-release
sudo yum install gtkterm
```

---

## macOS Environment

Unfortunately, macOS has very few excellent serial terminal emulators. Please choose from the following options:

### Option 1: screen (Simple method)

Using the **screen** command.

> **Note**: The screen command may cause display issues with the PicoRuby shell (R2P2), such as garbled text or formatting problems.

#### Installation
```bash
# Using Homebrew
brew install screen

# Using MacPorts
sudo port install screen
```

### Option 2: Ubuntu in Virtual Environment (Recommended)

**We strongly recommend this option for a more stable environment.**

1. Create a virtual machine using **VirtualBox** or **VMware**
2. Install **Ubuntu Desktop**
3. Install GTKTerm within the virtual environment:
   ```bash
   sudo apt update
   sudo apt install gtkterm
   ```

> **Note**: When using a virtual environment, you need to configure USB serial device passthrough to the virtual machine.

---

## Serial Port Connection Methods

### Tera Term (Windows)

1. Launch Tera Term
2. In the "New Connection" dialog, select "Serial"
3. Choose the port number (usually COM3, COM4, etc.)
4. Click "OK"
5. Set the following in Menu → "Setup" → "Serial port":
   - **Baud rate**: 115200
   - **Data bits**: 8
   - **Parity**: None
   - **Stop bits**: 1
   - **Flow control**: None
6. Set line ending in Menu → "Setup" → "Terminal":
   - **New-line**: **Receive**: LF, **Transmit**: LF

### GTKTerm (Linux/Virtual Ubuntu)

1. Launch GTKTerm
2. Configure in Menu → "Configuration" → "Port":
   - **Port**: `/dev/ttyUSB0` or `/dev/ttyACM0` (depending on device)
   - **Baud Rate**: 115200
   - **Parity**: None
   - **Bits**: 8
   - **Stopbits**: 1
   - **Flow control**: None
3. Configure line endings in Menu → "Configuration" → "CR LF auto":
   - Enable **LF auto** (to handle line endings properly)
4. Click "OK" to connect

### screen (macOS)

1. Check devices:
   ```bash
   ls /dev/cu.*
   ```
2. Connect with screen:
   ```bash
   screen /dev/cu.usbserial-XXXXXX 115200
   ```
   (Replace XXXXXX with the actual device name)
3. Configure line endings by pressing `Ctrl+A` followed by `:` and enter:
   ```
   crlf off
   ```
4. To exit, press `Ctrl+A` followed by `K`, then confirm with `y`

---

## Troubleshooting

### Device not recognized

- **Windows**: Check COM ports in Device Manager
- **Linux**: Check USB device recognition with `dmesg | tail`
- **macOS**: Check devices with `ls /dev/cu.*`

### Permission errors (Linux)

Add user to dialout group:
```bash
sudo usermod -a -G dialout $USER
```
Logout and login required after this setting.

---

## For Workshop Participants: What to Bring on the Day

- Laptop (with setup completed as above)
- USB Cable
  - **Microcontroller side**: Micro-B (Raspberry Pi Pico at EuRuKo 2024 and 2025) or USB-C (M5Stack at mruby Girls Matsue 2025)
  - **PC side**: Compatible with your laptop (Type-A, Type-C, etc.)
  - **Required**: Data communication capable (charging-only cables won't work)
  
> **Important**: While the organizers will also provide USB cables, **we recommend bringing your own for peace of mind**. Many recent laptops have only Type-C ports, so please bring appropriate adapter cables or hubs.

- Glasses: Workshop will be detailed work, so bring glasses if you are not confident in your eyesight
- Tweezers: Not required, but for handling small components, they will be very helpful

## Questions & Support

If you encounter any issues during setup, please let us know before the workshop begins. We'll solve it together!
