#!/usr/bin/env bash

set -eux

cmake -G "Ninja Multi-Config" -B build

config=Debug
#config=TSan
#config=Release
cmake --build build --config ${config}
ctest --test-dir build --build-config ${config}
cmake --install build --config ${config} --prefix install
