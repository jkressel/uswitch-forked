#include "../testtest.h"
#include <stdlib.h>
#include <pthread.h>
#include <stddef.h>
#include <stdio.h>
#include <malloc.h>

extern void* malloc_in(size_t size);
extern void* relinquish(void* ptr);

static unsigned long time_nanosec() {
	struct timespec t;
	clock_gettime(CLOCK_MONOTONIC, &t);
	return t.tv_sec * 1000000000ull + t.tv_nsec;
}

int testtest() {
	unsigned long total = 0;
	for (int i = 0; i <5; i++) {
		unsigned long t1 = time_nanosec();
		int *test = malloc(sizeof(int));
		unsigned long t2 = time_nanosec();
		total+= t2-t1;
	}
	printf("Avg alloc latency %ld\n", total/5);
	return 0;
}

void* testalloc(size_t size) {
	return malloc_in(size);
}

void* testallocandrel(size_t size) {

	void* ret = malloc_in(size);
	return relinquish(ret);
}

void testtest1() {
	printf("Make this thing happy\n");

}

