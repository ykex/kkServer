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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yk/c_cpp/server

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yk/c_cpp/server/build

# Include any dependencies generated for this target.
include CMakeFiles/lserver.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/lserver.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lserver.dir/flags.make

CMakeFiles/lserver.dir/Buffer.cpp.o: CMakeFiles/lserver.dir/flags.make
CMakeFiles/lserver.dir/Buffer.cpp.o: ../Buffer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yk/c_cpp/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/lserver.dir/Buffer.cpp.o"
	/usr/bin/g++-5  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lserver.dir/Buffer.cpp.o -c /home/yk/c_cpp/server/Buffer.cpp

CMakeFiles/lserver.dir/Buffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lserver.dir/Buffer.cpp.i"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yk/c_cpp/server/Buffer.cpp > CMakeFiles/lserver.dir/Buffer.cpp.i

CMakeFiles/lserver.dir/Buffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lserver.dir/Buffer.cpp.s"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yk/c_cpp/server/Buffer.cpp -o CMakeFiles/lserver.dir/Buffer.cpp.s

CMakeFiles/lserver.dir/Buffer.cpp.o.requires:

.PHONY : CMakeFiles/lserver.dir/Buffer.cpp.o.requires

CMakeFiles/lserver.dir/Buffer.cpp.o.provides: CMakeFiles/lserver.dir/Buffer.cpp.o.requires
	$(MAKE) -f CMakeFiles/lserver.dir/build.make CMakeFiles/lserver.dir/Buffer.cpp.o.provides.build
.PHONY : CMakeFiles/lserver.dir/Buffer.cpp.o.provides

CMakeFiles/lserver.dir/Buffer.cpp.o.provides.build: CMakeFiles/lserver.dir/Buffer.cpp.o


CMakeFiles/lserver.dir/Channel.cpp.o: CMakeFiles/lserver.dir/flags.make
CMakeFiles/lserver.dir/Channel.cpp.o: ../Channel.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yk/c_cpp/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/lserver.dir/Channel.cpp.o"
	/usr/bin/g++-5  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lserver.dir/Channel.cpp.o -c /home/yk/c_cpp/server/Channel.cpp

CMakeFiles/lserver.dir/Channel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lserver.dir/Channel.cpp.i"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yk/c_cpp/server/Channel.cpp > CMakeFiles/lserver.dir/Channel.cpp.i

CMakeFiles/lserver.dir/Channel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lserver.dir/Channel.cpp.s"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yk/c_cpp/server/Channel.cpp -o CMakeFiles/lserver.dir/Channel.cpp.s

CMakeFiles/lserver.dir/Channel.cpp.o.requires:

.PHONY : CMakeFiles/lserver.dir/Channel.cpp.o.requires

CMakeFiles/lserver.dir/Channel.cpp.o.provides: CMakeFiles/lserver.dir/Channel.cpp.o.requires
	$(MAKE) -f CMakeFiles/lserver.dir/build.make CMakeFiles/lserver.dir/Channel.cpp.o.provides.build
.PHONY : CMakeFiles/lserver.dir/Channel.cpp.o.provides

CMakeFiles/lserver.dir/Channel.cpp.o.provides.build: CMakeFiles/lserver.dir/Channel.cpp.o


CMakeFiles/lserver.dir/Epoll.cpp.o: CMakeFiles/lserver.dir/flags.make
CMakeFiles/lserver.dir/Epoll.cpp.o: ../Epoll.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yk/c_cpp/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/lserver.dir/Epoll.cpp.o"
	/usr/bin/g++-5  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lserver.dir/Epoll.cpp.o -c /home/yk/c_cpp/server/Epoll.cpp

CMakeFiles/lserver.dir/Epoll.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lserver.dir/Epoll.cpp.i"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yk/c_cpp/server/Epoll.cpp > CMakeFiles/lserver.dir/Epoll.cpp.i

CMakeFiles/lserver.dir/Epoll.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lserver.dir/Epoll.cpp.s"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yk/c_cpp/server/Epoll.cpp -o CMakeFiles/lserver.dir/Epoll.cpp.s

