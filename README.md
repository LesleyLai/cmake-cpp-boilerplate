# cmake-cpp-boilerplate
[![Build Status](https://travis-ci.org/LesleyLai/cmake-cpp-boilerplate.svg?branch=master)](https://travis-ci.org/LesleyLai/cmake-cpp-boilerplate)
[![Build status](https://ci.appveyor.com/api/projects/status/qhkbact3oew7e09t/branch/master?svg=true)](https://ci.appveyor.com/project/LesleyLai/cmake-cpp-boilerplate/branch/master)
[![codecov](https://codecov.io/gh/LesleyLai/cmake-cpp-boilerplate/branch/master/graph/badge.svg)](https://codecov.io/gh/LesleyLai/cmake-cpp-boilerplate)

This repo is a CMake boilerplate for starting cross-platform C++ projects. The default setting uses C++20, but you can change it in the root `CMakeLists.txt`.

## External dependencies
### A C++ compiler
Recent version of [Visual Studio](https://www.visualstudio.com/), [GCC](https://gcc.gnu.org/), and [Clang](https://clang.llvm.org/) should be find.

### CMake 3.14+
CMake is the build tool used for this project.
- (Optional) [Ninja](https://ninja-build.org/) can greatly improve the incremental build time.

## Package Management
This boilerplate uses [Conan](https://conan.io/) to manage packages.

## Usage
Before starting your project, modify all the `BP_*` settings in the CMake files into your own name.
You need to modify those names in both the CMake files and the CI scripts.

### Unit test
This boilerplate uses [Catch2](https://github.com/catchorg/Catch2) as the Unit Test Framework.
The CMake option `BP_BUILD_TESTS` (`ON` by default) enables the building of unit test.

The CMake option `BP_BUILD_TESTS_COVERAGE` (`OFF` by default) enables the test coverage with `gcov` and `lcov`.
To make the coverage web report working, you need a [codecov](https://codecov.io/) account. And you also need to substitute the `CODECOV_TOKEN` in `.travis.yml` to your own.

### Compiler warning and sanitizers
Every time you add a new target, you need to enable the warnings and sanitizers on that target.
Please write

```cmake
target_link_libraries(${TEST_TARGET_NAME} PRIVATE compiler_options)
```

This project enables a reasonable amount of warnings across compilers GCC, Clang, and MSVC.
The option `BP_WARNING_AS_ERROR` treats warnings as errors.
You can modify `cmake/compiler.cmake` to customize warning settings.

We can optionally enable compiler [sanitizers](https://github.com/google/sanitizers) for the project.
Sanitizers are run-time checks that catch common bugs.
Not all compilers support all the sanitizers,
and enabling non-supported sanitizer triggers either a compile-time error or warning.
The option `BP_USE_ASAN` enables the address sanitizer;
`BP_USE_TSAN` enables the thread sanitizer;
`BP_USE_MSAN` enables the memory sanitizer;
`BP_USE_UBSAN` enables the undefined behavior sanitizer.

## All the CMake Options
- `BP_BUILD_TESTS` (`ON` by default) enables the building of unit test
- `BP_BUILD_TESTS_COVERAGE` (`OFF` by default) enables the test coverage with `gcov` and `lcov`
- `BP_WARNING_AS_ERROR` (`ON` by default) treats warnings as errors
- `BP_USE_ASAN` (`OFF` by default) enables the address sanitizer
- `BP_USE_TSAN` (`OFF` by default) enables the thread sanitizer
- `BP_USE_MSAN` (`OFF` by default) enables the memory sanitizer
- `BP_USE_UBSAN` (`OFF` by default) enables the undefined behavior sanitizer
- `BP_ENABLE_IPO`  (`OFF` by default) enables Interprocedural optimization, aka Link Time Optimization
- `BP_ENABLE_CPPCHECK` (`OFF` by default) Enable static analysis with cppcheck
- `BP_ENABLE_CLANG_TIDY` (`OFF` by default) Enable static analysis with clang-tidy
## License
This repository is released under Public Domain, use it in whatever way you want. See [License](file:License) for more information.
