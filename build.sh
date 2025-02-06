#!/usr/bin/env bash

set -eux

if [ ! -d build ]; then
    mkdir -p build
    cmake -G "Ninja Multi-Config" -S . -B build || rm -rf build
fi
if [ -d build ]; then
    config=Debug
    #config=TSan
    #config=Release
    cmake --build build --config ${config}
    cmake --test build --config ${config}
    cmake --install build --config ${config} --prefix install
fi