CMakeFiles/lserver.dir/Epoll.cpp.o.requires:

.PHONY : CMakeFiles/lserver.dir/Epoll.cpp.o.requires

CMakeFiles/lserver.dir/Epoll.cpp.o.provides: CMakeFiles/lserver.dir/Epoll.cpp.o.requires
	$(MAKE) -f CMakeFiles/lserver.dir/build.make CMakeFiles/lserver.dir/Epoll.cpp.o.provides.build
.PHONY : CMakeFiles/lserver.dir/Epoll.cpp.o.provides

CMakeFiles/lserver.dir/Epoll.cpp.o.provides.build: CMakeFiles/lserver.dir/Epoll.cpp.o


CMakeFiles/lserver.dir/EventLoop.cpp.o: CMakeFiles/lserver.dir/flags.make
CMakeFiles/lserver.dir/EventLoop.cpp.o: ../EventLoop.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yk/c_cpp/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/lserver.dir/EventLoop.cpp.o"
	/usr/bin/g++-5  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lserver.dir/EventLoop.cpp.o -c /home/yk/c_cpp/server/EventLoop.cpp

CMakeFiles/lserver.dir/EventLoop.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lserver.dir/EventLoop.cpp.i"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yk/c_cpp/server/EventLoop.cpp > CMakeFiles/lserver.dir/EventLoop.cpp.i

CMakeFiles/lserver.dir/EventLoop.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lserver.dir/EventLoop.cpp.s"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yk/c_cpp/server/EventLoop.cpp -o CMakeFiles/lserver.dir/EventLoop.cpp.s

CMakeFiles/lserver.dir/EventLoop.cpp.o.requires:

.PHONY : CMakeFiles/lserver.dir/EventLoop.cpp.o.requires

CMakeFiles/lserver.dir/EventLoop.cpp.o.provides: CMakeFiles/lserver.dir/EventLoop.cpp.o.requires
	$(MAKE) -f CMakeFiles/lserver.dir/build.make CMakeFiles/lserver.dir/EventLoop.cpp.o.provides.build
.PHONY : CMakeFiles/lserver.dir/EventLoop.cpp.o.provides

CMakeFiles/lserver.dir/EventLoop.cpp.o.provides.build: CMakeFiles/lserver.dir/EventLoop.cpp.o


CMakeFiles/lserver.dir/EventLoopThread.cpp.o: CMakeFiles/lserver.dir/flags.make
CMakeFiles/lserver.dir/EventLoopThread.cpp.o: ../EventLoopThread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yk/c_cpp/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/lserver.dir/EventLoopThread.cpp.o"
	/usr/bin/g++-5  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lserver.dir/EventLoopThread.cpp.o -c /home/yk/c_cpp/server/EventLoopThread.cpp

CMakeFiles/lserver.dir/EventLoopThread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lserver.dir/EventLoopThread.cpp.i"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yk/c_cpp/server/EventLoopThread.cpp > CMakeFiles/lserver.dir/EventLoopThread.cpp.i

CMakeFiles/lserver.dir/EventLoopThread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lserver.dir/EventLoopThread.cpp.s"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yk/c_cpp/server/EventLoopThread.cpp -o CMakeFiles/lserver.dir/EventLoopThread.cpp.s

CMakeFiles/lserver.dir/EventLoopThread.cpp.o.requires:

.PHONY : CMakeFiles/lserver.dir/EventLoopThread.cpp.o.requires

CMakeFiles/lserver.dir/EventLoopThread.cpp.o.provides: CMakeFiles/lserver.dir/EventLoopThread.cpp.o.requires
	$(MAKE) -f CMakeFiles/lserver.dir/build.make CMakeFiles/lserver.dir/EventLoopThread.cpp.o.provides.build
.PHONY : CMakeFiles/lserver.dir/EventLoopThread.cpp.o.provides

CMakeFiles/lserver.dir/EventLoopThread.cpp.o.provides.build: CMakeFiles/lserver.dir/EventLoopThread.cpp.o


CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.o: CMakeFiles/lserver.dir/flags.make
CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.o: ../EventLoopThreadPool.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yk/c_cpp/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.o"
	/usr/bin/g++-5  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.o -c /home/yk/c_cpp/server/EventLoopThreadPool.cpp

CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.i"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yk/c_cpp/server/EventLoopThreadPool.cpp > CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.i

CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.s"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yk/c_cpp/server/EventLoopThreadPool.cpp -o CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.s

CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.o.requires:

.PHONY : CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.o.requires

CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.o.provides: CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.o.requires
	$(MAKE) -f CMakeFiles/lserver.dir/build.make CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.o.provides.build
.PHONY : CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.o.provides

CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.o.provides.build: CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.o


CMakeFiles/lserver.dir/Server.cpp.o: CMakeFiles/lserver.dir/flags.make
CMakeFiles/lserver.dir/Server.cpp.o: ../Server.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yk/c_cpp/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/lserver.dir/Server.cpp.o"
	/usr/bin/g++-5  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lserver.dir/Server.cpp.o -c /home/yk/c_cpp/server/Server.cpp

CMakeFiles/lserver.dir/Server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lserver.dir/Server.cpp.i"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yk/c_cpp/server/Server.cpp > CMakeFiles/lserver.dir/Server.cpp.i

CMakeFiles/lserver.dir/Server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lserver.dir/Server.cpp.s"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yk/c_cpp/server/Server.cpp -o CMakeFiles/lserver.dir/Server.cpp.s

CMakeFiles/lserver.dir/Server.cpp.o.requires:

.PHONY : CMakeFiles/lserver.dir/Server.cpp.o.requires

CMakeFiles/lserver.dir/Server.cpp.o.provides: CMakeFiles/lserver.dir/Server.cpp.o.requires
	$(MAKE) -f CMakeFiles/lserver.dir/build.make CMakeFiles/lserver.dir/Server.cpp.o.provides.build
.PHONY : CMakeFiles/lserver.dir/Server.cpp.o.provides

CMakeFiles/lserver.dir/Server.cpp.o.provides.build: CMakeFiles/lserver.dir/Server.cpp.o


CMakeFiles/lserver.dir/TcpConnection.cpp.o: CMakeFiles/lserver.dir/flags.make
CMakeFiles/lserver.dir/TcpConnection.cpp.o: ../TcpConnection.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yk/c_cpp/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/lserver.dir/TcpConnection.cpp.o"
	/usr/bin/g++-5  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lserver.dir/TcpConnection.cpp.o -c /home/yk/c_cpp/server/TcpConnection.cpp

CMakeFiles/lserver.dir/TcpConnection.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lserver.dir/TcpConnection.cpp.i"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yk/c_cpp/server/TcpConnection.cpp > CMakeFiles/lserver.dir/TcpConnection.cpp.i

CMakeFiles/lserver.dir/TcpConnection.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lserver.dir/TcpConnection.cpp.s"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yk/c_cpp/server/TcpConnection.cpp -o CMakeFiles/lserver.dir/TcpConnection.cpp.s

CMakeFiles/lserver.dir/TcpConnection.cpp.o.requires:

.PHONY : CMakeFiles/lserver.dir/TcpConnection.cpp.o.requires

CMakeFiles/lserver.dir/TcpConnection.cpp.o.provides: CMakeFiles/lserver.dir/TcpConnection.cpp.o.requires
	$(MAKE) -f CMakeFiles/lserver.dir/build.make CMakeFiles/lserver.dir/TcpConnection.cpp.o.provides.build
.PHONY : CMakeFiles/lserver.dir/TcpConnection.cpp.o.provides

CMakeFiles/lserver.dir/TcpConnection.cpp.o.provides.build: CMakeFiles/lserver.dir/TcpConnection.cpp.o


CMakeFiles/lserver.dir/Timer.cpp.o: CMakeFiles/lserver.dir/flags.make
CMakeFiles/lserver.dir/Timer.cpp.o: ../Timer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yk/c_cpp/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/lserver.dir/Timer.cpp.o"
	/usr/bin/g++-5  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lserver.dir/Timer.cpp.o -c /home/yk/c_cpp/server/Timer.cpp

