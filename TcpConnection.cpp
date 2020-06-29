#include "TcpConnection.h"
#include "Timer.h"
#include "Util.h"
#include <sys/socket.h>
#include <functional>

const int DEFAULT_EXPIRED_TIME = 10;//s

TcpConnection::TcpConnection(EventLoop *loop, int connFd) : loop_(loop),
                                                            connFd_(connFd),
                                                            channel_(new Channel(loop, connFd_)),
                                                            state_(kConnected){
    channel_->setReadCallback(std::bind(&TcpConnection::handleRead, this));
    channel_->setWriteCallback(std::bind(&TcpConnection::handleWrite, this));
}

void TcpConnection::handleRead(){
    std::cout << "thread id:" << loop_->threadId() << std::endl;
    int savedErrno = 0;
    ssize_t n = inputBuffer_.readFd(connFd_, &savedErrno);
    if(n>0){
        messageCallback(shared_from_this(),&inputBuffer_);
    }else if(n==0){
        printf("Closed connection\n");
        if (timer_.lock()){
            std::shared_ptr<TimerNode> sp_timer(timer_.lock());
            sp_timer->setDeleted();
            if (loop_->getDeletedCount() > 10)
                loop_->setTimer(0);
        }
    }
}

void TcpConnection::handleWrite(){
    loop_->assertInLoopThread();
    if(channel_->isWriting()){
        ssize_t n = writen(connFd_, outputBuffer_.peek(), outputBuffer_.readableBytes());
        if(n>0){
            outputBuffer_.retrieve(n);
            if (outputBuffer_.readableBytes() == 0){
                 __uint32_t &events_ = channel_->events();
                events_ = EPOLLIN | EPOLLET;
                loop_->updatePoller(channel_, 0);
            }
        }
        else{
            perror("writen");
        }
    }
}

void TcpConnection::newEvent(){
    channel_->setEvents(EPOLLIN | EPOLLET);
    loop_->addToPoller(channel_, DEFAULT_EXPIRED_TIME);
    loop_->setTimer(DEFAULT_EXPIRED_TIME);
}

void TcpConnection::exeClose(){
    if (closeCallback){
        ConnectionPtr guardThis(shared_from_this());
        closeCallback(guardThis);
    }
}

void TcpConnection::send(const std::string message){
    if (state_ == kConnected){
        if (loop_->isInLoopThread()){
            sendInLoop(message);
        }
        else{
            void (TcpConnection::*fp)(const std::string message) = &TcpConnection::sendInLoop;
            loop_->runInLoop(
                std::bind(fp,
                          this, // FIXME
                          message));
        }
    }
}

// FIXME efficiency!!!
void TcpConnection::send(Buffer *buf){
    if (state_ == kConnected){
        if (loop_->isInLoopThread()){
            sendInLoop(buf->peek(), buf->readableBytes());
            buf->retrieveAll();
        }
        else{
            void (TcpConnection::*fp)(const std::string message) = &TcpConnection::sendInLoop;
            loop_->runInLoop(
                std::bind(fp,
                          this, // FIXME
                          buf->retrieveAsString()));
        }
    }
}
void TcpConnection::sendInLoop(const std::string message){
  sendInLoop(message.data(), message.size());
}

void TcpConnection::sendInLoop(const void *data, size_t len)
{
    loop_->assertInLoopThread();
    ssize_t nwrote = 0;
    size_t remaining = len;
    bool faultError = false;
    if (state_ == kDisconnected){
        // LOG << "disconnected, give up writing";
        printf("disconnected, give up writing\n");
        return;
    }
    if(!channel_->isWriting()&& outputBuffer_.readableBytes()==0){
        nwrote = writen(connFd_, data, len);
        if(nwrote>=0){
            remaining = len - nwrote;
        }else{
            nwrote=0;
        }
    }
    assert(remaining <= len);
    if (remaining > 0){
        size_t oldLen = outputBuffer_.readableBytes();
        outputBuffer_.append(static_cast<const char*>(data)+nwrote, remaining);
        if (!channel_->isWriting()){
            __uint32_t &events_ = channel_->events();
            events_ |= EPOLLOUT;
            loop_->updatePoller(channel_, 0);
        }
    }
}

void TcpConnection::shutdown(){
    if (timer_.lock()){
        std::shared_ptr<TimerNode> timer_sp = timer_.lock();
        timer_sp->update(0);
        loop_->setTimer(0);
    }
}

void TcpConnection::setTimer(int timeout){
    if (timer_.lock()){
        std::shared_ptr<TimerNode> timer_sp = timer_.lock();
        timer_sp->update(timeout);
    }
}
