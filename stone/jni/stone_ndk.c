#define __USE_GNU
typedef unsigned char bool;
#define false 0
#define true (!false)
#define MAX(a, b) ((a < b) ? (b) : (a))

#include "regex.c"

#define USE_SSL
#define USE_POP
#define THREAD_UNSAFE
#define NO_RINDEX
#define NO_SYSLOG 

#include "stone.c"

