cmake_minimum_required(VERSION 3.6)

project(CPPBoilerplate)

set (CMAKE_CXX_STANDARD 17)
set (CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(${PROJECT_NAME} "main.cpp")

set_target_properties(
    CPPBoilerplate PROPERTIES
    COMPILE_FLAGS "${WARNING_FLAGS}"
    )

include("cmake/clangTidy.cmake")
include("cmake/compiler.cmake")

if(CLANG_TIDY_EXE)
    set_target_properties(
        CPPBoilerplate
        PROPERTIES
        CXX_CLANG_TIDY "${DO_CLANG_TIDY}"
        )
endif()
