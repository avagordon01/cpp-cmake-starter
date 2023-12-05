cmake_minimum_required(VERSION 3.21)
project(starter)
include(CTest)

find_package(GTest)

include(FetchContent)
FetchContent_Declare(googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG v1.13.0
)
FetchContent_Declare(googlebenchmark
    GIT_REPOSITORY https://github.com/google/benchmark.git
    GIT_TAG v1.7.1
)
FetchContent_MakeAvailable(
    googletest
    googlebenchmark
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
set(CMAKE_CXX_EXTENSIONS FALSE)

set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)
set(CMAKE_CXX_COMPILER_LAUNCHER ccache)

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=address,undefined")
set(CMAKE_CXX_FLAGS_TSAN "${CMAKE_CXX_FLAGS_TSAN} -fsanitize=thread")

set(CMAKE_CXX_CLANG_TIDY "clang-tidy;-checks=-*,bugprone-*,cert-dcl21-cpp,cert-dcl50-cpp,cert-env33-c,cert-err34-c,cert-err52-cpp,cert-err60-cpp,cert-flp30-c,cert-msc50-cpp,cert-msc51-cpp,cppcoreguidelines-*,-cppcoreguidelines-macro-usage,-cppcoreguidelines-pro-type-reinterpret-cast,-cppcoreguidelines-pro-type-union-access,-cppcoreguidelines-pro-bounds-pointer-arithmetic,-cppcoreguidelines-pro-type-vararg,google-build-using-namespace,google-explicit-constructor,google-global-names-in-headers,google-readability-casting,google-runtime-int,google-runtime-operator,hicpp-*,-hicpp-vararg,misc-*,modernize-*,performance-*,readability-*,-readability-named-parameter")

add_compile_options(-Wall -Wextra -Wpedantic -Werror)

add_executable(starter-benchmark src/starter.bench.cc)
target_link_libraries(starter-benchmark PRIVATE benchmark::benchmark)

add_executable(starter-test src/starter.test.cc)
target_link_libraries(starter-test PRIVATE GTest::gtest_main)
gtest_discover_tests(starter-test)

add_executable(starter src/starter.cc)
install(TARGETS starter)

install(RUNTIME_DEPENDENCY_SET starter)
