set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

link_directories(${CMAKE_CURRENT_BINARY_DIR}/lib)

# Organize unrelated targets to clean IDE hierarchy.
set(DEPENDENCY_FOLDER "third-party")

# This will also clean up the CMake ALL_BUILD, INSTALL, RUN_TESTS and ZERO_CHECK projects.
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set_property(GLOBAL PROPERTY PREDEFINED_TARGETS_FOLDER ${DEPENDENCY_FOLDER})

# Output binary to predictable location.
set(BINARY_OUT_DIR ${CMAKE_BINARY_DIR}/bin)
set(LIB_OUT_DIR ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${BINARY_OUT_DIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${LIB_OUT_DIR})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${LIB_OUT_DIR})

foreach (OUTPUTCONFIG ${CMAKE_CONFIGURATION_TYPES})
    string(TOUPPER ${OUTPUTCONFIG} OUTPUTCONFIG)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${BINARY_OUT_DIR})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${LIB_OUT_DIR})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${LIB_OUT_DIR})
endforeach (OUTPUTCONFIG CMAKE_CONFIGURATION_TYPES)

# Set a default build type if none was specified
if (NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    message(
            STATUS "Setting build type to 'RelWithDebInfo' as none was specified.")
    set(CMAKE_BUILD_TYPE
            RelWithDebInfo
            CACHE STRING "Choose the type of build." FORCE)
    # Set the possible values of build type for cmake-gui, ccmake
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release"
            "MinSizeRel" "RelWithDebInfo")
endif ()

find_program(CCACHE ccache)
if (CCACHE)
    message("using ccache")
    set(CMAKE_CXX_COMPILER_LAUNCHER ${CCACHE})
endif ()

# Generate compile_commands.json to make it easier to work with clang based
# tools
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(BP_ENABLE_IPO
        "Enable Interprocedural optimization, aka Link Time Optimization (LTO)"
        OFF)

if (BP_ENABLE_IPO)
    include(CheckIPOSupported)
    check_ipo_supported(RESULT result OUTPUT output)
    if (result)
        set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
    else ()
        message(SEND_ERROR "IPO is not supported: ${output}")
    endif ()
endif ()