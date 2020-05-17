#![cfg(target_arch = "wasm32")]

use wasm_bindgen_test::{wasm_bindgen_test, wasm_bindgen_test_configure};

wasm_bindgen_test_configure!(run_in_browser);

#[wasm_bindgen_test]
fn web_test() {
    js_sys::eval("window.temp = \"value\"").ok();
    let value = js_sys::eval("window.temp").unwrap().as_string().unwrap();
    assert_eq!(value, "value");
}
