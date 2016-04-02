##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License along
## with this program; If not, see <http://www.gnu.org/licenses/>.
##
## Copyright (C) 2016 Martin-Pierrat Louis (louismartinpierrat@gmail.com)
##

## FIND LIBRARY DEPENDENCY

FIND_PACKAGE(Threads REQUIRED)

## END FIND LIBRARY DEPENDENCY



## DEPENDENCIES

INCLUDE(ExternalProject)

## END DEPENDENCIES



## FUNCTIONS

FUNCTION(CONFIGURE_TESTING)

    IF ( MSVC )

        SET(EXTERNAL_PROJECT_CMAKE_ARGS
            -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG:PATH=.
            -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE:PATH=.
            -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY:PATH=.
            -DBUILD_GTEST=ON
        )

    ELSE ()

        SET(EXTERNAL_PROJECT_CMAKE_ARGS
            -DBUILD_GTEST=ON
        )

    ENDIF()

    EXTERNALPROJECT_ADD(googletest
        GIT_REPOSITORY https://github.com/google/googletest.git
        CMAKE_ARGS ${EXTERNAL_PROJECT_CMAKE_ARGS}
        PREFIX ${CMAKE_CURRENT_BINARY_DIR}
        INSTALL_COMMAND ""
        )
    EXTERNALPROJECT_GET_PROPERTY(googletest source_dir)
    SET(GTEST_INCLUDE_DIRS ${source_dir}/googletest/include PARENT_SCOPE)
    EXTERNALPROJECT_GET_PROPERTY(googletest binary_dir)
    SET(GTEST_LIBS_DIR ${binary_dir}/googlemock/gtest PARENT_SCOPE)

ENDFUNCTION()

FUNCTION(CXX_TEST name sources)

    INCLUDE_DIRECTORIES(${GTEST_INCLUDE_DIRS})
    ADD_EXECUTABLE(${name} ${sources})
    ADD_DEPENDENCIES(${name} googletest)
    TARGET_COMPILE_OPTIONS(${name} PRIVATE "/MT")
    TARGET_COMPILE_OPTIONS(${name} PRIVATE $<CONFIG:Debug> "/MTd")
    TARGET_LINK_LIBRARIES(${name} ${GTEST_LIBS_DIR}/${CMAKE_FIND_LIBRARY_PREFIXES}gtest${CMAKE_STATIC_LIBRARY_SUFFIX})
    TARGET_LINK_LIBRARIES(${name} ${GTEST_LIBS_DIR}/${CMAKE_FIND_LIBRARY_PREFIXES}gtest_main${CMAKE_STATIC_LIBRARY_SUFFIX})
    TARGET_LINK_LIBRARIES(${name} ${CMAKE_THREAD_LIBS_INIT})
    ADD_TEST(${name} ${name})

ENDFUNCTION()

## END FUNCTIONS
