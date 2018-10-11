# cmake-cpp-boilerplate
This repo is a CMake boilerplate for cross-platform C++ projects. The default setting use C++17, but you can change it in `CMakelist.txt`.

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

## Others
### Unit test
This boilerplate does not include unit test since different projects use different test framework. However, if you have no preference, [Catch2](https://github.com/catchorg/Catch2) is always a solid choice.

### Package Manager
If you need a package manager for the project, [Conan](https://conan.io/) and [hunter](https://github.com/ruslo/hunter) are good choices.

## Continuous Integration
TODO
