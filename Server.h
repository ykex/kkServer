#ifndef SERVER_H
#define SERVER_H

#include <unistd.h>
#include <functional>
#include <memory>
#include <iostream>
#include <map>
#include "EventLoopThreadPool.h"
#include "TcpConnection.h"

typedef std::shared_ptr<TcpConnection> ConnectionPtr;

class Server{
private:
    EventLoop *loop_;
    bool started_;
    int threadNum_;
    std::unique_ptr<EventLoopThreadPool> eventLoopThreadPool_;
    std::shared_ptr<Channel> acceptChannel_;
    typedef std::shared_ptr<TcpConnection> ConnectionPtr;
    typedef std::function<void (const ConnectionPtr&, Buffer*)> MessageCallback;
    int port_;
    int listenFd_;
    static const int MAXFDS = 100000;
    std::map<int, ConnectionPtr> connMap;
    MessageCallback messageCallback;
public:
    Server(EventLoop *loop, int port, int threadNum);
    // ~Server();
    EventLoop *getLoop() const { return loop_; }
    void start();
    void handleNewConn();
    void removeConnection(const ConnectionPtr &connPtr);
    void removeConnectionInLoop(const ConnectionPtr& connPtr);
    void setMessageCallback(const MessageCallback& cb) { messageCallback=cb; }
};

#endif