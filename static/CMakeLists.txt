cmake_minimum_required(VERSION 3.10)

project(bind)

if(NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE Release)
endif()
set(CMAKE_CXX_FLAGS "-Wall -Wextra")
set(CMAKE_CXX_FLAGS_DEBUG "-g")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")

set(CMAKE_EXPORT_COMPILE_COMMANDS "1")

# find_package(OpenCV REQUIRED)
# include_directories(${OpenCV_INCLUDE_DIRS})

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

file(GLOB_RECURSE cxx_src "src/*.h" "src/sign.cpp")
file(GLOB_RECURSE cxx_src_1 "src/*.h" "src/class_static.cpp")
file(GLOB_RECURSE cxx_src_2 "src/*.h" "src/class_no_static.cpp")
file(GLOB_RECURSE cxx_src_3 "src/*.h" "src/static_class_member.cpp")

add_executable(bind ${cxx_src})
add_executable(bind_1 ${cxx_src_1})
add_executable(bind_2 ${cxx_src_2})
add_executable(bind_3 ${cxx_src_3})
target_link_libraries(bind
	PUBLIC
	# ${OpenCV_LIBS}
	PRIVATE
	"stdc++fs"
)
