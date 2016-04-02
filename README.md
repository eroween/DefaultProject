[![Build Status](https://travis-ci.org/eroween/DefaultProject.svg?branch=master)](https://travis-ci.org/eroween/DefaultProject)
[![Build status](https://ci.appveyor.com/api/projects/status/github/eroween/DefaultProject?svg=true)](https://ci.appveyor.com/project/eroween/DefaultProject)
# DefaultProject

This project only create an empty program with :
    -   CMake 2.8.11
    -   doxygen
    -   c++14
    -   googletest

    -   appveyor
    -   travis

## TODO

Add GSL

https://github.com/isocpp/CppCoreGuidelines/tree/master/docs
https://github.com/Microsoft/GSL/

Add Coveralls

# Compilation

## Release

```shell
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=release ..
make
```

## Debug

The debug compilation add extra flags enabling debugging environment to trace
the program.

```shell
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=debug ..
make
```

