#define _BSD_SOURCE
#include <stdlib.h>
#include <stdio.h>
void *memalign(size_t align, size_t len)
{
	fprintf(stderr, "memalign\n");
	return aligned_alloc(align, len);
}
