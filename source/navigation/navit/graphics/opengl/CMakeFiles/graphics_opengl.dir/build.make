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
include navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/depend.make

# Include the progress variables for this target.
include navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/progress.make

# Include the compile flags for this target's objects.
include navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/flags.make

navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/graphics_opengl.c.o: navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/flags.make
navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/graphics_opengl.c.o: /home/nvidia/axolotl/navit/navit/graphics/opengl/graphics_opengl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nvidia/axolotl/navit-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/graphics_opengl.c.o"
	cd /home/nvidia/axolotl/navit-build/navit/graphics/opengl && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/graphics_opengl.dir/graphics_opengl.c.o   -c /home/nvidia/axolotl/navit/navit/graphics/opengl/graphics_opengl.c

navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/graphics_opengl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/graphics_opengl.dir/graphics_opengl.c.i"
	cd /home/nvidia/axolotl/navit-build/navit/graphics/opengl && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nvidia/axolotl/navit/navit/graphics/opengl/graphics_opengl.c > CMakeFiles/graphics_opengl.dir/graphics_opengl.c.i

navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/graphics_opengl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/graphics_opengl.dir/graphics_opengl.c.s"
	cd /home/nvidia/axolotl/navit-build/navit/graphics/opengl && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nvidia/axolotl/navit/navit/graphics/opengl/graphics_opengl.c -o CMakeFiles/graphics_opengl.dir/graphics_opengl.c.s

navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/graphics_opengl.c.o.requires:

.PHONY : navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/graphics_opengl.c.o.requires

navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/graphics_opengl.c.o.provides: navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/graphics_opengl.c.o.requires
	$(MAKE) -f navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/build.make navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/graphics_opengl.c.o.provides.build
.PHONY : navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/graphics_opengl.c.o.provides

navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/graphics_opengl.c.o.provides.build: navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/graphics_opengl.c.o


# Object files for target graphics_opengl
graphics_opengl_OBJECTS = \
"CMakeFiles/graphics_opengl.dir/graphics_opengl.c.o"

# External object files for target graphics_opengl
graphics_opengl_EXTERNAL_OBJECTS =

navit/graphics/opengl/.libs/libgraphics_opengl.so: navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/graphics_opengl.c.o
navit/graphics/opengl/.libs/libgraphics_opengl.so: navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/build.make
navit/graphics/opengl/.libs/libgraphics_opengl.so: /usr/lib/aarch64-linux-gnu/libGL.so
navit/graphics/opengl/.libs/libgraphics_opengl.so: /usr/lib/aarch64-linux-gnu/libGLU.so
navit/graphics/opengl/.libs/libgraphics_opengl.so: /usr/lib/aarch64-linux-gnu/libglut.so
navit/graphics/opengl/.libs/libgraphics_opengl.so: navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nvidia/axolotl/navit-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared module .libs/libgraphics_opengl.so"
	cd /home/nvidia/axolotl/navit-build/navit/graphics/opengl && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/graphics_opengl.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/build: navit/graphics/opengl/.libs/libgraphics_opengl.so

.PHONY : navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/build

navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/requires: navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/graphics_opengl.c.o.requires

.PHONY : navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/requires

navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/clean:
	cd /home/nvidia/axolotl/navit-build/navit/graphics/opengl && $(CMAKE_COMMAND) -P CMakeFiles/graphics_opengl.dir/cmake_clean.cmake
.PHONY : navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/clean

navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/depend:
	cd /home/nvidia/axolotl/navit-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nvidia/axolotl/navit /home/nvidia/axolotl/navit/navit/graphics/opengl /home/nvidia/axolotl/navit-build /home/nvidia/axolotl/navit-build/navit/graphics/opengl /home/nvidia/axolotl/navit-build/navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : navit/graphics/opengl/CMakeFiles/graphics_opengl.dir/depend

