#include "../testtest.h"
#include <stdlib.h>
#include <pthread.h>
#include <stddef.h>
#include <stdio.h>
#include <malloc.h>

extern void* malloc_in(size_t size);
extern void* relinquish(void* ptr);

int testtest() {
	int *test = malloc(sizeof(int));
	int* in_thing = malloc_in(69);
	if (!in_thing)
		printf("Did not allocate in\n");
	else
		in_thing = relinquish(in_thing);
	
	*test = 68;
	return *test;
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

