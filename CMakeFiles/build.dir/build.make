# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lzy/code/nips23/sparse/hnswlib

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lzy/code/nips23/sparse/hnswlib

# Include any dependencies generated for this target.
include CMakeFiles/build.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/build.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/build.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/build.dir/flags.make

CMakeFiles/build.dir/expr/build.cpp.o: CMakeFiles/build.dir/flags.make
CMakeFiles/build.dir/expr/build.cpp.o: expr/build.cpp
CMakeFiles/build.dir/expr/build.cpp.o: CMakeFiles/build.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lzy/code/nips23/sparse/hnswlib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/build.dir/expr/build.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/build.dir/expr/build.cpp.o -MF CMakeFiles/build.dir/expr/build.cpp.o.d -o CMakeFiles/build.dir/expr/build.cpp.o -c /home/lzy/code/nips23/sparse/hnswlib/expr/build.cpp

CMakeFiles/build.dir/expr/build.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/build.dir/expr/build.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lzy/code/nips23/sparse/hnswlib/expr/build.cpp > CMakeFiles/build.dir/expr/build.cpp.i

CMakeFiles/build.dir/expr/build.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/build.dir/expr/build.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lzy/code/nips23/sparse/hnswlib/expr/build.cpp -o CMakeFiles/build.dir/expr/build.cpp.s

# Object files for target build
build_OBJECTS = \
"CMakeFiles/build.dir/expr/build.cpp.o"

# External object files for target build
build_EXTERNAL_OBJECTS =

build: CMakeFiles/build.dir/expr/build.cpp.o
build: CMakeFiles/build.dir/build.make
build: CMakeFiles/build.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/lzy/code/nips23/sparse/hnswlib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable build"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/build.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/build.dir/build: build
.PHONY : CMakeFiles/build.dir/build

CMakeFiles/build.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/build.dir/cmake_clean.cmake
.PHONY : CMakeFiles/build.dir/clean

CMakeFiles/build.dir/depend:
	cd /home/lzy/code/nips23/sparse/hnswlib && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lzy/code/nips23/sparse/hnswlib /home/lzy/code/nips23/sparse/hnswlib /home/lzy/code/nips23/sparse/hnswlib /home/lzy/code/nips23/sparse/hnswlib /home/lzy/code/nips23/sparse/hnswlib/CMakeFiles/build.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/build.dir/depend

