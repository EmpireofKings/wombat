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
include navit/map/mg/CMakeFiles/map_mg.dir/depend.make

# Include the progress variables for this target.
include navit/map/mg/CMakeFiles/map_mg.dir/progress.make

# Include the compile flags for this target's objects.
include navit/map/mg/CMakeFiles/map_mg.dir/flags.make

navit/map/mg/CMakeFiles/map_mg.dir/map.c.o: navit/map/mg/CMakeFiles/map_mg.dir/flags.make
navit/map/mg/CMakeFiles/map_mg.dir/map.c.o: /home/nvidia/axolotl/navit/navit/map/mg/map.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nvidia/axolotl/navit-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object navit/map/mg/CMakeFiles/map_mg.dir/map.c.o"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/map_mg.dir/map.c.o   -c /home/nvidia/axolotl/navit/navit/map/mg/map.c

navit/map/mg/CMakeFiles/map_mg.dir/map.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/map_mg.dir/map.c.i"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nvidia/axolotl/navit/navit/map/mg/map.c > CMakeFiles/map_mg.dir/map.c.i

navit/map/mg/CMakeFiles/map_mg.dir/map.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/map_mg.dir/map.c.s"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nvidia/axolotl/navit/navit/map/mg/map.c -o CMakeFiles/map_mg.dir/map.c.s

navit/map/mg/CMakeFiles/map_mg.dir/map.c.o.requires:

.PHONY : navit/map/mg/CMakeFiles/map_mg.dir/map.c.o.requires

navit/map/mg/CMakeFiles/map_mg.dir/map.c.o.provides: navit/map/mg/CMakeFiles/map_mg.dir/map.c.o.requires
	$(MAKE) -f navit/map/mg/CMakeFiles/map_mg.dir/build.make navit/map/mg/CMakeFiles/map_mg.dir/map.c.o.provides.build
.PHONY : navit/map/mg/CMakeFiles/map_mg.dir/map.c.o.provides

navit/map/mg/CMakeFiles/map_mg.dir/map.c.o.provides.build: navit/map/mg/CMakeFiles/map_mg.dir/map.c.o


navit/map/mg/CMakeFiles/map_mg.dir/block.c.o: navit/map/mg/CMakeFiles/map_mg.dir/flags.make
navit/map/mg/CMakeFiles/map_mg.dir/block.c.o: /home/nvidia/axolotl/navit/navit/map/mg/block.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nvidia/axolotl/navit-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object navit/map/mg/CMakeFiles/map_mg.dir/block.c.o"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/map_mg.dir/block.c.o   -c /home/nvidia/axolotl/navit/navit/map/mg/block.c

navit/map/mg/CMakeFiles/map_mg.dir/block.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/map_mg.dir/block.c.i"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nvidia/axolotl/navit/navit/map/mg/block.c > CMakeFiles/map_mg.dir/block.c.i

navit/map/mg/CMakeFiles/map_mg.dir/block.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/map_mg.dir/block.c.s"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nvidia/axolotl/navit/navit/map/mg/block.c -o CMakeFiles/map_mg.dir/block.c.s

navit/map/mg/CMakeFiles/map_mg.dir/block.c.o.requires:

.PHONY : navit/map/mg/CMakeFiles/map_mg.dir/block.c.o.requires

navit/map/mg/CMakeFiles/map_mg.dir/block.c.o.provides: navit/map/mg/CMakeFiles/map_mg.dir/block.c.o.requires
	$(MAKE) -f navit/map/mg/CMakeFiles/map_mg.dir/build.make navit/map/mg/CMakeFiles/map_mg.dir/block.c.o.provides.build
.PHONY : navit/map/mg/CMakeFiles/map_mg.dir/block.c.o.provides

navit/map/mg/CMakeFiles/map_mg.dir/block.c.o.provides.build: navit/map/mg/CMakeFiles/map_mg.dir/block.c.o


navit/map/mg/CMakeFiles/map_mg.dir/town.c.o: navit/map/mg/CMakeFiles/map_mg.dir/flags.make
navit/map/mg/CMakeFiles/map_mg.dir/town.c.o: /home/nvidia/axolotl/navit/navit/map/mg/town.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nvidia/axolotl/navit-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object navit/map/mg/CMakeFiles/map_mg.dir/town.c.o"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/map_mg.dir/town.c.o   -c /home/nvidia/axolotl/navit/navit/map/mg/town.c

navit/map/mg/CMakeFiles/map_mg.dir/town.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/map_mg.dir/town.c.i"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nvidia/axolotl/navit/navit/map/mg/town.c > CMakeFiles/map_mg.dir/town.c.i

navit/map/mg/CMakeFiles/map_mg.dir/town.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/map_mg.dir/town.c.s"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nvidia/axolotl/navit/navit/map/mg/town.c -o CMakeFiles/map_mg.dir/town.c.s

navit/map/mg/CMakeFiles/map_mg.dir/town.c.o.requires:

