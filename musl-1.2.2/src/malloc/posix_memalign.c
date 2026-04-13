#include <stdlib.h>
#include <errno.h>
#include <stdio.h>

int posix_memalign(void **res, size_t align, size_t len)
{
	fprintf(stderr, "posix memalign\n");
	if (align < sizeof(void *)) return EINVAL;
	void *mem = aligned_alloc(align, len);
	if (!mem) return errno;
	*res = mem;
	return 0;
}
