#ifndef EVENTLOOP_H
#define EVENTLOOP_H
#include <functional>
#include <memory>
#include <vector>
#include <assert.h>
#include <sys/timerfd.h>
#include "thread/CurrentThread.h"
#include "thread/Thread.h"
#include "Channel.h"
#include "Timer.h"

class Epoll;
class TimerManager;
typedef std::shared_ptr<Channel> SP_Channel;
class EventLoop
{
public:
    typedef std::function<void()> Functor;
    EventLoop();
    ~EventLoop();
    void loop();
    void quit();
    
    void runInLoop(Functor&& cb);
    void queueInLoop(Functor&& cb);
    bool isInLoopThread() const { return threadId_ == CurrentThread::tid(); }
    void assertInLoopThread() { assert(isInLoopThread()); }
    pid_t threadId() const { return threadId_;}

    void removeFromPoller(SP_Channel channel);
    void removeFromPollerIn(SP_Channel channel);
    void updatePoller(SP_Channel channel,int timeout=0);
    void addToPoller(SP_Channel channel ,int timeout=0);
    void setTimer(int timeout);
    int getDeletedCount();
private:
    std::shared_ptr<Epoll> poller_;
    std::unique_ptr<TimerManager> timerManager_;
    bool looping_;
    bool quit_;
    bool eventHandling_;
    std::vector<SP_Channel> activeChannels_;
    mutable MutexLock mutex_;
    std::vector<Functor> pendingFunctors_;
    bool callingPendingFunctors_;
    const pid_t threadId_;
    int wakeupFd_;
    int timerFd_;
    std::shared_ptr<Channel> wakeupChannel_;
    std::shared_ptr<Channel> timerChannel_;
    void wakeup();
    void handleRead();
    void timerRead();
    void doPendingFunctors();
    void addTimer(SP_Channel sp_channel, int timeout);
};
#endif