.PHONY : navit/map/mg/CMakeFiles/map_mg.dir/town.c.o.requires

navit/map/mg/CMakeFiles/map_mg.dir/town.c.o.provides: navit/map/mg/CMakeFiles/map_mg.dir/town.c.o.requires
	$(MAKE) -f navit/map/mg/CMakeFiles/map_mg.dir/build.make navit/map/mg/CMakeFiles/map_mg.dir/town.c.o.provides.build
.PHONY : navit/map/mg/CMakeFiles/map_mg.dir/town.c.o.provides

navit/map/mg/CMakeFiles/map_mg.dir/town.c.o.provides.build: navit/map/mg/CMakeFiles/map_mg.dir/town.c.o


navit/map/mg/CMakeFiles/map_mg.dir/tree.c.o: navit/map/mg/CMakeFiles/map_mg.dir/flags.make
navit/map/mg/CMakeFiles/map_mg.dir/tree.c.o: /home/nvidia/axolotl/navit/navit/map/mg/tree.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nvidia/axolotl/navit-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object navit/map/mg/CMakeFiles/map_mg.dir/tree.c.o"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/map_mg.dir/tree.c.o   -c /home/nvidia/axolotl/navit/navit/map/mg/tree.c

navit/map/mg/CMakeFiles/map_mg.dir/tree.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/map_mg.dir/tree.c.i"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nvidia/axolotl/navit/navit/map/mg/tree.c > CMakeFiles/map_mg.dir/tree.c.i

navit/map/mg/CMakeFiles/map_mg.dir/tree.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/map_mg.dir/tree.c.s"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nvidia/axolotl/navit/navit/map/mg/tree.c -o CMakeFiles/map_mg.dir/tree.c.s

navit/map/mg/CMakeFiles/map_mg.dir/tree.c.o.requires:

.PHONY : navit/map/mg/CMakeFiles/map_mg.dir/tree.c.o.requires

navit/map/mg/CMakeFiles/map_mg.dir/tree.c.o.provides: navit/map/mg/CMakeFiles/map_mg.dir/tree.c.o.requires
	$(MAKE) -f navit/map/mg/CMakeFiles/map_mg.dir/build.make navit/map/mg/CMakeFiles/map_mg.dir/tree.c.o.provides.build
.PHONY : navit/map/mg/CMakeFiles/map_mg.dir/tree.c.o.provides

navit/map/mg/CMakeFiles/map_mg.dir/tree.c.o.provides.build: navit/map/mg/CMakeFiles/map_mg.dir/tree.c.o


navit/map/mg/CMakeFiles/map_mg.dir/poly.c.o: navit/map/mg/CMakeFiles/map_mg.dir/flags.make
navit/map/mg/CMakeFiles/map_mg.dir/poly.c.o: /home/nvidia/axolotl/navit/navit/map/mg/poly.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nvidia/axolotl/navit-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object navit/map/mg/CMakeFiles/map_mg.dir/poly.c.o"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/map_mg.dir/poly.c.o   -c /home/nvidia/axolotl/navit/navit/map/mg/poly.c

navit/map/mg/CMakeFiles/map_mg.dir/poly.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/map_mg.dir/poly.c.i"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nvidia/axolotl/navit/navit/map/mg/poly.c > CMakeFiles/map_mg.dir/poly.c.i

navit/map/mg/CMakeFiles/map_mg.dir/poly.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/map_mg.dir/poly.c.s"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nvidia/axolotl/navit/navit/map/mg/poly.c -o CMakeFiles/map_mg.dir/poly.c.s

navit/map/mg/CMakeFiles/map_mg.dir/poly.c.o.requires:

.PHONY : navit/map/mg/CMakeFiles/map_mg.dir/poly.c.o.requires

navit/map/mg/CMakeFiles/map_mg.dir/poly.c.o.provides: navit/map/mg/CMakeFiles/map_mg.dir/poly.c.o.requires
	$(MAKE) -f navit/map/mg/CMakeFiles/map_mg.dir/build.make navit/map/mg/CMakeFiles/map_mg.dir/poly.c.o.provides.build
.PHONY : navit/map/mg/CMakeFiles/map_mg.dir/poly.c.o.provides

navit/map/mg/CMakeFiles/map_mg.dir/poly.c.o.provides.build: navit/map/mg/CMakeFiles/map_mg.dir/poly.c.o


navit/map/mg/CMakeFiles/map_mg.dir/street.c.o: navit/map/mg/CMakeFiles/map_mg.dir/flags.make
navit/map/mg/CMakeFiles/map_mg.dir/street.c.o: /home/nvidia/axolotl/navit/navit/map/mg/street.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nvidia/axolotl/navit-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object navit/map/mg/CMakeFiles/map_mg.dir/street.c.o"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/map_mg.dir/street.c.o   -c /home/nvidia/axolotl/navit/navit/map/mg/street.c

