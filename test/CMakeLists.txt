set(TEST_TARGET_NAME ${PROJECT_NAME}_test)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

add_executable(${TEST_TARGET_NAME} "main.cpp")

target_link_libraries(${TEST_TARGET_NAME} PRIVATE common compiler_options
    CONAN_PKG::Catch2)


CMAKE_DEPENDENT_OPTION(BP_BUILD_TESTS_COVERAGE
        "Build the project with code coverage support for tests" OFF
        "BUILD_TESTING" OFF)
if(${BP_BUILD_TESTS_COVERAGE})
    set(CMAKE_STATIC_LINKER_FLAGS "--whole-archive")
    set(CMAKE_SHARED_LINKER_FLAGS "--whole-archive")

    include("../cmake/CodeCoverage.cmake")
    APPEND_COVERAGE_COMPILER_FLAGS("-g -O0 -fprofile-arcs -ftest-coverage")
    set(COVERAGE_LCOV_EXCLUDES '/usr/*' '*/.conan/*' '*/test/*' 'test/*')
    SETUP_TARGET_FOR_COVERAGE_LCOV(
        NAME coverage                    # New target name
        EXECUTABLE ${TEST_TARGET_NAME}
        DEPENDENCIES ${TEST_TARGET_NAME}  # Dependencies to build first
    )
endif()

enable_testing()

add_test(NAME ${TEST_TARGET_NAME} COMMAND "${CMAKE_BINARY_DIR}/bin/${TEST_TARGET_NAME}")
