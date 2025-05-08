#!/usr/bin/env bash

set -eux

config=${1:-Debug}

./build.sh ${config}
ctest --test-dir build --build-config ${config}

./install/bin/starter
