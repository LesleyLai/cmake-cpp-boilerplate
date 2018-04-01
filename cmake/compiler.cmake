# Compiler specific settings

if(compiler_included)
    return()
endif()
set(compiler_included true)

function(add_compiler_flags)
    foreach(flag ${ARGV})
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${flag}" PARENT_SCOPE)
    endforeach()
endfunction()

if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    add_compiler_flags(-Wall)
    add_compiler_flags(-Wextra)
endif()

if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    add_compiler_flags(/W3)
    add_compiler_flags(/std:c++latest)
    add_definitions(-D_CRT_SECURE_NO_WARNINGS) # Suppress C4996

    if (NOT CMAKE_CXX_COMPILER_VERSION VERSION_LESS 19.10)
        add_compiler_flags(/permissive-) # force standard conformance
    endif()
endif()
