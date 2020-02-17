set(TEST_TARGET_NAME ${PROJECT_NAME}Test)

add_executable(${TEST_TARGET_NAME} "main.cpp")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

conan_cmake_run(REQUIRES Catch2/2.11.1@catchorg/stable
                BASIC_SETUP CMAKE_TARGETS
                BUILD missing)

target_link_libraries(${TEST_TARGET_NAME} PRIVATE common compiler_options
    CONAN_PKG::Catch2)

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

add_test(UnitTest "${CMAKE_BINARY_DIR}/bin/${TEST_TARGET_NAME}")
