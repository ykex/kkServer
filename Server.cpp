#include "Server.h"
#include "Util.h"
#include "log/Logging.h"
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <functional>
#include <iostream>

Server::Server(EventLoop *loop, int port, int threadNum) : loop_(loop), port_(port), started_(false), threadNum_(threadNum),
                                                           acceptChannel_(new Channel(loop_)),
                                                           eventLoopThreadPool_(new EventLoopThreadPool(loop_, threadNum_)),
                                                           listenFd_(socket_bind_listen(port_)){
    acceptChannel_->setFd(listenFd_);
    std::cout << "listenFd:" << listenFd_ << std::endl;
    if (makeFdNonBlocking(listenFd_) < 0){
        perror("set socket non block failed");
        abort();
    }
}

void Server::start(){
    eventLoopThreadPool_->start();
    acceptChannel_->setEvents(EPOLLIN | EPOLLET); //listenFd_也是使用ET模式
    acceptChannel_->setReadCallback(std::bind(&Server::handleNewConn, this));
    loop_->addToPoller(acceptChannel_); //将listenFd_注册到epoll
    started_ = true;
}

void Server::handleNewConn(){
    struct sockaddr_in client_addr = {0};
    socklen_t client_addr_len = sizeof(client_addr);
    int accept_fd = 0;
    while ((accept_fd = accept(listenFd_, (struct sockaddr *)&client_addr,
                               &client_addr_len)) > 0){
        std::cout << "New connection from " << inet_ntoa(client_addr.sin_addr) << ":"
                  << ntohs(client_addr.sin_port) << std::endl;
        // LOG << "New connection from " << inet_ntoa(client_addr.sin_addr) << ":"
        //           << ntohs(client_addr.sin_port);
        if (accept_fd >= MAXFDS){
            close(accept_fd);
            continue;
        }
        // 设为非阻塞模式
        if (makeFdNonBlocking(accept_fd) < 0){
            std::cout << "Set non block failed!" << std::endl;
            // perror("Set non block failed!");
            return;
        }
        setSocketNodelay(accept_fd);

        std::cout << "accept_fd:" << accept_fd << std::endl;

        EventLoop *loop = eventLoopThreadPool_->getNextLoop();
        std::shared_ptr<TcpConnection> conn(new TcpConnection(loop, accept_fd)); //建立一个连接
        conn->getChannel()->setHolder(conn);
        conn->setCloseCallback(std::bind(&Server::removeConnection, this, std::placeholders::_1));
        conn->setMessageCallback(messageCallback);
        connMap[accept_fd] = conn;
        loop->queueInLoop(std::bind(&TcpConnection::newEvent, conn));
    }
    // acceptChannel_->setEvents(EPOLLIN | EPOLLET);
}

void Server::removeConnection(const ConnectionPtr &connPtr){
    loop_->runInLoop(std::bind(&Server::removeConnectionInLoop, this, connPtr));
}

void Server::removeConnectionInLoop(const ConnectionPtr& connPtr){
  loop_->assertInLoopThread();
  int res = connMap.erase(connPtr->fd());
  assert(res == 1);
  EventLoop* ioLoop = connPtr->getLoop();
  ioLoop->removeFromPoller(connPtr->getChannel());
}