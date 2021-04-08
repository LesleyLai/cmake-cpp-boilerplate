macro(run_conan)
    if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
        message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
        file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/master/conan.cmake"
                "${CMAKE_BINARY_DIR}/conan.cmake")
    endif()

    include(${CMAKE_BINARY_DIR}/conan.cmake)

    conan_cmake_autodetect(settings)
    conan_cmake_install(PATH_OR_REFERENCE ${PROJECT_SOURCE_DIR}
            BUILD missing
            SETTINGS ${settings}
            OUTPUT_QUIET
            )
endmacro()