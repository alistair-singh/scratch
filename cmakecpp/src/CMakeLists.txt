add_library (lib$<R@t<#projname> SHARED file.cc file.hh)
add_executable ($<R@t<#projname> main.cc)
target_link_libraries ($<R@t<#projname> lib$<R@t<#projname>)

install(TARGETS $<R@t<#projname> DESTINATION bin)
install(TARGETS lib$<R@t<#projname> DESTINATION lib)
install(FILES file.hh DESTINATION include)
