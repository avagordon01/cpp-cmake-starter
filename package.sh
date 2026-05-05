#!/usr/bin/env bash

set -eux

config=${1:-Debug}

./build.sh ${config}

cmake --build build --config ${config} --target package
