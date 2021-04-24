set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

add_executable(cmake_cpp_boilerplate_test main.cpp dummy_test.cpp)

find_package(Catch2 REQUIRED)
target_link_libraries(cmake_cpp_boilerplate_test
        PRIVATE cmake_cpp_boilerplate::lib Catch2::Catch2)

CMAKE_DEPENDENT_OPTION(BP_BUILD_TESTS_COVERAGE
        "Build the project with code coverage support for tests" OFF
        "BP_BUILD_TESTS" OFF)
if (${BP_BUILD_TESTS_COVERAGE})
    include("../cmake/CodeCoverage.cmake")
    APPEND_COVERAGE_COMPILER_FLAGS("-g -O0 -fprofile-arcs -ftest-coverage")
    set(COVERAGE_LCOV_EXCLUDES '/usr/*' '*/.conan/*' '*/test/*' 'test/*')
    SETUP_TARGET_FOR_COVERAGE_LCOV(
            NAME cmake_cpp_boilerplate_coverage                    # New target name
            EXECUTABLE cmake_cpp_boilerplate_test
            DEPENDENCIES cmake_cpp_boilerplate_test  # Dependencies to build first
    )
endif ()

enable_testing()

add_test(NAME cmake_cpp_boilerplate_test COMMAND "${CMAKE_BINARY_DIR}/bin/cmake_cpp_boilerplate_test")
