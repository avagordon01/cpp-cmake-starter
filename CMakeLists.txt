cmake_minimum_required(VERSION 3.21)
project(starter)

include(CTest)
include(GoogleTest)
include(FetchContent)
FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest
    GIT_TAG v1.16.0
    EXCLUDE_FROM_ALL
    SYSTEM
    OVERRIDE_FIND_PACKAGE
)
FetchContent_MakeAvailable(googletest)
set(BENCHMARK_ENABLE_TESTING OFF)
FetchContent_Declare(
    benchmark
    GIT_REPOSITORY https://github.com/google/benchmark
    GIT_TAG v1.9.2
    EXCLUDE_FROM_ALL
    SYSTEM
    OVERRIDE_FIND_PACKAGE
)
FetchContent_MakeAvailable(benchmark)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
set(CMAKE_CXX_EXTENSIONS FALSE)
set(CMAKE_COMPILE_WARNING_AS_ERROR TRUE)

set(CMAKE_INSTALL_RPATH $ORIGIN/../lib)
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)
set(CMAKE_CXX_COMPILER_LAUNCHER ccache)

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=address,undefined,leak")
set(CMAKE_CXX_FLAGS_TSAN "${CMAKE_CXX_FLAGS_TSAN} -fsanitize=thread")

add_compile_options(-Wall -Wextra -Wpedantic -Werror)
add_compile_options(-Wno-error=cpp)

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
