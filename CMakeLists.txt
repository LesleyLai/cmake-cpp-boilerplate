cmake_minimum_required(VERSION 3.14)

project(cpp_boilerplate VERSION 0.0.2 LANGUAGES CXX)

include("cmake/StandardProjectSettings.cmake")
include("CMakeDependentOption")

option(BP_BUILD_TESTS "Builds the tests" ON)
CMAKE_DEPENDENT_OPTION(BP_BUILD_TESTS_COVERAGE
    "Build the project with code coverage support for tests" OFF
                       "BP_BUILD_TESTS" OFF)

option(BP_WARNING_AS_ERROR "Treats compiler warnings as errors" ON)

option(BP_USE_ASAN "Enable the Address Sanitizers" OFF)
option(BP_USE_TSAN "Enable the Thread Sanitizers" OFF)
option(BP_USE_MSAN "Enable the Memory Sanitizers" OFF)
option(BP_USE_UBSAN "Enable the Undefined Behavior Sanitizers" OFF)

include("cmake/compiler.cmake")
include("cmake/clangformat.cmake")

# Conan package manager
if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/master/conan.cmake"
                  "${CMAKE_BINARY_DIR}/conan.cmake")
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

add_subdirectory(src)

if(BP_BUILD_TESTS)
    enable_testing()
    add_subdirectory(test)
endif()
