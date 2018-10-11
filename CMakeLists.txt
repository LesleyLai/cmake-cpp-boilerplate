cmake_minimum_required(VERSION 3.8)

project(CPPBoilerplate)

set (CMAKE_CXX_STANDARD 17)
set (CMAKE_CXX_STANDARD_REQUIRED ON)

include("cmake/compiler.cmake")
include("cmake/clangformat.cmake")
include("cmake/clang-tidy.cmake")
include("cmake/cppcheck.cmake")


add_executable(${PROJECT_NAME} "main.cpp")
add_clangformat(${PROJECT_NAME})
