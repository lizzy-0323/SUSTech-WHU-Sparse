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
CMAKE_SOURCE_DIR = /home/lzy/code/nips23/sparse/SUSTech-WHU-Sparse

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lzy/code/nips23/sparse/SUSTech-WHU-Sparse

# Include any dependencies generated for this target.
include CMakeFiles/hnswsparse.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/hnswsparse.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/hnswsparse.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/hnswsparse.dir/flags.make

CMakeFiles/hnswsparse.dir/python/hnswsparse.cpp.o: CMakeFiles/hnswsparse.dir/flags.make
CMakeFiles/hnswsparse.dir/python/hnswsparse.cpp.o: python/hnswsparse.cpp
CMakeFiles/hnswsparse.dir/python/hnswsparse.cpp.o: CMakeFiles/hnswsparse.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lzy/code/nips23/sparse/SUSTech-WHU-Sparse/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/hnswsparse.dir/python/hnswsparse.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/hnswsparse.dir/python/hnswsparse.cpp.o -MF CMakeFiles/hnswsparse.dir/python/hnswsparse.cpp.o.d -o CMakeFiles/hnswsparse.dir/python/hnswsparse.cpp.o -c /home/lzy/code/nips23/sparse/SUSTech-WHU-Sparse/python/hnswsparse.cpp

CMakeFiles/hnswsparse.dir/python/hnswsparse.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/hnswsparse.dir/python/hnswsparse.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lzy/code/nips23/sparse/SUSTech-WHU-Sparse/python/hnswsparse.cpp > CMakeFiles/hnswsparse.dir/python/hnswsparse.cpp.i

CMakeFiles/hnswsparse.dir/python/hnswsparse.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/hnswsparse.dir/python/hnswsparse.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lzy/code/nips23/sparse/SUSTech-WHU-Sparse/python/hnswsparse.cpp -o CMakeFiles/hnswsparse.dir/python/hnswsparse.cpp.s

# Object files for target hnswsparse
hnswsparse_OBJECTS = \
"CMakeFiles/hnswsparse.dir/python/hnswsparse.cpp.o"

# External object files for target hnswsparse
hnswsparse_EXTERNAL_OBJECTS =

hnswsparse.cpython-38-x86_64-linux-gnu.so: CMakeFiles/hnswsparse.dir/python/hnswsparse.cpp.o
hnswsparse.cpython-38-x86_64-linux-gnu.so: CMakeFiles/hnswsparse.dir/build.make
hnswsparse.cpython-38-x86_64-linux-gnu.so: CMakeFiles/hnswsparse.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/lzy/code/nips23/sparse/SUSTech-WHU-Sparse/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared module hnswsparse.cpython-38-x86_64-linux-gnu.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hnswsparse.dir/link.txt --verbose=$(VERBOSE)
	/usr/bin/strip /home/lzy/code/nips23/sparse/SUSTech-WHU-Sparse/hnswsparse.cpython-38-x86_64-linux-gnu.so

# Rule to build all files generated by this target.
CMakeFiles/hnswsparse.dir/build: hnswsparse.cpython-38-x86_64-linux-gnu.so
.PHONY : CMakeFiles/hnswsparse.dir/build

CMakeFiles/hnswsparse.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/hnswsparse.dir/cmake_clean.cmake
.PHONY : CMakeFiles/hnswsparse.dir/clean

CMakeFiles/hnswsparse.dir/depend:
	cd /home/lzy/code/nips23/sparse/SUSTech-WHU-Sparse && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lzy/code/nips23/sparse/SUSTech-WHU-Sparse /home/lzy/code/nips23/sparse/SUSTech-WHU-Sparse /home/lzy/code/nips23/sparse/SUSTech-WHU-Sparse /home/lzy/code/nips23/sparse/SUSTech-WHU-Sparse /home/lzy/code/nips23/sparse/SUSTech-WHU-Sparse/CMakeFiles/hnswsparse.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/hnswsparse.dir/depend
