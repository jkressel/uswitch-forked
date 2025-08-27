#ifndef _TESTTEST_H_
#define _TESTTEST_H_

#include <stdlib.h>
#include <pthread.h>
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif


extern int testtest();
extern void* testallocandrel(size_t size);
extern void* testalloc(size_t size);

#ifdef __cplusplus
}
#endif

#endif
