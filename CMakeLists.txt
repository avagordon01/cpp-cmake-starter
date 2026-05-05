cmake_minimum_required(VERSION 3.21)
project(starter)

include(CTest)
include(CPack)
include(FetchContent)
include(GoogleTest)

include(cmake/external-dependencies.cmake)

set(CMAKE_CONFIGURATION_TYPES Debug Release TSan)
set(CMAKE_CXX_FLAGS[variant=Debug] "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=address,undefined,leak")
set(CMAKE_CXX_FLAGS[variant=TSan] "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=thread")

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
set(CMAKE_CXX_EXTENSIONS FALSE)
set(CMAKE_COMPILE_WARNING_AS_ERROR TRUE)

set(CMAKE_INSTALL_RPATH $ORIGIN/../lib)
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)
set(CMAKE_CXX_COMPILER_LAUNCHER ccache)

add_compile_options(-Wall -Wextra -Wpedantic -Werror)

add_subdirectory(src)
