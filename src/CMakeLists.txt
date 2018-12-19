add_library(common STATIC
    dummy.cpp
    dummy.hpp)

add_executable(prog "main.cpp")
target_link_libraries(prog common)
add_clangformat(prog)
