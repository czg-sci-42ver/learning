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

set(YOUR_DIRECTORY "include/*")
target_include_directories(bind PRIVATE ${YOUR_DIRECTORY})

file(GLOB_RECURSE cxx_src "src/*.h" "src/*.cpp" "include/*.h")


add_executable(bind ${cxx_src})
target_link_libraries(bind
	PUBLIC
	# ${OpenCV_LIBS}
	PRIVATE
	"stdc++fs"
)
