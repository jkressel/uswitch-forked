#include <stddef.h>
#include <stdio.h>
#include <stdint.h>
#include <dlfcn.h>

#define NO_MALLOC_STATS 1
#define USE_LOCKS 1
#define HAVE_MMAP 0
#define HAVE_MREMAP 0
#define MSPACES 1
#define ONLY_MSPACES 1
#define USE_DL_PREFIX 1
#define MORECORE_CANNOT_TRIM 1
#define LACKS_TIME_H
#include "dlmalloc.h"

void *msp;
typedef void* (*malloctype)(size_t, uint8_t);
void* (*sg_malloc)(size_t size);
//extern void* sg_malloc(size_t size, uint8_t pkey);

void *__libc_malloc_impl(size_t size) {
 //   return mspace_malloc(msp, size);
//    return malloc(size);
//	return     mfunc(size, 69);
fprintf(stderr, "malloc_impl\n");
        return mspace_malloc(msp, size);
//    return sg_malloc(size);

}

void *__libc_realloc(void *ptr, size_t size) {
	fprintf(stderr, "malloc_impl\n");
    return mspace_realloc(msp, ptr, size);
}

void __libc_free(void *ptr) {
fprintf(stderr, "libc_free\n");
    mspace_free(msp, ptr);
}

//void *aligned_alloc(size_t align, size_t size) {
//    return posix_memalign(align, size);
//}

void malloc_init(void *base, size_t size, void* mal) {
    //msp = create_mspace_with_base(base, size, 1);
    sg_malloc = mal;
}

void __malloc_donate(char *start, char *end) {
    // do nothing
}
