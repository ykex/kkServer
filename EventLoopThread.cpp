#include "EventLoopThread.h"
#include <functional>

EventLoopThread::EventLoopThread()
    : loop_(NULL),
      exiting_(false),
      thread_(std::bind(&EventLoopThread::threadFunc, this), "EventLoopThread"),
      mutex_(),
      cond_(mutex_) {}

EventLoopThread::~EventLoopThread()
{
    exiting_ = true;
    if (loop_ != NULL)
    {
        loop_->quit();
        thread_.join();
    }
}

//由主线程在EventLoopThreadPool中调用
EventLoop *EventLoopThread::startLoop()
{
    assert(!thread_.started());
    thread_.start(); //创建子线程
    {
        MutexLockGuard lock(mutex_);
        // 一直等到threadFun在Thread里真正跑起来
        while (loop_ == NULL)
            cond_.wait();
    }
    return loop_;
}

/* 子线程EventLoopThread::threadFunc创建EventLoop并赋值给loop_，然后唤醒阻塞在cond上的主线程。
 *  主线程EventLoopThread::startLoop被唤醒后，返回loop_给EventLoopThreadPool。
 *  主线程EventLoopThreadPool保存返回的loop_，存放在成员变量std::vector<EventLoop*> loops_中。
 *  子线程仍然在threadFunc中，调用EventLoop::loop函数，无限循环监听。*/

//由Thread::runInThread()进行调用
void EventLoopThread::threadFunc()
{
    EventLoop loop;

    {
        MutexLockGuard lock(mutex_);
        loop_ = &loop;
        cond_.notify();
    }

    loop.loop();
    // assert(exiting_);
    loop_ = NULL;
}