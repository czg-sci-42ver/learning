# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/czg/cpp_c_learning/transform

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/czg/cpp_c_learning/transform/build

# Include any dependencies generated for this target.
include CMakeFiles/bind.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/bind.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/bind.dir/flags.make

CMakeFiles/bind.dir/src/sign.cpp.o: CMakeFiles/bind.dir/flags.make
CMakeFiles/bind.dir/src/sign.cpp.o: ../src/sign.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/czg/cpp_c_learning/transform/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/bind.dir/src/sign.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/bind.dir/src/sign.cpp.o -c /home/czg/cpp_c_learning/transform/src/sign.cpp

CMakeFiles/bind.dir/src/sign.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bind.dir/src/sign.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/czg/cpp_c_learning/transform/src/sign.cpp > CMakeFiles/bind.dir/src/sign.cpp.i

CMakeFiles/bind.dir/src/sign.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bind.dir/src/sign.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/czg/cpp_c_learning/transform/src/sign.cpp -o CMakeFiles/bind.dir/src/sign.cpp.s

# Object files for target bind
bind_OBJECTS = \
"CMakeFiles/bind.dir/src/sign.cpp.o"

# External object files for target bind
bind_EXTERNAL_OBJECTS =

bind: CMakeFiles/bind.dir/src/sign.cpp.o
bind: CMakeFiles/bind.dir/build.make
bind: CMakeFiles/bind.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/czg/cpp_c_learning/transform/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bind"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bind.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/bind.dir/build: bind

.PHONY : CMakeFiles/bind.dir/build

CMakeFiles/bind.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/bind.dir/cmake_clean.cmake
.PHONY : CMakeFiles/bind.dir/clean

CMakeFiles/bind.dir/depend:
	cd /home/czg/cpp_c_learning/transform/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/czg/cpp_c_learning/transform /home/czg/cpp_c_learning/transform /home/czg/cpp_c_learning/transform/build /home/czg/cpp_c_learning/transform/build /home/czg/cpp_c_learning/transform/build/CMakeFiles/bind.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/bind.dir/depend

