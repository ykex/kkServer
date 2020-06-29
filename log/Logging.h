#pragma once
#include <pthread.h>
#include <stdio.h>
#include <string.h>
#include <string>
#include "LogStream.h"


class AsyncLogging;

class Logger {
 public:
  //fileName指的需要写日志的文件名字，logFileName_才是日志名字。
  Logger(const char *fileName, int line);

  //使用宏定义，实际上是创建了临时对象。
  //对于临时对象，所在语句结束后就被析构了，所以对于日志信息的输出，由Logger对象的析构函数处理
  ~Logger();
  LogStream &stream() { return impl_.stream_; }

  static void setLogFileName(std::string fileName) { logFileName_ = fileName; }
  static std::string getLogFileName() { return logFileName_; }

 private:
  class Impl {
   public:
    Impl(const char *fileName, int line);
    void formatTime();

    LogStream stream_;
    int line_;
    std::string basename_;
  };
  Impl impl_;
  static std::string logFileName_;
};

#define LOG Logger(__FILE__, __LINE__).stream()