include_directories (src
                     ${CMAKE_SOURCE_DIR}/src)
add_executable (Test test.cc catch.hpp)
target_link_libraries (Test
                       lib$<R@t<#projname>)
