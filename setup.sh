#!/bin/bash

set -ex

if ! type "rustup" > /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
if type "apt" > /dev/null; then
    if ! type "npm" > /dev/null; then
        curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
        sudo apt install -y nodejs
    fi
    if ! type "make" > /dev/null; then
        sudo apt install -y build-essential
    fi
fi

rustup self update
rustup update
rustup target add wasm32-unknown-unknown
cargo install wasm-pack
cargo install wasm-bindgen-cli

if type "sudo" > /dev/null; then
    npm_local_version=$(npm list -g npm --depth=0 | grep -oP "(?<=@)[\w-\.]*")
    npm_last_version=$(npm show npm version)
    if [ "$npm_local_version" != "$npm_last_version" ]; then
        sudo npm install -g npm@latest
    fi
fi

( cd www && npm install )
