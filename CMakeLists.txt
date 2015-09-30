################################################################################
#                                                                              #
# \file CMakeList.txt                                                          #
#                                                                              #
# \brief CMakeList needed to generate the Terrain-Rendering Demo program       #
#                                                                              #
# \author Louis Martin-Pierrat                                                 #
#                                                                              #
# \version 1.0.0                                                               #
#                                                                              #
# \date September 30, 2015                                                     #
#                                                                              #
################################################################################


## CMAKE INITIALISATION

PROJECT(TERRAIN_RENDERING)
CMAKE_MINIMUM_REQUIRED(VERSION 2.8.11)

## END CMAKE INITIALISATION



## PROJECT VERSION

SET(TERRAIN_RENDERING_VERSION_MAJOR 1)
SET(TERRAIN_RENDERING_VERSION_MINOR 0)
SET(TERRAIN_RENDERING_VERSION_PATCH 0)
SET(TERRAIN_RENDERING_VERSION_EXTRA 0)

SET(TERRAIN_RENDERING_VERSION "\"${TERRAIN_RENDERING_VERSION_MAJOR}.${TERRAIN_RENDERING_VERSION_MINOR}.${TERRAIN_RENDERING_VERSION_PATCH}\"")
SET(TERRAIN_RENDERING_VERSION_FULL "\"${TERRAIN_RENDERING_VERSION_MAJOR}.${TERRAIN_RENDERING_VERSION_MINOR}.${TERRAIN_RENDERING_VERSION_PATCH}.${TERRAIN_RENDERING_VERSION_EXTRA}\"")

CONFIGURE_FILE(
    "${CMAKE_SOURCE_DIR}/sources/terrain-rendering.hpp.in"
    "${CMAKE_SOURCE_DIR}/sources/terrain-rendering.hpp"
    )

## END PROJECT VERSION



## FIND LIBRARY DEPENDENCY

##



## PROJECT LANGUAGE

ENABLE_LANGUAGE(CXX)

## END PROJECT LANGUAGE



## PROJECT SOURCES FILES

SET(TERRAIN_RENDERING_SOURCES_FILES
    sources/main.cpp
    )

## END PROJECT SOURCES FILES



## PROJECT INCLUDES FILES

SET(TERRAIN_RENDERING_INCLUDES_FILES
    sources/terrain-rendering.hpp
    )

## END PROJECT INCLUDES FILES



## PROJECT INCUDES DIRECTORIES

SET(TERRAIN_RENDERING_INCLUDES_DIRECTORIES
    sources/
    )

INCLUDE_DIRECTORIES(${TERRAIN_RENDERING_INCLUDES_DIRECTORIES})

## PROJCET INCLUDES DIRECTORIES



## PROJECT SETTINGS

IF (CMAKE_BUILD_TYPE MATCHES "debug")

    SET(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -D__DEBUG__")
    SET(EXECUTABLE_OUTPUT_PATH "${CMAKE_SOURCE_DIR}/build/debug/")

ELSE ()

    SET(EXECUTABLE_OUTPUT_PATH "${CMAKE_SOURCE_DIR}/build/release/")

ENDIF ()

## END PROJECT SETTINGS



## BINARY SETTINGS

ADD_EXECUTABLE(Terrain-Rendering ${TERRAIN_RENDERING_SOURCES_FILES})

## END BINARY SETTINGS



## LIBRARY SETTINGS

## END LIBRARY SETTINGS



## COMPILATION SETTINGS

##



## DOXYGEN CONFIGURATION

FIND_PACKAGE(Doxygen)

IF (DOXYGEN_FOUND)

    CONFIGURE_FILE(
        ${CMAKE_SOURCE_DIR}/Doxyfile.in
        ${CMAKE_BINARY_DIR}/Doxyfile
        @ONLY)

    ADD_CUSTOM_TARGET(doc
        ${DOXYGEN_EXECUTABLE} ${CMAKE_BINARY_DIR}/Doxyfile
        WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}/sources"
        COMMENT "Generating API documentation with Doxygen" VERBATIM
        )

ENDIF (DOXYGEN_FOUND)

## END DOXYGEN CONFIGURATION

