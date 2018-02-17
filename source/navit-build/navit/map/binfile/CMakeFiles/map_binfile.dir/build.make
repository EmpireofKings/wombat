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
include navit/map/binfile/CMakeFiles/map_binfile.dir/depend.make

# Include the progress variables for this target.
include navit/map/binfile/CMakeFiles/map_binfile.dir/progress.make

# Include the compile flags for this target's objects.
include navit/map/binfile/CMakeFiles/map_binfile.dir/flags.make

navit/map/binfile/CMakeFiles/map_binfile.dir/binfile.c.o: navit/map/binfile/CMakeFiles/map_binfile.dir/flags.make
navit/map/binfile/CMakeFiles/map_binfile.dir/binfile.c.o: /home/nvidia/axolotl/navit/navit/map/binfile/binfile.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nvidia/axolotl/navit-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object navit/map/binfile/CMakeFiles/map_binfile.dir/binfile.c.o"
	cd /home/nvidia/axolotl/navit-build/navit/map/binfile && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/map_binfile.dir/binfile.c.o   -c /home/nvidia/axolotl/navit/navit/map/binfile/binfile.c

navit/map/binfile/CMakeFiles/map_binfile.dir/binfile.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/map_binfile.dir/binfile.c.i"
	cd /home/nvidia/axolotl/navit-build/navit/map/binfile && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nvidia/axolotl/navit/navit/map/binfile/binfile.c > CMakeFiles/map_binfile.dir/binfile.c.i

navit/map/binfile/CMakeFiles/map_binfile.dir/binfile.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/map_binfile.dir/binfile.c.s"
	cd /home/nvidia/axolotl/navit-build/navit/map/binfile && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nvidia/axolotl/navit/navit/map/binfile/binfile.c -o CMakeFiles/map_binfile.dir/binfile.c.s

navit/map/binfile/CMakeFiles/map_binfile.dir/binfile.c.o.requires:

.PHONY : navit/map/binfile/CMakeFiles/map_binfile.dir/binfile.c.o.requires

navit/map/binfile/CMakeFiles/map_binfile.dir/binfile.c.o.provides: navit/map/binfile/CMakeFiles/map_binfile.dir/binfile.c.o.requires
	$(MAKE) -f navit/map/binfile/CMakeFiles/map_binfile.dir/build.make navit/map/binfile/CMakeFiles/map_binfile.dir/binfile.c.o.provides.build
.PHONY : navit/map/binfile/CMakeFiles/map_binfile.dir/binfile.c.o.provides

navit/map/binfile/CMakeFiles/map_binfile.dir/binfile.c.o.provides.build: navit/map/binfile/CMakeFiles/map_binfile.dir/binfile.c.o


# Object files for target map_binfile
map_binfile_OBJECTS = \
"CMakeFiles/map_binfile.dir/binfile.c.o"

# External object files for target map_binfile
map_binfile_EXTERNAL_OBJECTS =

navit/map/binfile/.libs/libmap_binfile.so: navit/map/binfile/CMakeFiles/map_binfile.dir/binfile.c.o
navit/map/binfile/.libs/libmap_binfile.so: navit/map/binfile/CMakeFiles/map_binfile.dir/build.make
navit/map/binfile/.libs/libmap_binfile.so: navit/map/binfile/CMakeFiles/map_binfile.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nvidia/axolotl/navit-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared module .libs/libmap_binfile.so"
	cd /home/nvidia/axolotl/navit-build/navit/map/binfile && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/map_binfile.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
navit/map/binfile/CMakeFiles/map_binfile.dir/build: navit/map/binfile/.libs/libmap_binfile.so

.PHONY : navit/map/binfile/CMakeFiles/map_binfile.dir/build

navit/map/binfile/CMakeFiles/map_binfile.dir/requires: navit/map/binfile/CMakeFiles/map_binfile.dir/binfile.c.o.requires

.PHONY : navit/map/binfile/CMakeFiles/map_binfile.dir/requires

navit/map/binfile/CMakeFiles/map_binfile.dir/clean:
	cd /home/nvidia/axolotl/navit-build/navit/map/binfile && $(CMAKE_COMMAND) -P CMakeFiles/map_binfile.dir/cmake_clean.cmake
.PHONY : navit/map/binfile/CMakeFiles/map_binfile.dir/clean

navit/map/binfile/CMakeFiles/map_binfile.dir/depend:
	cd /home/nvidia/axolotl/navit-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nvidia/axolotl/navit /home/nvidia/axolotl/navit/navit/map/binfile /home/nvidia/axolotl/navit-build /home/nvidia/axolotl/navit-build/navit/map/binfile /home/nvidia/axolotl/navit-build/navit/map/binfile/CMakeFiles/map_binfile.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : navit/map/binfile/CMakeFiles/map_binfile.dir/depend

