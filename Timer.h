#ifndef TIMER_H
#define TIMER_H

#include <unistd.h>
#include <deque>
#include <memory>
#include <queue>
#include <sys/time.h>
#include "Util.h"
#include "TcpConnection.h"
#include "Timer.h"

typedef std::shared_ptr<TcpConnection> ConnectionPtr;
class TimerNode
{
public:
    TimerNode(ConnectionPtr connPtr, int timeout);
    ~TimerNode();
    TimerNode(TimerNode &tn);
    void update(int timeout);
    bool isValid();
    void clear();
    void setDeleted() { deleted_ = true; }
    bool isDeleted() const { return deleted_; }
    timespec getExpire() const { return expiredTime_; }
private:
    bool deleted_;
    timespec expiredTime_;
    ConnectionPtr connPtr_;
};

struct TimerCmp
{
    bool operator()(std::shared_ptr<TimerNode> &a,
                    std::shared_ptr<TimerNode> &b) const
    {
        return getFormatTime(a->getExpire()) > getFormatTime(b->getExpire());
    }
};

class TimerManager
{
public:
    TimerManager();
    ~TimerManager();
    void addTimer(ConnectionPtr connPtr, int timeout);
    void handleExpiredEvent();
    timespec getMinExpired();
    int getDeletedCount() { return deletedCount;}
private:
    int deletedCount;
    typedef std::shared_ptr<TimerNode> SPTimerNode;
    std::priority_queue<SPTimerNode, std::deque<SPTimerNode>, TimerCmp> timerNodeQueue;
};
#endif