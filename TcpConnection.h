#ifndef TCPCONNECTION_H
#define TCPCONNECTION_H

#include <unistd.h>
#include <functional>
#include <iostream>
#include <memory>
#include <string>
#include "EventLoop.h"
#include "http/HttpContext.h"
#include "Buffer.h"

class TimerNode;

class TcpConnection:public std::enable_shared_from_this<TcpConnection>{
    enum StateE { kDisconnected, kConnecting, kConnected, kDisconnecting };
    typedef std::shared_ptr<TcpConnection> ConnectionPtr;
    typedef std::function<void(const ConnectionPtr&)> EventCallback;
    typedef std::function<void (const ConnectionPtr&,
                                Buffer*)> MessageCallback;
    EventCallback closeCallback;
    MessageCallback messageCallback;
    int connFd_;
    EventLoop *loop_;
    std::shared_ptr<Channel> channel_;
    std::weak_ptr<TimerNode> timer_;
    StateE state_;
    Buffer inputBuffer_;
    Buffer outputBuffer_; //FIXME: use list<Buffer> as output buffer.
    HttpContext context_;
public:
    TcpConnection(EventLoop *loop, int connFd);
    ~TcpConnection(){
        std::cout<<"~TcpConnection xigou: disconnect "<<std::endl;
        close(connFd_);
    }
    int fd() {return connFd_;}
    EventLoop *getLoop() { return loop_; }
    std::shared_ptr<Channel> getChannel() { return channel_; }
    void linkTimer(std::shared_ptr<TimerNode> timer) { timer_=timer;}
    void setCloseCallback(const EventCallback& cb) { closeCallback=cb; }
    void setMessageCallback(const MessageCallback& cb) { messageCallback=cb; }
    void exeClose();
    void handleRead();
    void handleWrite();
    void newEvent();
    void send(const std::string message);
    void send(Buffer* message);  // this one will swap data
    void sendInLoop(const std::string message);
    void sendInLoop(const void* message, size_t len);
    HttpContext* getMutableContext(){return &context_;}
    void shutdown();
    void setTimer(int timeout);
};
#endif