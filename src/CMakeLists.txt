add_library(common
    "${CMAKE_SOURCE_DIR}/include/dummy.hpp"
    dummy.cpp)
target_include_directories(common PUBLIC "${CMAKE_SOURCE_DIR}/include")

if(${BUILD_TESTS_COVERAGE})
    target_compile_options(common PRIVATE -fprofile-arcs -ftest-coverage)
    target_link_libraries(common gcov)
endif()

add_executable(prog "main.cpp")
target_link_libraries(prog common)
add_clangformat(prog)
