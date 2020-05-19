# Web application example with Makefile, Rust-generated WASM, TypeScript and SCSS

## About

This is an example of Web application built with Makefile that includes:
* JS compiled from TypeScript with bable and browserify
* CSS compiled from SCSS, compressed, minified and uglified
* Rust-generated WebAssembly run synchronously and asynchronously with WebWorker

Other features:
* Incremental compilation
* Dev and release builds
* Synchronised browser testing with browser-sync
* TypeScript SourceMap generation.
* Rust test templates for testing in node and in browser

JS and WASM interaction:
* `app.ts` imports `sync.ts` and create Worker with `async.ts`.
* `sync.ts` and `async.ts` call WASM functions with static type checking.
* WASM code call JS functions from `js-api.ts`.


## Requirements

This example require UNIX-like environment, like Linux, WSL, Cygwin etc.


## Setup

Run `bash setup.sh` to install rust and npm,
build wasm package for npm and initialize npm package.


## Usage

The project uses npm-scripts for building and testing (specified in www/package.json), for example:
* `cd www && npm run build` to build application in development and production mode to `www/dist/dev` and `www/dist/rel`.
* `cd www && sync-dev` to continiously rebuild application in development mode and launch the browser with a real-time reload of the files being modified.
* `cd www && test-chrome` to test wasm code locally, in node environment and in headless chrome browser.

Full list of npm scripts:
`clean`,
`build`,
`build-dev`,
`build-rel`,
`rebuild`,
`build-parallel`,
`build-dev-parallel`,
`build-rel-parallel`,
`rebuild-parallel`,
`watch`,
`watch-dev`,
`watch-rel`,
`sync-dev`,
`sync-rel`,
`sync`,
`test-node`,
`test-chrome`,
`test-firefox`,
`test-safari`


## License

Licensed under either of

* Apache License, Version 2.0,
  ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
* MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)

at your option.


### Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license,
shall be dual licensed as above, without any
additional terms or conditions.
