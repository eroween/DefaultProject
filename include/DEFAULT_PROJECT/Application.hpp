///
/// \file Application.hpp
///
/// \author Martin-Pierrat Louis (mart_p)
///
/// \date Sun, 17 Jan 2016 19:42:05
///
/// \version 1.0.6
///

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
