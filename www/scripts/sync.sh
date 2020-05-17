#!/bin/bash

set -e

npm run build
$(npm bin)/browser-sync start --no-open --port 3010 --ui-port 3011 -w true -s dist/dev &
$(npm bin)/browser-sync start --no-open --port 3012 --ui-port 3013 -w true -s dist/rel &
npm run watch
