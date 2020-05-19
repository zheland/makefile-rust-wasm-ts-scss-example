#!/bin/bash

set -e

module="$1"
target="$2"
profile="$3"
output="$4"
(
    cd "../wasm-$module"
    cargo -q build $profile --target wasm32-unknown-unknown
)

source="../target/wasm32-unknown-unknown/$output/wasm_$module.wasm"
if [[ "$source" -nt "$target" ]]; then
    cp "$source" "$target"
    exit 0
else
    exit 1
fi
