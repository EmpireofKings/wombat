# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_SOURCE_DIR = /home/nvidia/axolotl/navit

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nvidia/axolotl/navit-build

# Include any dependencies generated for this target.
include navit/maptool/CMakeFiles/maptool.dir/depend.make

# Include the progress variables for this target.
include navit/maptool/CMakeFiles/maptool.dir/progress.make

# Include the compile flags for this target's objects.
include navit/maptool/CMakeFiles/maptool.dir/flags.make

navit/maptool/CMakeFiles/maptool.dir/maptool.c.o: navit/maptool/CMakeFiles/maptool.dir/flags.make
navit/maptool/CMakeFiles/maptool.dir/maptool.c.o: /home/nvidia/axolotl/navit/navit/maptool/maptool.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nvidia/axolotl/navit-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object navit/maptool/CMakeFiles/maptool.dir/maptool.c.o"
	cd /home/nvidia/axolotl/navit-build/navit/maptool && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/maptool.dir/maptool.c.o   -c /home/nvidia/axolotl/navit/navit/maptool/maptool.c

navit/maptool/CMakeFiles/maptool.dir/maptool.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/maptool.dir/maptool.c.i"
	cd /home/nvidia/axolotl/navit-build/navit/maptool && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nvidia/axolotl/navit/navit/maptool/maptool.c > CMakeFiles/maptool.dir/maptool.c.i

navit/maptool/CMakeFiles/maptool.dir/maptool.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/maptool.dir/maptool.c.s"
	cd /home/nvidia/axolotl/navit-build/navit/maptool && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nvidia/axolotl/navit/navit/maptool/maptool.c -o CMakeFiles/maptool.dir/maptool.c.s

navit/maptool/CMakeFiles/maptool.dir/maptool.c.o.requires:

.PHONY : navit/maptool/CMakeFiles/maptool.dir/maptool.c.o.requires

navit/maptool/CMakeFiles/maptool.dir/maptool.c.o.provides: navit/maptool/CMakeFiles/maptool.dir/maptool.c.o.requires
	$(MAKE) -f navit/maptool/CMakeFiles/maptool.dir/build.make navit/maptool/CMakeFiles/maptool.dir/maptool.c.o.provides.build
.PHONY : navit/maptool/CMakeFiles/maptool.dir/maptool.c.o.provides

navit/maptool/CMakeFiles/maptool.dir/maptool.c.o.provides.build: navit/maptool/CMakeFiles/maptool.dir/maptool.c.o


# Object files for target maptool
maptool_OBJECTS = \
"CMakeFiles/maptool.dir/maptool.c.o"

# External object files for target maptool
maptool_EXTERNAL_OBJECTS =

navit/maptool/maptool: navit/maptool/CMakeFiles/maptool.dir/maptool.c.o
navit/maptool/maptool: navit/maptool/CMakeFiles/maptool.dir/build.make
navit/maptool/maptool: navit/maptool/libmaptool_core.a
navit/maptool/maptool: navit/libnavit_core.a
navit/maptool/maptool: /usr/lib/aarch64-linux-gnu/libglib-2.0.so
navit/maptool/maptool: /usr/lib/aarch64-linux-gnu/libgmodule-2.0.so
navit/maptool/maptool: /usr/lib/aarch64-linux-gnu/libz.so
navit/maptool/maptool: /usr/lib/aarch64-linux-gnu/libpng.so
navit/maptool/maptool: /usr/lib/aarch64-linux-gnu/libz.so
navit/maptool/maptool: /usr/lib/aarch64-linux-gnu/libpng.so
navit/maptool/maptool: navit/fib-1.1/libfib.a
navit/maptool/maptool: navit/maptool/CMakeFiles/maptool.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nvidia/axolotl/navit-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable maptool"
	cd /home/nvidia/axolotl/navit-build/navit/maptool && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/maptool.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
navit/maptool/CMakeFiles/maptool.dir/build: navit/maptool/maptool

.PHONY : navit/maptool/CMakeFiles/maptool.dir/build

navit/maptool/CMakeFiles/maptool.dir/requires: navit/maptool/CMakeFiles/maptool.dir/maptool.c.o.requires

.PHONY : navit/maptool/CMakeFiles/maptool.dir/requires

navit/maptool/CMakeFiles/maptool.dir/clean:
	cd /home/nvidia/axolotl/navit-build/navit/maptool && $(CMAKE_COMMAND) -P CMakeFiles/maptool.dir/cmake_clean.cmake
.PHONY : navit/maptool/CMakeFiles/maptool.dir/clean

navit/maptool/CMakeFiles/maptool.dir/depend:
	cd /home/nvidia/axolotl/navit-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nvidia/axolotl/navit /home/nvidia/axolotl/navit/navit/maptool /home/nvidia/axolotl/navit-build /home/nvidia/axolotl/navit-build/navit/maptool /home/nvidia/axolotl/navit-build/navit/maptool/CMakeFiles/maptool.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : navit/maptool/CMakeFiles/maptool.dir/depend

