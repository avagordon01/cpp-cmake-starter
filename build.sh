#!/usr/bin/env bash

set -eux

mkdir -p build/{debug,release,tsan}
cmake -G Ninja -S . -B build/debug -DCMAKE_BUILD_TYPE=Debug
cmake -G Ninja -S . -B build/tsan -DCMAKE_BUILD_TYPE=TSan
cmake -G Ninja -S . -B build/release -DCMAKE_BUILD_TYPE=Release
cmake --build build/debug
cmake --build build/tsan
cmake --build build/release
cmake --install build/release --prefix packaged
