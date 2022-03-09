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

file(GLOB_RECURSE cxx_src "src/*.h" "src/cast.cpp")
file(GLOB_RECURSE cxx_src1 "src/*.h" "src/sign.cpp")

add_executable(cast ${cxx_src})
add_executable(bind1 ${cxx_src1})
target_link_libraries(bind1
	PUBLIC
	# ${OpenCV_LIBS}
	PRIVATE
	"stdc++fs"
)
