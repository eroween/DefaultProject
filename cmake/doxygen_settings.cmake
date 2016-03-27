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


FUNCTION(CONFIGURE_DOXYGEN)

    FIND_PACKAGE(Doxygen)

    IF (DOXYGEN_FOUND)

        CONFIGURE_FILE(
            ${CMAKE_SOURCE_DIR}/Doxyfile.in
            ${CMAKE_BINARY_DIR}/Doxyfile
            @ONLY)

        ADD_CUSTOM_TARGET(doc
            ${DOXYGEN_EXECUTABLE} ${CMAKE_BINARY_DIR}/Doxyfile
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
            COMMENT "Generating API documentation with Doxygen" VERBATIM
            )

    ENDIF (DOXYGEN_FOUND)

ENDFUNCTION()
