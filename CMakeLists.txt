cmake_minimum_required(VERSION 3.21)
project(starter)

find_package(GTest)
find_package(benchmark)
include(CTest)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
set(CMAKE_CXX_EXTENSIONS FALSE)
set(CMAKE_COMPILE_WARNING_AS_ERROR TRUE)

set(CMAKE_INSTALL_RPATH $ORIGIN/../lib)
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)
set(CMAKE_CXX_COMPILER_LAUNCHER ccache)

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=address,undefined,leak")
set(CMAKE_CXX_FLAGS_TSAN "${CMAKE_CXX_FLAGS_TSAN} -fsanitize=thread")

set(CMAKE_CXX_CLANG_TIDY "clang-tidy;-checks=-*,bugprone-*,cert-dcl21-cpp,cert-dcl50-cpp,cert-env33-c,cert-err34-c,cert-err52-cpp,cert-err60-cpp,cert-flp30-c,cert-msc50-cpp,cert-msc51-cpp,cppcoreguidelines-*,google-build-using-namespace,google-explicit-constructor,google-global-names-in-headers,google-readability-casting,google-runtime-int,google-runtime-operator,hicpp-*,-hicpp-vararg,misc-*,modernize-*,performance-*,readability-*,-readability-identifier-length,-misc-use-anonymous-namespace")

add_compile_options(-Wall -Wextra -Wpedantic -Werror)

add_executable(starter-benchmark src/starter.bench.cc)
target_link_libraries(starter-benchmark PRIVATE benchmark::benchmark)
add_test(starter-benchmark starter-benchmark)

add_executable(starter-test src/starter.test.cc)
target_link_libraries(starter-test PRIVATE GTest::gtest_main)
gtest_discover_tests(starter-test)

add_executable(starter src/starter.cc)
add_test(starter starter)

install(TARGETS starter)
install(IMPORTED_RUNTIME_ARTIFACTS starter RUNTIME_DEPENDENCY_SET s)
install(RUNTIME_DEPENDENCY_SET s)
