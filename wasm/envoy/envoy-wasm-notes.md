# Wasm Study Notes

An implementation study notes for a developer.

Benefits

- Release decouple
- Different language
- Alternative, Lua Filter, ebpf.

## Concepts

Components

- Wasm Plugin, written in a different language, Go, C++, Rust.
- Wasm Plugin Compiler, a compilation tool chain to compile x lang to wasm, emscripten for C++, tinygo for golang.
- Wasm Pluggable Runtime, a C++ interface for managing different wasm runtime, v8, wabt each implements its own, compiled with native Envoy.
- Per language API hook provided on host environment (wasm module implemented) for inter-operatbility.

## Current status

- Stream, http2
- Several Wasm Runtime, V8, WAVM.
- C++/Rust implementation.

## Code pointer

- cpp api, `api/wasm/cpp/proxy_wasm_impl.h`
- implementation, `source/extensions/common/wasm/`

Links

- https://github.com/envoyproxy/envoy/issues/4272 
- https://github.com/WebAssembly/wasm-c-api

## Understand VM call Host

`Context` object wrapper.

- Host Wasm lib reference struct directly.
- Wasm how to get that reference?
  - `source/extensions/common/wasm/wasm.cc` declare local var.
  QA: is this host or compiled to wasm module? cpp API seems calling function to
  those directly...

- `v8.cc` code runs along with the host, shim btwn module and host.
  - `link` compile and handles the `function_maper_`, later invocation from there.

Try README for cpp first...

## Go API

- Interface API in Go
- Implement Go API by converting them to Wasm module call. Context object is
needed for talking to host function.

## Misc

- Manager invoke the interface, create callbacks interactions setup.
  - How to read/write data btwn host and wasm vm.
  - Host calling Wasm: straighforward... wasm runtime impl.
  - Wasm calling host: how can this be done? who did it? stack switch and etc? How each lang
  API is provided?
  - include "wasm-api/wasm.hh", [wasm-api](https://github.com/WebAssembly/wasm-c-api#design-goals)
  c api to make it runtime agnostic, another layer of isolation, v8 implements it.
  - wavm, we smash coupling in `wavm.cc` directly...
