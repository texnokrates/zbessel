cmake_minimum_required(VERSION 3.0)
include(GNUInstallDirs)

project(zbessel VERSION 1.0 LANGUAGES CXX)
add_library(zbessel SHARED zbessel.cc)
target_include_directories(zbessel PUBLIC ${PROJECT_SOURCE_DIR})
set_target_properties(zbessel PROPERTIES PUBLIC_HEADER "zbessel.h;zbessel.hh")

install(TARGETS zbessel
	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
	PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
