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

macro(fix_default_compiler_settings_)

    IF (MSVC)
        # For MSVC, CMake sets certain flags to defaults we want to override.
        # This replacement code is taken from sample in the CMake Wiki at
        # http://www.cmake.org/Wiki/CMake_FAQ#Dynamic_Replace.
        FOREACH (flag_var
                CMAKE_CXX_FLAGS CMAKE_CXX_FLAGS_DEBUG CMAKE_CXX_FLAGS_RELEASE
                CMAKE_CXX_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_RELWITHDEBINFO)
            IF (NOT BUILD_SHARED_LIBS AND NOT gtest_force_shared_crt)
                # When Google Test is built as a shared library, it should also use
                # shared runtime libraries.  Otherwise, it may end up with multiple
                # copies of runtime library data in different modules, resulting in
                # hard-to-find crashes. When it is built as a static library, it is
                # preferable to use CRT as static libraries, as we don't have to rely
                # on CRT DLLs being available. CMake always defaults to using shared
                # CRT libraries, so we override that default here.
                STRING(REPLACE "/MD" "-MT" ${flag_var} "${${flag_var}}")
            ENDIF ()

            # We prefer more strict warning checking for building Google Test.
            # Replaces /W3 with /W4 in defaults.
            string(REPLACE "/W3" "/W4" ${flag_var} "${${flag_var}}")
        endforeach()
    endif()
endmacro()

FUNCTION(CONFIGURE_COMPILATION)

    IF (CMAKE_COMPILER_IS_GNUCXX)

        # Warnings flags

        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wctor-dtor-privacy)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wnoexcept)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wnon-virtual-dtor)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Weffc++)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wstrict-null-sentinel)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wold-style-cast)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Woverloaded-virtual)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wno-pmf-conversions)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wsign-promo)
        #TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wmultiple-inheritance)
        #TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wvirtual-inheritance)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wdouble-promotion)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wmissing-include-dirs)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wswitch-default)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wswitch-enum)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wsuggest-attribute=pure)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wsuggest-attribute=const)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wsuggest-attribute=noreturn)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wsuggest-final-types)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wsuggest-final-methods)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wsuggest-override)
        #TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wduplicated-cond)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wfloat-equal)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wzero-as-null-pointer-constant)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wuseless-cast)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wconversion)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wlogical-op)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wmissing-declarations)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Winline)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wshadow)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wall)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -Wextra)
        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -std=c++14)


        # Debug flags

        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE
            $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:-g3>
            )

        # RelWithDebInfo flass

        # Release flags


    ELSEIF(CMAKE_CXX_COMPILER_ID MATCHES "Clang")

        TARGET_COMPILE_OPTIONS(${CMAKE_PROJECT_NAME} PRIVATE -std=c++14)

    ENDIF()

    fix_default_compiler_settings_()

ENDFUNCTION()
