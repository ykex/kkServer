#ifndef HTTP_HTTPSERVER_H
#define HTTP_HTTPSERVER_H

#include "../Server.h"
#include <memory>
#include <functional>

class Buffer;
class HttpRequest;
class HttpResponse;

using namespace std::placeholders;

class HttpServer{
public:
    typedef std::function<void (const HttpRequest&,
                                HttpResponse*)> HttpCallback;
    HttpServer(EventLoop *loop, int port, int threadNum);
    void start();
    void setHttpCallback(HttpCallback cb){httpCallback_=cb;}
private:
    void onMessage(const ConnectionPtr& conn,Buffer* buf);
    void onRequest(const ConnectionPtr&, const HttpRequest&);
    Server server_;
    HttpCallback httpCallback_;   
};

#endif