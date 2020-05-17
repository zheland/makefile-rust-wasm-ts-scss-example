import wasm_init from "./wasm_sync";

const wasm = wasm_init();
document.addEventListener("DOMContentLoaded", _ => {
    wasm.then(wasm => {
        document.body.className = "bg-second";
        wasm.start();
        wasm.greet();
        document.body.className = "bg-third";
    });
});
