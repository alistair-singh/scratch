
cmake_minimum_required (VERSION 2.8)
project ($<R@t<#projname>)

if(MSVC)
  # Force to always compile with W4
  if(CMAKE_CXX_FLAGS MATCHES "/W[0-4]")
    string(REGEX REPLACE "/W[0-4]" "/W4" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
  else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
  endif()
  # Treat warning as errors
  if(CMAKE_CXX_FLAGS MATCHES "/WX")
    string(REGEX REPLACE "/WX-" "/WX" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
  else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /WX")
  endif()
  # Multicore processing
  if(NOT CMAKE_CXX_FLAGS MATCHES "/MP")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MP")
  endif()
  # Assembly Listing
  #if(NOT CMAKE_CXX_FLAGS MATCHES "/FAsc")
  #set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /FAsc")
  #endif()
elseif(CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX)
  # Update if necessary
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14 -Werror -Wno-long-long -Wpedantic")
endif()

# Includes Catch in the project:
add_subdirectory(external/catch)
include_directories(${CATCH_INCLUDE_DIR})

add_subdirectory (src)
add_subdirectory (test)

enable_testing ()
add_test (NAME Tests COMMAND Test)
