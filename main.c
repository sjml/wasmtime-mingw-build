#include <stdio.h>

#include <wasm.h>
#include <wasmtime.h>

int main() {
    puts("Initializing WebAssembly engine...");
    wasm_engine_t *engine = wasm_engine_new();
    wasmtime_store_t *store = wasmtime_store_new(engine, NULL, NULL);

    puts("Cleaning up WebAssembly engine...");
    wasmtime_store_delete(store);
    wasm_engine_delete(engine);

    return 0;
}
