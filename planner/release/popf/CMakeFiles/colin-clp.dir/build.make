# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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

# Produce verbose output by default.
VERBOSE = 1

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
CMAKE_COMMAND = /home/matti99/.local/lib/python2.7/site-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /home/matti99/.local/lib/python2.7/site-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/matti99/popf-tif/planner/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/matti99/popf-tif/planner/release

# Include any dependencies generated for this target.
include popf/CMakeFiles/colin-clp.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include popf/CMakeFiles/colin-clp.dir/compiler_depend.make

# Include the progress variables for this target.
include popf/CMakeFiles/colin-clp.dir/progress.make

# Include the compile flags for this target's objects.
include popf/CMakeFiles/colin-clp.dir/flags.make

popf/CMakeFiles/colin-clp.dir/popfMain.o: popf/CMakeFiles/colin-clp.dir/flags.make
popf/CMakeFiles/colin-clp.dir/popfMain.o: /home/matti99/popf-tif/planner/src/popf/popfMain.cpp
popf/CMakeFiles/colin-clp.dir/popfMain.o: popf/CMakeFiles/colin-clp.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/matti99/popf-tif/planner/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object popf/CMakeFiles/colin-clp.dir/popfMain.o"
	cd /home/matti99/popf-tif/planner/release/popf && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT popf/CMakeFiles/colin-clp.dir/popfMain.o -MF CMakeFiles/colin-clp.dir/popfMain.o.d -o CMakeFiles/colin-clp.dir/popfMain.o -c /home/matti99/popf-tif/planner/src/popf/popfMain.cpp

popf/CMakeFiles/colin-clp.dir/popfMain.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/colin-clp.dir/popfMain.i"
	cd /home/matti99/popf-tif/planner/release/popf && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/matti99/popf-tif/planner/src/popf/popfMain.cpp > CMakeFiles/colin-clp.dir/popfMain.i

popf/CMakeFiles/colin-clp.dir/popfMain.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/colin-clp.dir/popfMain.s"
	cd /home/matti99/popf-tif/planner/release/popf && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/matti99/popf-tif/planner/src/popf/popfMain.cpp -o CMakeFiles/colin-clp.dir/popfMain.s

popf/CMakeFiles/colin-clp.dir/solver-clp.o: popf/CMakeFiles/colin-clp.dir/flags.make
popf/CMakeFiles/colin-clp.dir/solver-clp.o: /home/matti99/popf-tif/planner/src/popf/solver-clp.cpp
popf/CMakeFiles/colin-clp.dir/solver-clp.o: popf/CMakeFiles/colin-clp.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/matti99/popf-tif/planner/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object popf/CMakeFiles/colin-clp.dir/solver-clp.o"
	cd /home/matti99/popf-tif/planner/release/popf && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT popf/CMakeFiles/colin-clp.dir/solver-clp.o -MF CMakeFiles/colin-clp.dir/solver-clp.o.d -o CMakeFiles/colin-clp.dir/solver-clp.o -c /home/matti99/popf-tif/planner/src/popf/solver-clp.cpp

popf/CMakeFiles/colin-clp.dir/solver-clp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/colin-clp.dir/solver-clp.i"
	cd /home/matti99/popf-tif/planner/release/popf && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/matti99/popf-tif/planner/src/popf/solver-clp.cpp > CMakeFiles/colin-clp.dir/solver-clp.i

popf/CMakeFiles/colin-clp.dir/solver-clp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/colin-clp.dir/solver-clp.s"
	cd /home/matti99/popf-tif/planner/release/popf && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/matti99/popf-tif/planner/src/popf/solver-clp.cpp -o CMakeFiles/colin-clp.dir/solver-clp.s

# Object files for target colin-clp
colin__clp_OBJECTS = \
"CMakeFiles/colin-clp.dir/popfMain.o" \
"CMakeFiles/colin-clp.dir/solver-clp.o"

# External object files for target colin-clp
colin__clp_EXTERNAL_OBJECTS =

popf/colin-clp: popf/CMakeFiles/colin-clp.dir/popfMain.o
popf/colin-clp: popf/CMakeFiles/colin-clp.dir/solver-clp.o
popf/colin-clp: popf/CMakeFiles/colin-clp.dir/build.make
popf/colin-clp: popf/libColinCommon.a
popf/colin-clp: /usr/lib/x86_64-linux-gnu/libCbcSolver.so
popf/colin-clp: /usr/lib/x86_64-linux-gnu/libCbc.so
popf/colin-clp: /usr/lib/x86_64-linux-gnu/libCgl.so
popf/colin-clp: /usr/lib/x86_64-linux-gnu/libOsiClp.so
popf/colin-clp: /usr/lib/x86_64-linux-gnu/libOsi.so
popf/colin-clp: /usr/lib/x86_64-linux-gnu/libClp.so
popf/colin-clp: /usr/lib/x86_64-linux-gnu/libCoinUtils.so
popf/colin-clp: VALfiles/parsing/libParsePDDL.a
popf/colin-clp: VALfiles/libInst.a
popf/colin-clp: popf/CMakeFiles/colin-clp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/matti99/popf-tif/planner/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable colin-clp"
	cd /home/matti99/popf-tif/planner/release/popf && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/colin-clp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
popf/CMakeFiles/colin-clp.dir/build: popf/colin-clp
.PHONY : popf/CMakeFiles/colin-clp.dir/build

popf/CMakeFiles/colin-clp.dir/clean:
	cd /home/matti99/popf-tif/planner/release/popf && $(CMAKE_COMMAND) -P CMakeFiles/colin-clp.dir/cmake_clean.cmake
.PHONY : popf/CMakeFiles/colin-clp.dir/clean

popf/CMakeFiles/colin-clp.dir/depend:
	cd /home/matti99/popf-tif/planner/release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/matti99/popf-tif/planner/src /home/matti99/popf-tif/planner/src/popf /home/matti99/popf-tif/planner/release /home/matti99/popf-tif/planner/release/popf /home/matti99/popf-tif/planner/release/popf/CMakeFiles/colin-clp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : popf/CMakeFiles/colin-clp.dir/depend

