cmake_minimum_required(VERSION 3.0.0)
project(server VERSION 0.1.0)

add_definitions(-std=c++11)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
add_subdirectory(log)
add_subdirectory(thread)
set(server_SRCS
  Buffer.cpp
  Channel.cpp
  Epoll.cpp
  EventLoop.cpp
  EventLoopThread.cpp
  EventLoopThreadPool.cpp
  Server.cpp
  TcpConnection.cpp
  Timer.cpp
  Util.cpp
  http/HttpContext.cpp 
  http/HttpResponse.cpp 
  http/HttpServer.cpp
  )
add_library(lserver ${server_SRCS})

add_executable(main main.cpp)

target_link_libraries(main lserver llog lthread pthread)

# set(CPACK_PROJECT_NAME ${PROJECT_NAME})
# set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
# include(CPack)
