cmake_minimum_required(VERSION 3.14)

project(cpp_boilerplate VERSION 0.0.2 LANGUAGES CXX)

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