set(TEST_TARGET_NAME ${PROJECT_NAME}Test)

add_executable(${TEST_TARGET_NAME} "main.cpp")

conan_cmake_run(REQUIRES catch2/2.4.0@bincrafters/stable
                BASIC_SETUP CMAKE_TARGETS
                BUILD missing)

target_link_libraries(${TEST_TARGET_NAME} common CONAN_PKG::catch2)
