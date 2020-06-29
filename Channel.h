#ifndef CHANNEL_H
#define CHANNEL_H

#include <sys/epoll.h>
#include <functional>
#include <memory>

class EventLoop;
class TcpConnection;

class Channel
{
    typedef std::function<void()> EventCallback;

    EventLoop *loop_;
    int fd_;

    std::weak_ptr<TcpConnection> holder_;

    __uint32_t events_;   //用户关心的事件
    __uint32_t revents_;    // 由epoll设置的事件

    EventCallback readCallback_;
    EventCallback writeCallback_;
    EventCallback errorCallback_;

    static const int kReadEvent;
    static const int kWriteEvent;
public:
    Channel(EventLoop *loop);
    Channel(EventLoop *loop, int fd);
    // ~Channel();
    void setHolder(std::shared_ptr<TcpConnection> holder) { holder_ = holder; }
    std::shared_ptr<TcpConnection> getHolder(){ 
        std::shared_ptr<TcpConnection> holder(holder_.lock());
        return holder;
    }
    int fd() { return fd_; }
    void setFd(int fd) { fd_ = fd; }

    void handleEvents();

    void setReadCallback(const EventCallback &cb){readCallback_=cb;}
    void setWriteCallback(const EventCallback &cb){writeCallback_=cb;}
    void setErrorCallback(const EventCallback &cb){errorCallback_=cb;}

    void setRevents(__uint32_t ev) { revents_ = ev; }
    void setEvents(__uint32_t ev) { events_ = ev; }
    
    __uint32_t &events() { return events_; }

    bool isWriting() const { return events_ & kWriteEvent; }
    bool isReading() const { return events_ & kReadEvent; }
};

#endif