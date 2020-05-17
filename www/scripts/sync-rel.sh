#!/bin/bash

set -e

npm run build
$(npm bin)/browser-sync start -w true -s dist/rel &
npm run watch-rel
