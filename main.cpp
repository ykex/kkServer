#include "Channel.h"
#include "EventLoop.h"
#include "Server.h"
#include "http/HttpServer.h"

int main()
{
    EventLoop mainLoop;
    HttpServer server(&mainLoop, 12345, 4);
    server.start();
    mainLoop.loop();
}
