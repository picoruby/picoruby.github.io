// @bjorn3/browser_wasi_shim v0.4.2
// Licensed under MIT OR Apache-2.0; this project uses it under the MIT License.
// Source: https://github.com/bjorn3/browser_wasi_shim
import { WASI } from "https://cdn.jsdelivr.net/npm/@bjorn3/browser_wasi_shim@0.4.2/dist/index.js";
import { lexPrism } from "./lexPrism.js";

const wasm = await WebAssembly.compileStreaming(
  fetch("https://cdn.jsdelivr.net/npm/@ruby/prism@1.9.0/src/prism.wasm")
);

// Prism's browser example uses a WASI shim because not all browsers support WASI yet.
// The shim provides the wasi_snapshot_preview1 imports needed to instantiate prism.wasm.
const wasi = new WASI([], [], []);
const instance = await WebAssembly.instantiate(wasm, {
  wasi_snapshot_preview1: wasi.wasiImport,
});

wasi.initialize(instance);

window.lexPrism = (source) => lexPrism(instance.exports, source);
window.prismReady = true;
