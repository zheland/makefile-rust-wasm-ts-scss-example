import wasm_init from "./wasm_async";

wasm_init().then(wasm => {
    wasm.start();
    wasm.greet();
})
