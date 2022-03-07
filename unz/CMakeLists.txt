find_package(PkgConfig)
if(PKGCONFIG_FOUND)
    pkg_check_modules(MINIZIP "minizip-ng" REQUIRED IMPORTED_TARGET)
endif()

add_executable(unz "main.c")

target_include_directories(unz PRIVATE PkgConfig::MINIZIP)
target_link_libraries(unz PUBLIC PkgConfig::MINIZIP)