CMakeFiles/lserver.dir/Timer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lserver.dir/Timer.cpp.i"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yk/c_cpp/server/Timer.cpp > CMakeFiles/lserver.dir/Timer.cpp.i

CMakeFiles/lserver.dir/Timer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lserver.dir/Timer.cpp.s"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yk/c_cpp/server/Timer.cpp -o CMakeFiles/lserver.dir/Timer.cpp.s

CMakeFiles/lserver.dir/Timer.cpp.o.requires:

.PHONY : CMakeFiles/lserver.dir/Timer.cpp.o.requires

CMakeFiles/lserver.dir/Timer.cpp.o.provides: CMakeFiles/lserver.dir/Timer.cpp.o.requires
	$(MAKE) -f CMakeFiles/lserver.dir/build.make CMakeFiles/lserver.dir/Timer.cpp.o.provides.build
.PHONY : CMakeFiles/lserver.dir/Timer.cpp.o.provides

CMakeFiles/lserver.dir/Timer.cpp.o.provides.build: CMakeFiles/lserver.dir/Timer.cpp.o


CMakeFiles/lserver.dir/Util.cpp.o: CMakeFiles/lserver.dir/flags.make
CMakeFiles/lserver.dir/Util.cpp.o: ../Util.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yk/c_cpp/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/lserver.dir/Util.cpp.o"
	/usr/bin/g++-5  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lserver.dir/Util.cpp.o -c /home/yk/c_cpp/server/Util.cpp

CMakeFiles/lserver.dir/Util.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lserver.dir/Util.cpp.i"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yk/c_cpp/server/Util.cpp > CMakeFiles/lserver.dir/Util.cpp.i

CMakeFiles/lserver.dir/Util.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lserver.dir/Util.cpp.s"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yk/c_cpp/server/Util.cpp -o CMakeFiles/lserver.dir/Util.cpp.s

CMakeFiles/lserver.dir/Util.cpp.o.requires:

.PHONY : CMakeFiles/lserver.dir/Util.cpp.o.requires

CMakeFiles/lserver.dir/Util.cpp.o.provides: CMakeFiles/lserver.dir/Util.cpp.o.requires
	$(MAKE) -f CMakeFiles/lserver.dir/build.make CMakeFiles/lserver.dir/Util.cpp.o.provides.build
.PHONY : CMakeFiles/lserver.dir/Util.cpp.o.provides

CMakeFiles/lserver.dir/Util.cpp.o.provides.build: CMakeFiles/lserver.dir/Util.cpp.o


CMakeFiles/lserver.dir/http/HttpContext.cpp.o: CMakeFiles/lserver.dir/flags.make
CMakeFiles/lserver.dir/http/HttpContext.cpp.o: ../http/HttpContext.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yk/c_cpp/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/lserver.dir/http/HttpContext.cpp.o"
	/usr/bin/g++-5  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lserver.dir/http/HttpContext.cpp.o -c /home/yk/c_cpp/server/http/HttpContext.cpp

CMakeFiles/lserver.dir/http/HttpContext.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lserver.dir/http/HttpContext.cpp.i"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yk/c_cpp/server/http/HttpContext.cpp > CMakeFiles/lserver.dir/http/HttpContext.cpp.i

CMakeFiles/lserver.dir/http/HttpContext.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lserver.dir/http/HttpContext.cpp.s"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yk/c_cpp/server/http/HttpContext.cpp -o CMakeFiles/lserver.dir/http/HttpContext.cpp.s

CMakeFiles/lserver.dir/http/HttpContext.cpp.o.requires:

.PHONY : CMakeFiles/lserver.dir/http/HttpContext.cpp.o.requires

CMakeFiles/lserver.dir/http/HttpContext.cpp.o.provides: CMakeFiles/lserver.dir/http/HttpContext.cpp.o.requires
	$(MAKE) -f CMakeFiles/lserver.dir/build.make CMakeFiles/lserver.dir/http/HttpContext.cpp.o.provides.build
.PHONY : CMakeFiles/lserver.dir/http/HttpContext.cpp.o.provides

