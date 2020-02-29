cmake_minimum_required(VERSION 3.14)

project(cpp_boilerplate VERSION 0.0.2 LANGUAGES CXX)

include("cmake/StandardProjectSettings.cmake")
include("CMakeDependentOption")

option(BP_WARNING_AS_ERROR "Treats compiler warnings as errors" ON)

option(BP_USE_ASAN "Enable the Address Sanitizers" OFF)
option(BP_USE_TSAN "Enable the Thread Sanitizers" OFF)
option(BP_USE_MSAN "Enable the Memory Sanitizers" OFF)
option(BP_USE_UBSAN "Enable the Undefined Behavior Sanitizers" OFF)

include("cmake/compiler.cmake")
include("cmake/clangformat.cmake")
include("cmake/StaticAnalyzers.cmake")

include("cmake/conan.cmake")
run_conan()

add_subdirectory(src)

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    include(CTest)
endif()

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME AND BUILD_TESTING)
    add_subdirectory(test)
endif()