cmake_minimum_required(VERSION 3.6)

project(CPPBoilerplate)

set (CMAKE_CXX_STANDARD 17)
set (CMAKE_CXX_STANDARD_REQUIRED ON)

include("cmake/clangTidy.cmake")
include("cmake/cppcheck.cmake")
include("cmake/compiler.cmake")

message(STATUS "cppcheck found: ${CMAKE_CXX_CPPCHECK}")

add_executable(${PROJECT_NAME} "main.cpp")

set_target_properties(
    CPPBoilerplate PROPERTIES
    COMPILE_FLAGS "${WARNING_FLAGS}"
    )

if(CLANG_TIDY_EXE)
    set_target_properties(
        CPPBoilerplate
        PROPERTIES
        CXX_CLANG_TIDY "${DO_CLANG_TIDY}"
        )
endif()
