#include "../testtest.h"
#include <stdlib.h>
#include <pthread.h>
#include <stddef.h>
#include <stdio.h>
#include <malloc.h>

int testtest() {
	fprintf(stderr, "Herro\n");
	int *test = malloc(sizeof(int));
	*test = 68;
	return *test;
}

void testtest1() {
	printf("Make this thing happy\n");

}