navit/map/mg/CMakeFiles/map_mg.dir/street.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/map_mg.dir/street.c.i"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nvidia/axolotl/navit/navit/map/mg/street.c > CMakeFiles/map_mg.dir/street.c.i

navit/map/mg/CMakeFiles/map_mg.dir/street.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/map_mg.dir/street.c.s"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nvidia/axolotl/navit/navit/map/mg/street.c -o CMakeFiles/map_mg.dir/street.c.s

navit/map/mg/CMakeFiles/map_mg.dir/street.c.o.requires:

.PHONY : navit/map/mg/CMakeFiles/map_mg.dir/street.c.o.requires

navit/map/mg/CMakeFiles/map_mg.dir/street.c.o.provides: navit/map/mg/CMakeFiles/map_mg.dir/street.c.o.requires
	$(MAKE) -f navit/map/mg/CMakeFiles/map_mg.dir/build.make navit/map/mg/CMakeFiles/map_mg.dir/street.c.o.provides.build
.PHONY : navit/map/mg/CMakeFiles/map_mg.dir/street.c.o.provides

navit/map/mg/CMakeFiles/map_mg.dir/street.c.o.provides.build: navit/map/mg/CMakeFiles/map_mg.dir/street.c.o


# Object files for target map_mg
map_mg_OBJECTS = \
"CMakeFiles/map_mg.dir/map.c.o" \
"CMakeFiles/map_mg.dir/block.c.o" \
"CMakeFiles/map_mg.dir/town.c.o" \
"CMakeFiles/map_mg.dir/tree.c.o" \
"CMakeFiles/map_mg.dir/poly.c.o" \
"CMakeFiles/map_mg.dir/street.c.o"

# External object files for target map_mg
map_mg_EXTERNAL_OBJECTS =

navit/map/mg/.libs/libmap_mg.so: navit/map/mg/CMakeFiles/map_mg.dir/map.c.o
navit/map/mg/.libs/libmap_mg.so: navit/map/mg/CMakeFiles/map_mg.dir/block.c.o
navit/map/mg/.libs/libmap_mg.so: navit/map/mg/CMakeFiles/map_mg.dir/town.c.o
navit/map/mg/.libs/libmap_mg.so: navit/map/mg/CMakeFiles/map_mg.dir/tree.c.o
navit/map/mg/.libs/libmap_mg.so: navit/map/mg/CMakeFiles/map_mg.dir/poly.c.o
navit/map/mg/.libs/libmap_mg.so: navit/map/mg/CMakeFiles/map_mg.dir/street.c.o
navit/map/mg/.libs/libmap_mg.so: navit/map/mg/CMakeFiles/map_mg.dir/build.make
navit/map/mg/.libs/libmap_mg.so: navit/map/mg/CMakeFiles/map_mg.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nvidia/axolotl/navit-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking C shared module .libs/libmap_mg.so"
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/map_mg.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
navit/map/mg/CMakeFiles/map_mg.dir/build: navit/map/mg/.libs/libmap_mg.so

.PHONY : navit/map/mg/CMakeFiles/map_mg.dir/build

navit/map/mg/CMakeFiles/map_mg.dir/requires: navit/map/mg/CMakeFiles/map_mg.dir/map.c.o.requires
navit/map/mg/CMakeFiles/map_mg.dir/requires: navit/map/mg/CMakeFiles/map_mg.dir/block.c.o.requires
navit/map/mg/CMakeFiles/map_mg.dir/requires: navit/map/mg/CMakeFiles/map_mg.dir/town.c.o.requires
navit/map/mg/CMakeFiles/map_mg.dir/requires: navit/map/mg/CMakeFiles/map_mg.dir/tree.c.o.requires
navit/map/mg/CMakeFiles/map_mg.dir/requires: navit/map/mg/CMakeFiles/map_mg.dir/poly.c.o.requires
navit/map/mg/CMakeFiles/map_mg.dir/requires: navit/map/mg/CMakeFiles/map_mg.dir/street.c.o.requires

.PHONY : navit/map/mg/CMakeFiles/map_mg.dir/requires

navit/map/mg/CMakeFiles/map_mg.dir/clean:
	cd /home/nvidia/axolotl/navit-build/navit/map/mg && $(CMAKE_COMMAND) -P CMakeFiles/map_mg.dir/cmake_clean.cmake
.PHONY : navit/map/mg/CMakeFiles/map_mg.dir/clean

navit/map/mg/CMakeFiles/map_mg.dir/depend:
	cd /home/nvidia/axolotl/navit-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nvidia/axolotl/navit /home/nvidia/axolotl/navit/navit/map/mg /home/nvidia/axolotl/navit-build /home/nvidia/axolotl/navit-build/navit/map/mg /home/nvidia/axolotl/navit-build/navit/map/mg/CMakeFiles/map_mg.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : navit/map/mg/CMakeFiles/map_mg.dir/depend

