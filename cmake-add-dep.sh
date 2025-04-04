#!/bin/sh

set -eu

repo="$1/$2"
repo_org="$1"
repo_name="$2"

tag=$(
    curl --silent -m 10 --connect-timeout 5 "https://api.github.com/repos/$repo/releases/latest" |
    jq -r ".tag_name"
)

if (rg "FetchContent_MakeAvailable\($repo_name\)"); then
    echo "dependency $repo already found in CMakeLists.txt"
else
    template=$(mktemp)

    echo "FetchContent_Declare(
    $repo_name
    GIT_REPOSITORY https://github.com/$repo
    GIT_TAG $tag
    EXCLUDE_FROM_ALL
    SYSTEM
    OVERRIDE_FIND_PACKAGE
)
FetchContent_MakeAvailable($repo_name)
" > $template

sed -i "/include(FetchContent)/r $template" CMakeLists.txt
fi

graph=$(mktemp)
cmake --graphviz=$graph build
rg --only-matching --no-line-number "\w*::\w*" $graph | sort -u
