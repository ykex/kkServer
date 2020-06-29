#!/bin/bash

set -x

g++ main.cpp Buffer.cpp Channel.cpp Epoll.cpp EventLoop.cpp Server.cpp \
Util.cpp TcpConnection.cpp EventLoopThread.cpp EventLoopThreadPool.cpp Timer.cpp \
thread/CountDownLatch.cpp thread/Thread.cpp \
log/AsyncLogging.cpp log/FileUtil.cpp log/LogFile.cpp log/Logging.cpp log/LogStream.cpp \
http/HttpContext.cpp http/HttpResponse.cpp http/HttpServer.cpp \
-o main \
-std=c++11 -lpthread \
&& ./main