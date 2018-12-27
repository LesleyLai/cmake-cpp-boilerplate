# cmake-cpp-boilerplate
[![Build Status](https://travis-ci.org/LesleyLai/cmake-cpp-boilerplate.svg?branch=master)](https://travis-ci.org/LesleyLai/cmake-cpp-boilerplate)
[![Build status](https://ci.appveyor.com/api/projects/status/qhkbact3oew7e09t/branch/master?svg=true)](https://ci.appveyor.com/project/LesleyLai/cmake-cpp-boilerplate/branch/master)
[![codecov](https://codecov.io/gh/LesleyLai/cmake-cpp-boilerplate/branch/master/graph/badge.svg)](https://codecov.io/gh/LesleyLai/cmake-cpp-boilerplate)

This repo is a CMake boilerplate for starting cross-platform C++ projects. The default setting use C++17, but you can change it in `CMakelist.txt`.

## External dependencies
### A C++ compiler
Recent version of [Visual Studio](https://www.visualstudio.com/), [GCC](https://gcc.gnu.org/), and [Clang](https://clang.llvm.org/) should be find.

### CMake 3.8+
CMake is the build tool used for this projects.
- (Optional) [Ninja](https://ninja-build.org/) can greatly improve the incremental build time. Can be used as a target for CMake.

### (Optional) CPPCheck
Download [cppcheck](https://sourceforge.net/projects/cppcheck/) here. CPPCheck is a static analyze tool with very few false positive.

### (Optional) Clang tool chains
Download [clang](http://releases.llvm.org/download.html) here. This projects use [clang-tidy](http://clang.llvm.org/extra/clang-tidy/) and [clang-format](https://clang.llvm.org/docs/ClangFormat.html) for linting.

## Package Management
This boilerplate uses [Conan](https://conan.io/) to manage packages.

## Unit test
This boilerplate uses [Catch2](https://github.com/catchorg/Catch2) as Unit Test Framework.

## License
This repository is released under Public Domain, use it in whatever way you want. See [License](file:License) for more information.
