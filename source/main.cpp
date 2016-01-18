///
/// \file main.cpp
///
/// \brief Default project main
///
/// \date Sun, 17 Jan 2016 19:39:21
///
/// \version 1.0.8
///
/// \date September 30, 2015
///

#include    <iostream>

#include    "DEFAULT_PROJECT/Application.hpp"

int     main(int argc, char *argv[])
{
    DEFAULT_PROJECT::Application    app(argc, argv);

    return app.run();
}
