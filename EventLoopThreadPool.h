#ifndef EVENTLOOPTHREADPOOL_H
#define EVENTLOOPTHREADPOOL_H

#include <memory>
#include <vector>
#include <iostream>
#include "noncopyable.h"
#include "EventLoopThread.h"

class EventLoopThreadPool : noncopyable
{
public:
    EventLoopThreadPool(EventLoop *baseLoop, int numThreads);

    ~EventLoopThreadPool() { std::cout<<"~EventLoopThreadPool()"<<std::endl; }
    void start();

    EventLoop *getNextLoop();

private:
    EventLoop *baseLoop_;
    bool started_;
    int numThreads_;
    int next_;
    std::vector<std::shared_ptr<EventLoopThread>> threads_; //存放线程
    std::vector<EventLoop *> loops_;                        //存放线程对应的loop
};

#endif