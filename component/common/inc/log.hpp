#ifndef __LOG_HPP__
#define __LOG_HPP__

#include <cstdio>
#include <cstdlib>

#define LOG_ERR(fmt, args...) printf("[%s][%s:%d]:" fmt "\r\n",__FILE__,__func__,__LINE__, ##args)



#endif
