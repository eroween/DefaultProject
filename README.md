# DefaultProject

This project only create an empty program with CMake 2.8.11 and doxygen
configuration.

This project is configured to use C++14 and GTest.

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

