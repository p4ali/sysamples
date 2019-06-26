Questions

- High level component box, isolation, etc.
- Stream, http2?
- What's the benefits of using Wasm if still write in c++?

Alternative

- Lua Filter
- ebpf 

Different Language Support

How is each lang supported? Some shared common mechanism?

- A compilation tool chain to compile x lang to wasm, emscripten for C++, tinygo for golang.
- Some API hook provided on host environment (wasm module implemented) for inter-operatbility

- A C++ interface for managing different wasm runtime, v8, wabt each implements its own.
- Manager invoke the interface, create callbacks interactions setup.
  - How to read/write data btwn host and wasm vm.
  - Host calling Wasm: straighforward... wasm runtime impl.
  - Wasm calling host: how can this be done? who did it? stack switch and etc...
  - include "wasm-api/wasm.hh", [wasm-api](https://github.com/WebAssembly/wasm-c-api#design-goals)
  c api to make it runtime agnostic, another layer of isolation, v8 implements it.
  - wavm, we smash coupling in `wavm.cc` directly...

QA

- api/doc is heavily coupled http2/stream etc? current status? future tcp/listener filter? 

Links
 
- https://github.com/envoyproxy/envoy/issues/4272 
- https://github.com/WebAssembly/wasm-c-api
