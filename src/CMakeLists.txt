add_library(common
    "${CMAKE_SOURCE_DIR}/include/dummy.hpp"
    dummy.cpp)
target_include_directories(common PUBLIC "${CMAKE_SOURCE_DIR}/include")

add_executable(prog "main.cpp")
target_link_libraries(prog common)
add_clangformat(prog)
