//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3 of the License, or
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program; If not, see <http://www.gnu.org/licenses/>.
//
// Copyright (C) 2016 Martin-Pierrat Louis (louismartinpierrat@gmail.com)
//

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
