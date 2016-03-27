# DefaultProject

This project only create an empty program with CMake 2.8.11, doxygen, c++14
Google Test.

## TODO

Add GSL

https://github.com/isocpp/CppCoreGuidelines/tree/master/docs
https://github.com/Microsoft/GSL/tree/master/include

Add Travis-CI
Add AppVeyor

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

