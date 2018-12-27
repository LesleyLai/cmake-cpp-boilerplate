add_library(common
    "${CMAKE_SOURCE_DIR}/include/dummy.hpp"
    dummy.cpp)
target_link_libraries(common PRIVATE compiler_warnings)
target_include_directories(common PUBLIC "${CMAKE_SOURCE_DIR}/include")

if(${BUILD_TESTS_COVERAGE})
    target_compile_options(common PUBLIC -fprofile-arcs -ftest-coverage)
    target_link_libraries(common PUBLIC gcov)
endif()

add_executable(app "main.cpp")
target_link_libraries(app
    PRIVATE common compiler_warnings)
add_clangformat(app)
