#!/bin/bash

set -e

function has() {
    type $1 > /dev/null 2>&1
}

function run() {
    echo "+ $*"
    "$@"
}

! has "rustup" && {
    run curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}
has "sudo" && has "apt" && ! has "npm" && {
    run curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
    run sudo apt install -y nodejs
}
has "sudo" && has "apt" && ! has "make" && {
    run sudo apt install -y build-essential
}

run rustup self update
run rustup update
run rustup target add wasm32-unknown-unknown
run cargo install wasm-pack
run cargo install cargo-local-install
run cargo local-install wasm-bindgen-cli --version 0.2.74 --unlocked --root tools

npm_local_version=$(npm list -g npm --depth=0 | grep -oP "(?<=@)[\w-\.]*")
npm_last_version=$(npm show npm version)
has "sudo" && [ "$npm_local_version" != "$npm_last_version" ] && {
    run sudo npm install -g npm@latest
}

( cd www && npm install )
