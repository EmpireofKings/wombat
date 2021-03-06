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
include navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/depend.make

# Include the progress variables for this target.
include navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/progress.make

# Include the compile flags for this target's objects.
include navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/flags.make

navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/vehicle_demo.c.o: navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/flags.make
navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/vehicle_demo.c.o: /home/nvidia/axolotl/navit/navit/vehicle/demo/vehicle_demo.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nvidia/axolotl/navit-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/vehicle_demo.c.o"
	cd /home/nvidia/axolotl/navit-build/navit/vehicle/demo && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/vehicle_demo.dir/vehicle_demo.c.o   -c /home/nvidia/axolotl/navit/navit/vehicle/demo/vehicle_demo.c

navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/vehicle_demo.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/vehicle_demo.dir/vehicle_demo.c.i"
	cd /home/nvidia/axolotl/navit-build/navit/vehicle/demo && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nvidia/axolotl/navit/navit/vehicle/demo/vehicle_demo.c > CMakeFiles/vehicle_demo.dir/vehicle_demo.c.i

navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/vehicle_demo.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/vehicle_demo.dir/vehicle_demo.c.s"
	cd /home/nvidia/axolotl/navit-build/navit/vehicle/demo && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nvidia/axolotl/navit/navit/vehicle/demo/vehicle_demo.c -o CMakeFiles/vehicle_demo.dir/vehicle_demo.c.s

navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/vehicle_demo.c.o.requires:

.PHONY : navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/vehicle_demo.c.o.requires

navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/vehicle_demo.c.o.provides: navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/vehicle_demo.c.o.requires
	$(MAKE) -f navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/build.make navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/vehicle_demo.c.o.provides.build
.PHONY : navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/vehicle_demo.c.o.provides

navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/vehicle_demo.c.o.provides.build: navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/vehicle_demo.c.o


# Object files for target vehicle_demo
vehicle_demo_OBJECTS = \
"CMakeFiles/vehicle_demo.dir/vehicle_demo.c.o"

# External object files for target vehicle_demo
vehicle_demo_EXTERNAL_OBJECTS =

navit/vehicle/demo/.libs/libvehicle_demo.so: navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/vehicle_demo.c.o
navit/vehicle/demo/.libs/libvehicle_demo.so: navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/build.make
navit/vehicle/demo/.libs/libvehicle_demo.so: navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nvidia/axolotl/navit-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared module .libs/libvehicle_demo.so"
	cd /home/nvidia/axolotl/navit-build/navit/vehicle/demo && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vehicle_demo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/build: navit/vehicle/demo/.libs/libvehicle_demo.so

.PHONY : navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/build

navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/requires: navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/vehicle_demo.c.o.requires

.PHONY : navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/requires

navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/clean:
	cd /home/nvidia/axolotl/navit-build/navit/vehicle/demo && $(CMAKE_COMMAND) -P CMakeFiles/vehicle_demo.dir/cmake_clean.cmake
.PHONY : navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/clean

navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/depend:
	cd /home/nvidia/axolotl/navit-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nvidia/axolotl/navit /home/nvidia/axolotl/navit/navit/vehicle/demo /home/nvidia/axolotl/navit-build /home/nvidia/axolotl/navit-build/navit/vehicle/demo /home/nvidia/axolotl/navit-build/navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : navit/vehicle/demo/CMakeFiles/vehicle_demo.dir/depend

