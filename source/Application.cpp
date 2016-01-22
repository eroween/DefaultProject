///
/// \file Application.cpp
///
/// \author Martin-Pierrat Louis (mart_p)
///
/// \date Sun, 17 Jan 2016 20:36:16
///
/// \version 1.0.32
///

#include    <iostream>

#include    "DEFAULT_PROJECT/Application.hpp"
#include    "DEFAULT_PROJECT/Version.hpp"

namespace   DEFAULT_PROJECT
{
    Application::Application(void)
    {
        // nothing to do.
    }

    Application::Application(int argc, char *argv[])
    {
        std::cout << "Application launched with : " << "\n";
        for (int i = 0 ; i < argc ; ++i)
        {
            std::cout << "\t" << argv[i] << "\n";
        }
        std::cout << "as arguments."<< std::endl;
    }

    int
    Application::run(void)
    {
        std::cout << "Project version : " << PROJECT_VERSION_FULL << std::endl;
#if defined     __DEBUG__
        std::cout << "Project compiled in debug mode." << std::endl;
#elif defined   __RELEASE__
        std::cout << "Project compiled in release mode." << std::endl;
#endif
        return 0;
    }
}
