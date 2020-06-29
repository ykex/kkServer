#include "Epoll.h"
#include <assert.h>
#include <iostream>
const int EVENTSNUM = 4096;
const int EPOLLWAIT_TIME = -1;

Epoll::Epoll() : epollFd_(epoll_create1(EPOLL_CLOEXEC)), events_(EVENTSNUM)
{
    assert(epollFd_ > 0);
}

void Epoll::epoll_add(SP_Channel sp_channel)
{
    int fd = sp_channel->fd();
    struct epoll_event event;
    event.data.fd = fd;
    event.events = sp_channel->events();
    std::cout << "epoll_add:" << fd << std::endl;
    ChannelMap_[fd] = sp_channel;
    if (epoll_ctl(epollFd_, EPOLL_CTL_ADD, fd, &event) < 0)
    {
        perror("epoll_add error");
    }
}
void Epoll::epoll_mod(SP_Channel sp_channel)
{
    int fd = sp_channel->fd();
    struct epoll_event event;
    event.data.fd = fd;
    event.events = sp_channel->events();
    if (epoll_ctl(epollFd_, EPOLL_CTL_MOD, fd, &event) < 0)
    {
        perror("epoll_mod error");
    }
}
void Epoll::epoll_del(SP_Channel sp_channel)
{
    int fd = sp_channel->fd();
    std::cout << "epoll_del:" << fd << std::endl;
    auto it = ChannelMap_.find(fd);
    assert(it != ChannelMap_.end());
    int res = ChannelMap_.erase(fd);
    assert(res == 1);
    struct epoll_event event;
    event.data.fd = fd;
    event.events = sp_channel->events();
    if (epoll_ctl(epollFd_, EPOLL_CTL_DEL, fd, &event) < 0){
        perror("epoll_del error");
    }
}

std::vector<SP_Channel> Epoll::epoll()
{
    int event_count = epoll_wait(epollFd_, events_.data(), events_.size(), EPOLLWAIT_TIME);
    if (event_count < 0)
        perror("epoll wait error");
    std::vector<SP_Channel> activeChannels = getActiveChannel(event_count);
    if (activeChannels.size() > 0)
        return activeChannels;
}

std::vector<SP_Channel> Epoll::getActiveChannel(int events_num)
{
    std::vector<SP_Channel> activeChannels;
    for (int i = 0; i < events_num; ++i)
    {
        int fd = events_[i].data.fd;
        auto it = ChannelMap_.find(fd);
        assert(it != ChannelMap_.end());
        SP_Channel cur_channel = it->second;
        if (cur_channel)
        {
            cur_channel->setRevents(events_[i].events);
            cur_channel->setEvents(0);
            activeChannels.push_back(cur_channel);
        }
        else
        {
            std::cout << "cur_channel is invalid" << std::endl;
        }
    }
    return activeChannels;
}