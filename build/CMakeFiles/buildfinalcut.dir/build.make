# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_SOURCE_DIR = /homes/dhg18/OOP_cw/MailPunk

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /homes/dhg18/OOP_cw/MailPunk/build

# Utility rule file for buildfinalcut.

# Include the progress variables for this target.
include CMakeFiles/buildfinalcut.dir/progress.make

CMakeFiles/buildfinalcut: CMakeFiles/buildfinalcut-complete


CMakeFiles/buildfinalcut-complete: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-install
CMakeFiles/buildfinalcut-complete: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-mkdir
CMakeFiles/buildfinalcut-complete: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-download
CMakeFiles/buildfinalcut-complete: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-update
CMakeFiles/buildfinalcut-complete: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-patch
CMakeFiles/buildfinalcut-complete: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-configure
CMakeFiles/buildfinalcut-complete: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-build
CMakeFiles/buildfinalcut-complete: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/homes/dhg18/OOP_cw/MailPunk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'buildfinalcut'"
	/usr/bin/cmake -E make_directory /homes/dhg18/OOP_cw/MailPunk/build/CMakeFiles
	/usr/bin/cmake -E touch /homes/dhg18/OOP_cw/MailPunk/build/CMakeFiles/buildfinalcut-complete
	/usr/bin/cmake -E touch /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-done

buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-install: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/homes/dhg18/OOP_cw/MailPunk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Performing install step for 'buildfinalcut'"
	cd /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut && $(MAKE) install
	cd /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut && /usr/bin/cmake -E touch /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-install

buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/homes/dhg18/OOP_cw/MailPunk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Creating directories for 'buildfinalcut'"
	/usr/bin/cmake -E make_directory /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut
	/usr/bin/cmake -E make_directory /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut
	/usr/bin/cmake -E make_directory /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix
	/usr/bin/cmake -E make_directory /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/tmp
	/usr/bin/cmake -E make_directory /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut-stamp
	/usr/bin/cmake -E make_directory /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src
	/usr/bin/cmake -E touch /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-mkdir

buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-download: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-urlinfo.txt
buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-download: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/homes/dhg18/OOP_cw/MailPunk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (download, verify and extract) for 'buildfinalcut'"
	cd /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src && /usr/bin/cmake -P /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut-stamp/download-buildfinalcut.cmake
	cd /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src && /usr/bin/cmake -P /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut-stamp/verify-buildfinalcut.cmake
	cd /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src && /usr/bin/cmake -P /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut-stamp/extract-buildfinalcut.cmake
	cd /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src && /usr/bin/cmake -E touch /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-download

buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-update: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/homes/dhg18/OOP_cw/MailPunk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No update step for 'buildfinalcut'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-update

buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-patch: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/homes/dhg18/OOP_cw/MailPunk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Performing patch step for 'buildfinalcut'"
	cd /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut && ./autogen.sh
	cd /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut && /usr/bin/cmake -E touch /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-patch

buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-configure: buildfinalcut-prefix/tmp/buildfinalcut-cfgcmd.txt
buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-configure: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-update
buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-configure: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/homes/dhg18/OOP_cw/MailPunk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Performing configure step for 'buildfinalcut'"
	cd /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut && ./configure --prefix /homes/dhg18/OOP_cw/MailPunk/build/deps
	cd /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut && /usr/bin/cmake -E touch /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-configure

buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-build: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/homes/dhg18/OOP_cw/MailPunk/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Performing build step for 'buildfinalcut'"
	cd /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut && make
	cd /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut && /usr/bin/cmake -E touch /homes/dhg18/OOP_cw/MailPunk/build/buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-build

buildfinalcut: CMakeFiles/buildfinalcut
buildfinalcut: CMakeFiles/buildfinalcut-complete
buildfinalcut: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-install
buildfinalcut: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-mkdir
buildfinalcut: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-download
buildfinalcut: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-update
buildfinalcut: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-patch
buildfinalcut: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-configure
buildfinalcut: buildfinalcut-prefix/src/buildfinalcut-stamp/buildfinalcut-build
buildfinalcut: CMakeFiles/buildfinalcut.dir/build.make

.PHONY : buildfinalcut

# Rule to build all files generated by this target.
CMakeFiles/buildfinalcut.dir/build: buildfinalcut

.PHONY : CMakeFiles/buildfinalcut.dir/build

CMakeFiles/buildfinalcut.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/buildfinalcut.dir/cmake_clean.cmake
.PHONY : CMakeFiles/buildfinalcut.dir/clean

CMakeFiles/buildfinalcut.dir/depend:
	cd /homes/dhg18/OOP_cw/MailPunk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /homes/dhg18/OOP_cw/MailPunk /homes/dhg18/OOP_cw/MailPunk /homes/dhg18/OOP_cw/MailPunk/build /homes/dhg18/OOP_cw/MailPunk/build /homes/dhg18/OOP_cw/MailPunk/build/CMakeFiles/buildfinalcut.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/buildfinalcut.dir/depend

