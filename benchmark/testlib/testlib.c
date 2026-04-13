#include "../testtest.h"
#include <stdlib.h>
#include <pthread.h>
#include <stddef.h>
#include <stdio.h>
#include <malloc.h>


static unsigned long time_nanosec() {
	struct timespec t;
	clock_gettime(CLOCK_MONOTONIC, &t);
	return t.tv_sec * 1000000000ull + t.tv_nsec;
}

int testtest() {
	unsigned long total = 0;
	int* test;
	 for (int i = 0; i <100; i++) {
                test = malloc(sizeof(int));
//              *test = 0;
        }
	for (int i = 0; i <500; i++) {
		unsigned long t1 = time_nanosec();
		test = malloc(sizeof(int));
//		*test = 0;
		unsigned long t2 = time_nanosec();
		total+= t2-t1;
	}
	printf("Avg alloc latency %ld\n", total/500);
	return 0;
}


void testtest1() {
	printf("Make this thing happy\n");

}

