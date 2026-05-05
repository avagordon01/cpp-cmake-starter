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
