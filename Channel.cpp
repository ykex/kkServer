#include "Channel.h"
#include <iostream>
#include <poll.h>

const int Channel::kReadEvent = POLLIN | POLLPRI;
const int Channel::kWriteEvent = POLLOUT;

Channel::Channel(EventLoop *loop)
    : loop_(loop), events_(0), fd_(0) {}

Channel::Channel(EventLoop *loop, int fd)
    : loop_(loop), fd_(fd), events_(0) {}

void Channel::handleEvents()
{
    if ((revents_ & EPOLLHUP) && !(revents_ & EPOLLIN))
    {
        return;
    }
    if (revents_ & EPOLLERR)
    {
        if (errorCallback_)
            errorCallback_();
    }
    if (revents_ & (EPOLLIN | EPOLLPRI | EPOLLRDHUP))
    {
        if (readCallback_)
            readCallback_();
    }
    if (revents_ & EPOLLOUT)
    {
        if (writeCallback_)
            writeCallback_();
    }
}