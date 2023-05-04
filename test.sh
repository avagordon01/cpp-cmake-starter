#!/usr/bin/env bash

set -eux

./build.sh

./build/debug/starter-test
./build/tsan/starter-test
./build/release/starter-benchmark

./build/release/starter
