# DefaultProject
[![Build Status](https://travis-ci.org/eroween/DefaultProject.svg?branch=master)](https://travis-ci.org/eroween/DefaultProject)
[![Build status](https://ci.appveyor.com/api/projects/status/github/eroween/DefaultProject?svg=true)](https://ci.appveyor.com/project/eroween/DefaultProject)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0)

This project only create an empty program with :

    -   CMake 2.8.11
    -   doxygen
    -   c++14
    -   googletest

Continuous integration :

    -   appveyor
    -   travis

already configured.

## TODO

Add GSL

https://github.com/isocpp/CppCoreGuidelines/tree/master/docs
https://github.com/Microsoft/GSL/

Add Coveralls
Add Coverity


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

## Example

    #include    <iostream>
    #include    <cstdlib>

    #include    "DEFAULT_PROJECT/program.hpp"
    #include    "DEFAULT_PROJECT/version.hpp"

    namespace   DEFAULT_PROJECT
    {
        program::program(void)
        {
            // nothing to do.
        }

        program::program(int argc, char *argv[])
        {
            std::cout << "Program launched with : " << "\n";
            for (int i = 0 ; i < argc ; ++i)
            {
                std::cout << "\t" << argv[i] << "\n";
            }
            std::cout << "as arguments."<< std::endl;
        }

        program::~program(void)
        {
             // Nothing to do.
        }



        int
        program::run(void)
        {
            std::cout << "Project version : " << PROJECT_VERSION_FULL << std::endl;
            return EXIT_SUCCESS;
        }
    }