CMakeFiles/lserver.dir/http/HttpContext.cpp.o.provides.build: CMakeFiles/lserver.dir/http/HttpContext.cpp.o


CMakeFiles/lserver.dir/http/HttpResponse.cpp.o: CMakeFiles/lserver.dir/flags.make
CMakeFiles/lserver.dir/http/HttpResponse.cpp.o: ../http/HttpResponse.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yk/c_cpp/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object CMakeFiles/lserver.dir/http/HttpResponse.cpp.o"
	/usr/bin/g++-5  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lserver.dir/http/HttpResponse.cpp.o -c /home/yk/c_cpp/server/http/HttpResponse.cpp

CMakeFiles/lserver.dir/http/HttpResponse.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lserver.dir/http/HttpResponse.cpp.i"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yk/c_cpp/server/http/HttpResponse.cpp > CMakeFiles/lserver.dir/http/HttpResponse.cpp.i

CMakeFiles/lserver.dir/http/HttpResponse.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lserver.dir/http/HttpResponse.cpp.s"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yk/c_cpp/server/http/HttpResponse.cpp -o CMakeFiles/lserver.dir/http/HttpResponse.cpp.s

CMakeFiles/lserver.dir/http/HttpResponse.cpp.o.requires:

.PHONY : CMakeFiles/lserver.dir/http/HttpResponse.cpp.o.requires

CMakeFiles/lserver.dir/http/HttpResponse.cpp.o.provides: CMakeFiles/lserver.dir/http/HttpResponse.cpp.o.requires
	$(MAKE) -f CMakeFiles/lserver.dir/build.make CMakeFiles/lserver.dir/http/HttpResponse.cpp.o.provides.build
.PHONY : CMakeFiles/lserver.dir/http/HttpResponse.cpp.o.provides

CMakeFiles/lserver.dir/http/HttpResponse.cpp.o.provides.build: CMakeFiles/lserver.dir/http/HttpResponse.cpp.o


CMakeFiles/lserver.dir/http/HttpServer.cpp.o: CMakeFiles/lserver.dir/flags.make
CMakeFiles/lserver.dir/http/HttpServer.cpp.o: ../http/HttpServer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yk/c_cpp/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object CMakeFiles/lserver.dir/http/HttpServer.cpp.o"
	/usr/bin/g++-5  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lserver.dir/http/HttpServer.cpp.o -c /home/yk/c_cpp/server/http/HttpServer.cpp

CMakeFiles/lserver.dir/http/HttpServer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lserver.dir/http/HttpServer.cpp.i"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yk/c_cpp/server/http/HttpServer.cpp > CMakeFiles/lserver.dir/http/HttpServer.cpp.i

CMakeFiles/lserver.dir/http/HttpServer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lserver.dir/http/HttpServer.cpp.s"
	/usr/bin/g++-5 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yk/c_cpp/server/http/HttpServer.cpp -o CMakeFiles/lserver.dir/http/HttpServer.cpp.s

CMakeFiles/lserver.dir/http/HttpServer.cpp.o.requires:

.PHONY : CMakeFiles/lserver.dir/http/HttpServer.cpp.o.requires

CMakeFiles/lserver.dir/http/HttpServer.cpp.o.provides: CMakeFiles/lserver.dir/http/HttpServer.cpp.o.requires
	$(MAKE) -f CMakeFiles/lserver.dir/build.make CMakeFiles/lserver.dir/http/HttpServer.cpp.o.provides.build
.PHONY : CMakeFiles/lserver.dir/http/HttpServer.cpp.o.provides

CMakeFiles/lserver.dir/http/HttpServer.cpp.o.provides.build: CMakeFiles/lserver.dir/http/HttpServer.cpp.o


