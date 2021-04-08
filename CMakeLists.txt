cmake_minimum_required(VERSION 3.15)
project(cpp_boilerplate LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR})

include("cmake/StandardProjectSettings.cmake")
include("CMakeDependentOption")

include("cmake/compiler.cmake")
include("cmake/StaticAnalyzers.cmake")

include("cmake/conan.cmake")
run_conan()

add_subdirectory(src)

option(BP_BUILD_TESTS "Build tests" ON)
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME AND BP_BUILD_TESTS)
    enable_testing()
    add_subdirectory(test)
endif()