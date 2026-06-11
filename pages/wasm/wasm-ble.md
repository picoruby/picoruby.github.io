---
keywords: documentation
layout: page
tags: [wasm, webassembly, bluetooth, ble]
title: PicoRuby.wasm BLE
sidebar: picoruby_sidebar
permalink: wasm-ble
folder: wasm
---

PicoRuby.wasm can use the browser's Web Bluetooth API through `JS::BLE::GATT` and `JS::BLE::UART`.

Use `JS::BLE::GATT` when you want to work directly with BLE services and characteristics. Use `JS::BLE::UART` when your device exposes a UART-like service such as Nordic UART Service (NUS), or when you want a small IO-compatible wrapper around a pair of TX/RX characteristics.

Web Bluetooth is a browser API, so the usual browser restrictions apply:

- It works only in browsers that support Web Bluetooth.
- The page must be served from a secure context such as HTTPS or `localhost`.
- Device selection must start from a user gesture such as a button click.
- The browser shows its own device picker. Ruby code cannot silently choose a nearby device.

## GATT

`JS::BLE::GATT.request_device` opens the browser picker and returns a `Device` wrapper. From there, connect to the GATT server, get a service, then get a characteristic.

```ruby
require 'js'

button = JS.document.getElementById('connect')
log = JS.document.getElementById('log')

button.addEventListener('click') do |_event|
  svc_uuid = '0xffe0'
  char_uuid = '0xffe1'

  $device = JS::BLE::GATT.request_device(optional_services: [svc_uuid])
  server = $device.connect
  service = server.service(svc_uuid)
  $char = service.characteristic(char_uuid)

  $char.on_change do |data|
    log[:textContent] = log[:textContent].to_s + "notify: #{data.inspect}\n"
  end

  $char.start_notify
  $char.write("hello")

  $device.on_disconnected do
    log[:textContent] = log[:textContent].to_s + "disconnected\n"
  end
end
```

Characteristic values are Ruby `String` objects. They may contain binary bytes, so prefer `bytes`, `bytesize`, `byteslice`, or protocol-specific parsing instead of assuming UTF-8 text.

Useful methods:

- `JS::BLE::GATT.request_device(name:, name_prefix:, services:, optional_services:)`
- `device.connect`, `device.disconnect`, `device.connected?`, `device.on_disconnected`
- `server.service(uuid)`
- `service.characteristic(uuid)`
- `characteristic.read`, `characteristic.write(data, without_response:)`
- `characteristic.on_change`, `characteristic.start_notify`, `characteristic.stop_notify`

UUID strings starting with `0x` are converted to 16-bit UUID integers for Web Bluetooth. Full UUID strings and assigned-name strings are passed through as strings.

## UART

`JS::BLE::UART` is a higher-level wrapper that connects, starts notifications, and stores incoming bytes in an internal receive buffer. By default it uses Nordic UART Service UUIDs.

```ruby
require 'js'

button = JS.document.getElementById('connect-uart')
log = JS.document.getElementById('log')

button.addEventListener('click') do |_event|
  $uart = JS::BLE::UART.new
  log[:textContent] = "connected to #{$uart.device.name || '(unnamed)'}\n"

  $uart.puts("hello")

  Task.new do
    while $uart.connected?
      if $uart.available?
        data = $uart.read_nonblock(64)
        log[:textContent] = log[:textContent].to_s + "rx: #{data.inspect}\n" if data
      end
      sleep 0.05
    end
  end
end
```

For a device that uses one characteristic for both TX and RX, pass the same UUID to `tx_uuid:` and `rx_uuid:`.

```ruby
$uart = JS::BLE::UART.new(
  service_uuid: '0xffe0',
  tx_uuid: '0xffe1',
  rx_uuid: '0xffe1'
)
```

Useful methods:

- `JS::BLE::UART.new(service_uuid:, tx_uuid:, rx_uuid:, name:, name_prefix:)`
- `uart.write(data)`, `uart.puts(data)`
- `uart.read(nbytes, timeout:)`, `uart.gets(timeout:)`, `uart.read_nonblock(nbytes)`
- `uart.available`, `uart.available?`, `uart.connected?`, `uart.close`

## Examples

The PicoRuby.wasm demo directory has working examples:

- [`ble_demo.html`](https://github.com/picoruby/picoruby/tree/master/mrbgems/picoruby-wasm/demo/www/ble_demo.html) shows direct GATT read, write, and notify.
- [`ble_uart_demo.html`](https://github.com/picoruby/picoruby/tree/master/mrbgems/picoruby-wasm/demo/www/ble_uart_demo.html) shows the `JS::BLE::UART` wrapper.
- [`ble_irb_demo.html`](https://github.com/picoruby/picoruby/tree/master/mrbgems/picoruby-wasm/demo/www/ble_irb_demo.html) and [`ble_ota_demo.html`](https://github.com/picoruby/picoruby/tree/master/mrbgems/picoruby-wasm/demo/www/ble_ota_demo.html) show larger BLE UART workflows.
