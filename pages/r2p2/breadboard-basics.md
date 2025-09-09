---
keywords: documentation
layout: page
tags: [tips]
title: Breadboard Basics
sidebar: picoruby_sidebar
permalink: breadboard-basics
folder: r2p2
---

![Breadboard](/images/breadboard.jpg)

Photo from [https://akizukidenshi.com/catalog/g/g100315/](https://akizukidenshi.com/catalog/g/g100315/)

## Breadboard Basics

Breadboard is a construction base for prototyping electronics.
It allows you to build circuits without soldering.
Understanding the internal connections is crucial for successful circuit building:

```
   +----+---+---+---+---+----+---+---+---+--...+-+---+-----+
 - |  - | - | - | - | - |    | - | - | - |  ...  | - | -   |  GND (Power Rail) - Horizontally Connected
 + |  + | + | + | + | + |    | + | + | + |  ...  | + | +   |  VDD (Power Rail) - Horizontally Connected
   ---------------------------------------------------------
   + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10+...+ 28+ 29+ 30+  Column Number
 j |   |   |   |   |   |   |   |   |   |   |...|   |   |   |  Component Area ┐
 i |   |   |   |   |   |   |   |   |   |   |...|   |   |   |  Component Area │
 h |   |   |   |   |   |   |   |   |   |   |...|   |   |   |  Component Area │ - Vertically Connected
 g |   |   |   |   |   |   |   |   |   |   |...|   |   |   |  Component Area │
 f |   |   |   |   |   |   |   |   |   |   |...|   |   |   |  Component Area ┘
   +---+---+---+---+---+---+---+---+---+---+...+---+---+---+  Central Divide
 e |   |   |   |   |   |   |   |   |   |   |...|   |   |   |  Component Area ┐
 d |   |   |   |   |   |   |   |   |   |   |...|   |   |   |  Component Area │
 c |   |   |   |   |   |   |   |   |   |   |...|   |   |   |  Component Area │ - Vertically Connected
 b |   |   |   |   |   |   |   |   |   |   |...|   |   |   |  Component Area │
 a |   |   |   |   |   |   |   |   |   |   |...|   |   |   |  Component Area ┘
   + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10+...+ 28+ 29+ 30+  Column Number
   ---------------------------------------------------------
 - |  - | - | - | - | - |    | - | - | - |  ...  | - | -   |  GND (Power Rail) - Horizontally Connected
 + |  + | + | + | + | + |    | + | + | + |  ...  | + | +   |  VDD (Power Rail) - Horizontally Connected
   +----+---+---+---+---+----+---+---+---+--...+-+---+-----+
```

**Power Rails:**
- The top and bottom rows marked with "-" (GND) are internally connected horizontally
- The rows next to them marked with "+" (VDD) are also internally connected horizontally
- These provide easy access to power and ground throughout your circuit

**Component Area:**
- The middle section (rows a to j) is divided into two halves by the central gap
- In each half, the five holes in each column ("a, b, c, d, e" or "f, g, h, i, j") are internally connected vertically
- Each column (1 to 30) is independent vertically
- For example, all five holes (from a to e) in column '1' are connected, but they're not connected to holes of column '2'

**Central Divide:**
- The gap in the middle serves as an isolation point between the two halves of the component area
- This allows you to place integrated circuits or other multi-pin components across the gap

This connection layout allows for flexible circuit design:
- You can easily distribute power using the top and bottom rails
- Components can be placed across the central divide
- Connections between components are made by placing their leads in the same row or by using jumper wires

Remember, understanding these connections is key to successfully building circuits on a breadboard without unintended short circuits or open connections.

