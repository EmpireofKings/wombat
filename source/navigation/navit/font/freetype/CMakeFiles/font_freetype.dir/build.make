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
include navit/font/freetype/CMakeFiles/font_freetype.dir/depend.make

# Include the progress variables for this target.
include navit/font/freetype/CMakeFiles/font_freetype.dir/progress.make

# Include the compile flags for this target's objects.
include navit/font/freetype/CMakeFiles/font_freetype.dir/flags.make

navit/font/freetype/CMakeFiles/font_freetype.dir/font_freetype.c.o: navit/font/freetype/CMakeFiles/font_freetype.dir/flags.make
navit/font/freetype/CMakeFiles/font_freetype.dir/font_freetype.c.o: /home/nvidia/axolotl/navit/navit/font/freetype/font_freetype.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nvidia/axolotl/navit-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object navit/font/freetype/CMakeFiles/font_freetype.dir/font_freetype.c.o"
	cd /home/nvidia/axolotl/navit-build/navit/font/freetype && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/font_freetype.dir/font_freetype.c.o   -c /home/nvidia/axolotl/navit/navit/font/freetype/font_freetype.c

navit/font/freetype/CMakeFiles/font_freetype.dir/font_freetype.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/font_freetype.dir/font_freetype.c.i"
	cd /home/nvidia/axolotl/navit-build/navit/font/freetype && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nvidia/axolotl/navit/navit/font/freetype/font_freetype.c > CMakeFiles/font_freetype.dir/font_freetype.c.i

navit/font/freetype/CMakeFiles/font_freetype.dir/font_freetype.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/font_freetype.dir/font_freetype.c.s"
	cd /home/nvidia/axolotl/navit-build/navit/font/freetype && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nvidia/axolotl/navit/navit/font/freetype/font_freetype.c -o CMakeFiles/font_freetype.dir/font_freetype.c.s

navit/font/freetype/CMakeFiles/font_freetype.dir/font_freetype.c.o.requires:

.PHONY : navit/font/freetype/CMakeFiles/font_freetype.dir/font_freetype.c.o.requires

navit/font/freetype/CMakeFiles/font_freetype.dir/font_freetype.c.o.provides: navit/font/freetype/CMakeFiles/font_freetype.dir/font_freetype.c.o.requires
	$(MAKE) -f navit/font/freetype/CMakeFiles/font_freetype.dir/build.make navit/font/freetype/CMakeFiles/font_freetype.dir/font_freetype.c.o.provides.build
.PHONY : navit/font/freetype/CMakeFiles/font_freetype.dir/font_freetype.c.o.provides

navit/font/freetype/CMakeFiles/font_freetype.dir/font_freetype.c.o.provides.build: navit/font/freetype/CMakeFiles/font_freetype.dir/font_freetype.c.o


# Object files for target font_freetype
font_freetype_OBJECTS = \
"CMakeFiles/font_freetype.dir/font_freetype.c.o"

# External object files for target font_freetype
font_freetype_EXTERNAL_OBJECTS =

navit/font/freetype/.libs/libfont_freetype.so: navit/font/freetype/CMakeFiles/font_freetype.dir/font_freetype.c.o
navit/font/freetype/.libs/libfont_freetype.so: navit/font/freetype/CMakeFiles/font_freetype.dir/build.make
navit/font/freetype/.libs/libfont_freetype.so: /usr/lib/aarch64-linux-gnu/libfreetype.so
navit/font/freetype/.libs/libfont_freetype.so: navit/font/freetype/CMakeFiles/font_freetype.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nvidia/axolotl/navit-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared module .libs/libfont_freetype.so"
	cd /home/nvidia/axolotl/navit-build/navit/font/freetype && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/font_freetype.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
navit/font/freetype/CMakeFiles/font_freetype.dir/build: navit/font/freetype/.libs/libfont_freetype.so

.PHONY : navit/font/freetype/CMakeFiles/font_freetype.dir/build

navit/font/freetype/CMakeFiles/font_freetype.dir/requires: navit/font/freetype/CMakeFiles/font_freetype.dir/font_freetype.c.o.requires

.PHONY : navit/font/freetype/CMakeFiles/font_freetype.dir/requires

navit/font/freetype/CMakeFiles/font_freetype.dir/clean:
	cd /home/nvidia/axolotl/navit-build/navit/font/freetype && $(CMAKE_COMMAND) -P CMakeFiles/font_freetype.dir/cmake_clean.cmake
.PHONY : navit/font/freetype/CMakeFiles/font_freetype.dir/clean

navit/font/freetype/CMakeFiles/font_freetype.dir/depend:
	cd /home/nvidia/axolotl/navit-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nvidia/axolotl/navit /home/nvidia/axolotl/navit/navit/font/freetype /home/nvidia/axolotl/navit-build /home/nvidia/axolotl/navit-build/navit/font/freetype /home/nvidia/axolotl/navit-build/navit/font/freetype/CMakeFiles/font_freetype.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : navit/font/freetype/CMakeFiles/font_freetype.dir/depend

