cmake_minimum_required(VERSION 3.8)

project(CPPBoilerplate VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

include("CMakeDependentOption")

option(BP_BUILD_TESTS "Builds the tests" OFF)
CMAKE_DEPENDENT_OPTION(BP_BUILD_TESTS_COVERAGE
    "Build the project with code coverage support for tests" OFF
                       "BP_BUILD_TESTS" OFF)

option(BP_ENABLE_CLANG_TIDY "Enable testing with clang-tidy" OFF)
option(BP_ENABLE_CPPCHECK "Enable testing with cppcheck" OFF)
option(BP_WARNING_AS_ERROR "Treats compiler warnings as errors" ON)

include("compiler")
include("clangformat")

if (BP_ENABLE_CLANG_TIDY)
include("ClangTidy")
endif()

if (BP_ENABLE_CPPCHECK)
include("cppcheck")
endif()

# Conan package manager
if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/master/conan.cmake"
                  "${CMAKE_BINARY_DIR}/conan.cmake")
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

add_subdirectory(src)

if(BP_BUILD_TESTS)
    add_subdirectory(test)
endif()
