#!/usr/bin/env bash

set -eux

./build.sh

ctest --test-dir ./build/debug
ctest --test-dir ./build/tsan
ctest --test-dir ./build/release

./build/release/starter
