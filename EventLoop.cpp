#include "EventLoop.h"
#include <assert.h>
#include <sys/eventfd.h>
#include <time.h>
#include <iostream>
#include "Epoll.h"


__thread EventLoop *t_loopInThisThread = 0;

int createEventfd()
{
  int evtfd = eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC);
  if (evtfd < 0)
  {
    std::cout << "Failed in eventfd" << std::endl;
    abort();
  }
  return evtfd;
}

int createTimerfd()
{
  int timerfd = ::timerfd_create(CLOCK_REALTIME,
                                 TFD_NONBLOCK | TFD_CLOEXEC);
  if (timerfd < 0)
  {
    std::cout << "Failed in timerfd" << std::endl;
  }
  return timerfd;
}

EventLoop::EventLoop() : looping_(false), poller_(new Epoll()),
                         quit_(false),
                         eventHandling_(false),
                         wakeupFd_(createEventfd()),
                         timerFd_(createTimerfd()),
                         threadId_(CurrentThread::tid()),
                         wakeupChannel_(new Channel(this, wakeupFd_)),
                         timerChannel_(new Channel(this, timerFd_)),
                         timerManager_(new TimerManager())
{
  if (t_loopInThisThread)
  {
    std::cout << "Another EventLoop exists in this" << std::endl;
  }
  else
  {
    t_loopInThisThread = this;
  }
  wakeupChannel_->setEvents(EPOLLIN | EPOLLET);
  wakeupChannel_->setReadCallback(std::bind(&EventLoop::handleRead, this));
  poller_->epoll_add(wakeupChannel_);
  struct itimerspec timer = {0};
  clock_gettime(CLOCK_REALTIME, &timer.it_value);
  timer.it_value.tv_sec += 10;
  timerfd_settime(timerFd_, 1, &timer, NULL);
  timerChannel_->setEvents(EPOLLIN | EPOLLET);
  timerChannel_->setReadCallback(std::bind(&EventLoop::timerRead, this));
  poller_->epoll_add(timerChannel_);
}

EventLoop::~EventLoop()
{
  assert(!looping_);
  t_loopInThisThread = NULL;
}

void EventLoop::removeFromPoller(SP_Channel channel)
{
  runInLoop(std::bind(&EventLoop::removeFromPollerIn, this, channel));
}

void EventLoop::removeFromPollerIn(SP_Channel channel)
{
  poller_->epoll_del(channel);
}

void EventLoop::updatePoller(SP_Channel channel, int timeout)
{
  if (timeout > 0) 
    addTimer(channel, timeout);
  poller_->epoll_mod(channel);
}

void EventLoop::addToPoller(SP_Channel channel, int timeout)
{
  if (timeout > 0) 
    addTimer(channel, timeout);
  poller_->epoll_add(channel);
}

void EventLoop::setTimer(int timeout)
{
  std::cout<<"setTimer"<<std::endl;
  timespec minExpired = timerManager_->getMinExpired();
  struct itimerspec timer = {0};
  clock_gettime(CLOCK_REALTIME, &timer.it_value);
  timer.it_value.tv_sec += timeout;
  if (getFormatTime(timer.it_value) > getFormatTime(minExpired))
    timer.it_value = minExpired;
  timerfd_settime(timerFd_, 1, &timer, NULL);
}

void EventLoop::timerRead(){
  timerManager_->handleExpiredEvent();
  std::cout << "timerfd return" << std::endl;
  struct itimerspec timer = {0};
  timer.it_value = timerManager_->getMinExpired();
  timerfd_settime(timerFd_, 1, &timer, NULL);
}

void EventLoop::runInLoop(Functor &&cb)
{
  if (isInLoopThread())
    cb();
  else
    queueInLoop(std::move(cb));
}

void EventLoop::queueInLoop(Functor &&cb)
{
  {
    MutexLockGuard lock(mutex_);
    pendingFunctors_.emplace_back(std::move(cb));
  }
  //如果不是本线程，肯定要唤醒；如果是在本线程，但是正在执行doPendingFunctors，也要唤醒，不然刚加入的cb无法得到执行。
  if (!isInLoopThread() || callingPendingFunctors_)
    wakeup();
}

void EventLoop::loop()
{
  assert(!looping_);
  assert(isInLoopThread());
  looping_ = true;
  quit_ = false;
  while (!quit_)
  {
    activeChannels_.clear();
    activeChannels_ = poller_->epoll();
    std::cout << "epoll return" << std::endl;
    eventHandling_ = true;
    for (auto channel : activeChannels_)
      (*channel).handleEvents();
    eventHandling_ = false;
    doPendingFunctors();
  }
  looping_ = false;
}

void EventLoop::doPendingFunctors()
{
  std::vector<Functor> functors;
  callingPendingFunctors_ = true;

  {
    MutexLockGuard lock(mutex_);
    functors.swap(pendingFunctors_);
  }

  for (size_t i = 0; i < functors.size(); ++i)
    functors[i]();
  callingPendingFunctors_ = false;
}

void EventLoop::quit()
{
  quit_ = true;
}

void EventLoop::wakeup()
{
  uint64_t one = 1;
  ssize_t n = write(wakeupFd_, (char *)(&one), sizeof one);
  if (n != sizeof one)
  {
    std::cout << "EventLoop::wakeup() writes " << n << " bytes instead of 8" << std::endl;
  }
}

void EventLoop::handleRead()
{
  uint64_t one = 1;
  ssize_t n = read(wakeupFd_, &one, sizeof one);
  if (n != sizeof one)
  {
    std::cout << "EventLoop::handleRead() reads " << n << " bytes instead of 8" << std::endl;
  }
  wakeupChannel_->setEvents(EPOLLIN | EPOLLET);
}

void EventLoop::addTimer(SP_Channel sp_channel, int timeout)
{
    std::shared_ptr<TcpConnection> t = sp_channel->getHolder();
    if (t){
        timerManager_->addTimer(t, timeout);
        std::cout << "timer add successed" << std::endl;
    }
    else
        std::cout << "timer add fail" << std::endl;
}

int EventLoop::getDeletedCount() 
{ 
  return timerManager_->getDeletedCount();
}