#!/bin/bash

set -e

module="$1"
target="$2"
(
    cd ../wasm-"$module";
    cargo -q build --release --target wasm32-unknown-unknown
)

source="../target/wasm32-unknown-unknown/release/wasm_$module.wasm"
if [[ "$source" -nt "$target" ]]; then
    cp "$source" "$target"
    exit 0
else
    exit 1
fi
