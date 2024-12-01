# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_line_following_rover_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED line_following_rover_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(line_following_rover_FOUND FALSE)
  elseif(NOT line_following_rover_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(line_following_rover_FOUND FALSE)
  endif()
  return()
endif()
set(_line_following_rover_CONFIG_INCLUDED TRUE)

# output package information
if(NOT line_following_rover_FIND_QUIETLY)
  message(STATUS "Found line_following_rover: 0.0.0 (${line_following_rover_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'line_following_rover' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${line_following_rover_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(line_following_rover_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${line_following_rover_DIR}/${_extra}")
endforeach()
