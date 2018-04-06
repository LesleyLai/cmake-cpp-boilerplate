cmake_minimum_required(VERSION 3.6)

project(CPPBoilerplate)

set (CMAKE_CXX_STANDARD 17)
set (CMAKE_CXX_STANDARD_REQUIRED ON)

include("cmake/clangTidy.cmake")
include("cmake/cppcheck.cmake")
include("cmake/compiler.cmake")


add_executable(${PROJECT_NAME} "main.cpp")
