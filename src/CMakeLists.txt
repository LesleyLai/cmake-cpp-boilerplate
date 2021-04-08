set(LIB_TARGET_NAME ${PROJECT_NAME}_lib)
set(APP_TARGET_NAME ${PROJECT_NAME}_app)

add_library(${LIB_TARGET_NAME}
    "${CMAKE_SOURCE_DIR}/include/dummy.hpp"
    dummy.cpp)
target_link_libraries(${LIB_TARGET_NAME} PRIVATE compiler_options)
target_include_directories(${LIB_TARGET_NAME} PUBLIC "${CMAKE_SOURCE_DIR}/include")

if(${BP_BUILD_TESTS_COVERAGE})
    target_compile_options(${LIB_TARGET_NAME} PUBLIC -fprofile-arcs -ftest-coverage)
    target_link_libraries(${LIB_TARGET_NAME} PUBLIC gcov)
endif()

add_executable(${APP_TARGET_NAME} "main.cpp")
target_link_libraries(${APP_TARGET_NAME} PRIVATE common compiler_options)
