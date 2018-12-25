cmake_minimum_required(VERSION 3.8)

project(CPPBoilerplate)

set (CMAKE_CXX_STANDARD 17)
set (CMAKE_CXX_STANDARD_REQUIRED ON)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

include("CMakeDependentOption")

option(BUILD_TESTS
    "Builds the tests"
    OFF)
CMAKE_DEPENDENT_OPTION(BUILD_TESTS_COVERAGE
    "Build the project with code coverage support for tests" OFF
                       "BUILD_TESTS" OFF)

include("Compiler")
include("ClangFormat")
include("ClangTidy")
include("CppCheck")

# Conan package manager
if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
   message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
   file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/master/conan.cmake"
                 "${CMAKE_BINARY_DIR}/conan.cmake")
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

add_subdirectory(src)

if(BUILD_TESTS)
add_subdirectory(test)
endif()
