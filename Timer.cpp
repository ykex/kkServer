#include "Timer.h"
#include <sys/time.h>
#include <unistd.h>
#include <istream>

TimerNode::TimerNode(ConnectionPtr connPtr, int timeout)
	: deleted_(false), connPtr_(connPtr){
	struct timespec now = {0};
	clock_gettime(CLOCK_REALTIME, &now);
	expiredTime_.tv_sec = now.tv_sec + timeout;
	expiredTime_.tv_nsec = now.tv_nsec;
}
//TODO
TimerNode::~TimerNode(){
	if (connPtr_){
		std::cout <<"~TimerNode xigou"<< std::endl;
		connPtr_->exeClose();
	}
}

TimerNode::TimerNode(TimerNode &tn)
	: connPtr_(tn.connPtr_), expiredTime_{0} {}

void TimerNode::update(int timeout)
{
	std::cout << "TimerNode::update" << std::endl;
	struct timespec now = {0};
	clock_gettime(CLOCK_REALTIME, &now);
	expiredTime_.tv_sec = now.tv_sec + timeout;
	expiredTime_.tv_nsec = now.tv_nsec;
}

bool TimerNode::isValid(){
	struct timespec now;
	clock_gettime(CLOCK_REALTIME, &now);
	if (getFormatTime(now) < getFormatTime(expiredTime_))
		return true;
	else{
		this->setDeleted();
		return false;
	}
}

void TimerNode::clear(){
	connPtr_.reset(); //重置shared_ptr
	this->setDeleted();
}

TimerManager::TimerManager(): deletedCount(0) {}

TimerManager::~TimerManager() {}

void TimerManager::addTimer(ConnectionPtr connPtr, int timeout){
	SPTimerNode new_node(new TimerNode(connPtr, timeout));
	timerNodeQueue.push(new_node); //addTimer结束后，new_node的引用计数为1，只存在于timerNodeQueue中。
	connPtr->linkTimer(new_node);  //weak_ptr
}

/* 处理逻辑是这样的~
因为(1) 优先队列不支持随机访问
(2) 即使支持，随机删除某节点后破坏了堆的结构，需要重新更新堆结构。
所以对于被置为deleted的时间节点，会延迟到它(1)超时 或
(2)它前面的节点都被删除时，它才会被删除。
一个点被置为deleted,它最迟会在TIMER_TIME_OUT时间后被删除。
这样做有两个好处：
(1) 第一个好处是不需要遍历优先队列，省时。
(2)
第二个好处是给超时时间一个容忍的时间，就是设定的超时时间是删除的下限(并不是一到超时时间就立即删除)，如果监听的请求在超时后的下一次请求中又一次出现了，
就不用再重新申请RequestData节点了，这样可以继续重复利用前面的RequestData，减少了一次delete和一次new的时间。
*/

void TimerManager::handleExpiredEvent(){
	// MutexLockGuard locker(lock);
	std::cout << "handle expired" << std::endl;
	while (!timerNodeQueue.empty()){
		SPTimerNode ptimer_now = timerNodeQueue.top();
		if (ptimer_now->isDeleted()){
			timerNodeQueue.pop();
		}
		else if (ptimer_now->isValid() == false){
			timerNodeQueue.pop();
		}
		else
			break;
	}
	deletedCount=0;
}

timespec TimerManager::getMinExpired(){
	struct timespec ret = {0};
	if (!timerNodeQueue.empty())
		return timerNodeQueue.top()->getExpire();
	else
		return ret;
}