#ifndef MY_EPOLL_H
#define MY_EPOLL_H

#include <memory>
#include <vector>
#include <sys/epoll.h>
#include <map>
#include "Channel.h"

// class Channel;
typedef std::shared_ptr<Channel> SP_Channel;
class Epoll
{
public:
    Epoll();
    // ~Epoll();
    void epoll_add(SP_Channel sp_channel);
    void epoll_mod(SP_Channel sp_channel);
    void epoll_del(SP_Channel sp_channel);
    std::vector<SP_Channel> epoll();
    
private:
    static const int MAZFDS = 1000;
    int epollFd_;
    std::vector<epoll_event> events_;
    std::map<int, SP_Channel> ChannelMap_;
    std::vector<SP_Channel> getActiveChannel(int events_num);
};
#endif