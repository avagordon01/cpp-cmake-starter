#!/usr/bin/env bash

set -euxo pipefail

./test.sh Debug
./test.sh TSan
./test.sh Release

#clang-tidy is a superset of clang-check
#run-clang-tidy runs on all files in the compile_commands.json
run-clang-tidy -p build -format -style file

find src -iname '*.h' -o -iname '*.cc' | xargs clang-format --dry-run --Werror
