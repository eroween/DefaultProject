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

#ifndef     __DEFAULT_PROJECT_APPLICATION_HPP__
# define    __DEFAULT_PROJECT_APPLICATION_HPP__

namespace   DEFAULT_PROJECT
{
    ///
    /// \brief Project entry point.
    ///
    class       Application
    {
        public:
            ///
            /// \brief Default constructor.
            ///
            Application(void);

            ///
            /// \brief constructor with program arguments.
            ///
            Application(int argc, char *argv[]);

        public:
            ///
            /// \brief This method run the application.
            ///
            int     run(void);
    };
}

#endif /* !__DEFAULT_PROJECT_APPLICATION_HPP__ */
