#ifndef UTIL_H
#define UTIL_H
#include <sys/time.h>
#include <cstddef>
#include <string>

int makeFdNonBlocking(int fd);

int socket_bind_listen(int port);

void setSocketNodelay(int fd);

size_t getFormatTime(struct timespec t);

ssize_t readn(int fd, std::string &inBuffer, bool &zero);

ssize_t writen(int fd, std::string &sbuff);

ssize_t writen(int fd, const void *buff, size_t n);

#endif