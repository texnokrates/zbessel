cmake_minimum_required(VERSION 3.0)
include(GNUInstallDirs)

project(camos VERSION 1.0 LANGUAGES C)
add_library(camos SHARED camos.c)
target_include_directories(camos PUBLIC ${PROJECT_SOURCE_DIR})
set_target_properties(camos PROPERTIES PUBLIC_HEADER "camos.h")

install(TARGETS camos
	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
	PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
