cmake_minimum_required(VERSION 3.0)
include(GNUInstallDirs)

project(camos VERSION 1.0 LANGUAGES C)

option(CAMOS_BUILD_STATIC "Build camos as static library" OFF)

if (CAMOS_BUILD_STATIC)
	add_library(camos STATIC camos.h amos.h camos.c)
else (CAMOS_BUILD_STATIC)
	add_library(camos SHARED camos.c)
	set_target_properties(camos PROPERTIES PUBLIC_HEADER "camos.h;amos.h")
	install(TARGETS camos
		LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
		PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
endif (CAMOS_BUILD_STATIC)
	target_include_directories(camos PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
	

