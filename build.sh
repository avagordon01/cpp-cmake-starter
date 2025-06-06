#!/usr/bin/env bash

set -eux

cmake -G "Ninja Multi-Config" -B build

config=${1:-Debug}

cmake --build build --config ${config}
cmake --install build --config ${config} --prefix install