# Object files for target lserver
lserver_OBJECTS = \
"CMakeFiles/lserver.dir/Buffer.cpp.o" \
"CMakeFiles/lserver.dir/Channel.cpp.o" \
"CMakeFiles/lserver.dir/Epoll.cpp.o" \
"CMakeFiles/lserver.dir/EventLoop.cpp.o" \
"CMakeFiles/lserver.dir/EventLoopThread.cpp.o" \
"CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.o" \
"CMakeFiles/lserver.dir/Server.cpp.o" \
"CMakeFiles/lserver.dir/TcpConnection.cpp.o" \
"CMakeFiles/lserver.dir/Timer.cpp.o" \
"CMakeFiles/lserver.dir/Util.cpp.o" \
"CMakeFiles/lserver.dir/http/HttpContext.cpp.o" \
"CMakeFiles/lserver.dir/http/HttpResponse.cpp.o" \
"CMakeFiles/lserver.dir/http/HttpServer.cpp.o"

# External object files for target lserver
lserver_EXTERNAL_OBJECTS =

liblserver.a: CMakeFiles/lserver.dir/Buffer.cpp.o
liblserver.a: CMakeFiles/lserver.dir/Channel.cpp.o
liblserver.a: CMakeFiles/lserver.dir/Epoll.cpp.o
liblserver.a: CMakeFiles/lserver.dir/EventLoop.cpp.o
liblserver.a: CMakeFiles/lserver.dir/EventLoopThread.cpp.o
liblserver.a: CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.o
liblserver.a: CMakeFiles/lserver.dir/Server.cpp.o
liblserver.a: CMakeFiles/lserver.dir/TcpConnection.cpp.o
liblserver.a: CMakeFiles/lserver.dir/Timer.cpp.o
liblserver.a: CMakeFiles/lserver.dir/Util.cpp.o
liblserver.a: CMakeFiles/lserver.dir/http/HttpContext.cpp.o
liblserver.a: CMakeFiles/lserver.dir/http/HttpResponse.cpp.o
liblserver.a: CMakeFiles/lserver.dir/http/HttpServer.cpp.o
liblserver.a: CMakeFiles/lserver.dir/build.make
liblserver.a: CMakeFiles/lserver.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yk/c_cpp/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Linking CXX static library liblserver.a"
	$(CMAKE_COMMAND) -P CMakeFiles/lserver.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lserver.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lserver.dir/build: liblserver.a

.PHONY : CMakeFiles/lserver.dir/build

CMakeFiles/lserver.dir/requires: CMakeFiles/lserver.dir/Buffer.cpp.o.requires
CMakeFiles/lserver.dir/requires: CMakeFiles/lserver.dir/Channel.cpp.o.requires
CMakeFiles/lserver.dir/requires: CMakeFiles/lserver.dir/Epoll.cpp.o.requires
CMakeFiles/lserver.dir/requires: CMakeFiles/lserver.dir/EventLoop.cpp.o.requires
CMakeFiles/lserver.dir/requires: CMakeFiles/lserver.dir/EventLoopThread.cpp.o.requires
CMakeFiles/lserver.dir/requires: CMakeFiles/lserver.dir/EventLoopThreadPool.cpp.o.requires
CMakeFiles/lserver.dir/requires: CMakeFiles/lserver.dir/Server.cpp.o.requires
CMakeFiles/lserver.dir/requires: CMakeFiles/lserver.dir/TcpConnection.cpp.o.requires
CMakeFiles/lserver.dir/requires: CMakeFiles/lserver.dir/Timer.cpp.o.requires
CMakeFiles/lserver.dir/requires: CMakeFiles/lserver.dir/Util.cpp.o.requires
CMakeFiles/lserver.dir/requires: CMakeFiles/lserver.dir/http/HttpContext.cpp.o.requires
CMakeFiles/lserver.dir/requires: CMakeFiles/lserver.dir/http/HttpResponse.cpp.o.requires
CMakeFiles/lserver.dir/requires: CMakeFiles/lserver.dir/http/HttpServer.cpp.o.requires

.PHONY : CMakeFiles/lserver.dir/requires

CMakeFiles/lserver.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lserver.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lserver.dir/clean

CMakeFiles/lserver.dir/depend:
	cd /home/yk/c_cpp/server/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yk/c_cpp/server /home/yk/c_cpp/server /home/yk/c_cpp/server/build /home/yk/c_cpp/server/build /home/yk/c_cpp/server/build/CMakeFiles/lserver.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lserver.dir/depend

