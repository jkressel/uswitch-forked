#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <pthread_impl.h>
#include <libc.h>

//void *__dso_handle = (void *)&__dso_handle;

extern void malloc_init(void *base, size_t size, void* mal);
int (*pthread_create_hook)(pthread_t *thread, const pthread_attr_t *attr, void *(*start_routine)(void *), void *arg);
int (*pthread_join_hook)(pthread_t thread, void **retval);
int (*pthread_detach_hook)(pthread_t thread);
void (*pthread_exit_hook)(void *retval);
void *(*mmap_hook)(void *addr, size_t length, int prot, int flags, int fd, off_t offset);
int (*munmap_hook)(void *addr, size_t length);
void *(*mremap_hook)(void *old_addr, size_t old_size, size_t new_size, int flags, void *new_addr);
int (*mprotect_hook)(void *addr, size_t length, int prot);
void* (*sg_malloc_hook)(size_t size);
void* (*sg_realloc_hook)(void* ptr, size_t size);
void (*sg_free_hook)(void* ptr);
void* (*sg_malloc_in_hook)(size_t size);
void* (*sg_relinquish_hook)(void* ptr);
void* (*xxmalloc_vpkey)(size_t size, int vpkey);
void (*xxfree_vpkey)(void* ptr, int vpkey);
int vpkey = 0;
uintptr_t (*uswitch_get_tp)();

int (*uswitch_callback)(int id, long *ret, long arg1, long arg2, long arg3,
    long arg4, long arg5, long arg6);

static void uswitch_init_tp(int tid) {
    struct pthread *tp = (struct pthread *)uswitch_get_tp();
    libc.can_do_threads = 1;
    libc.threaded = 1;
    memset(tp, 0, sizeof(struct pthread));
    tp->self = tp;
    tp->detach_state = DT_JOINABLE;
    tp->tid = tid;
    tp->next = tp->prev = tp;
    size_t modid = *(size_t *)((uint8_t *)tp + 2048 + sizeof(uintptr_t) * 2);
    tp->dtv = (uintptr_t *)((uint8_t *)tp + 2048 + sizeof(uintptr_t)) - modid;
    tp->robust_list.head = &tp->robust_list.head;
}

void uswitch_add_thread(int tid, uintptr_t prev_tp) {
    struct pthread *thread = (struct pthread *)uswitch_get_tp();
    struct pthread *prev_thread = (struct pthread *)prev_tp;
    memset(thread, 0, sizeof(struct pthread));
    thread->prev = prev_thread;
    thread->next = prev_thread->next;
    thread->self = thread;
    thread->detach_state = DT_JOINABLE;
    thread->tid = tid;
    thread->robust_list.head = &thread->robust_list.head;
    size_t modid = *(size_t *)((uint8_t *)thread + 2048 + sizeof(uintptr_t) * 2);
    thread->dtv = (uintptr_t *)((uint8_t *)thread + 2048 + sizeof(uintptr_t)) - modid;
    if (prev_thread->next) {
        prev_thread->next->prev = thread;
    }
    prev_thread->next = thread;
    libc.threaded = 1;
}

struct set_uswitch_functions_ret_t {
    void *(*malloc)(size_t);
    void (*free)(void *);
};

struct set_uswitch_functions_ret_t set_uswitch_functions(
    int tid,
    void *heap_base, size_t heap_size,
    void *pthread_create_hook_, void *pthread_join_hook_, void *pthread_detach_hook_, void *pthread_exit_hook_,
    void *mmap_hook_, void *munmap_hook_, void *mremap_hook_, void *mprotect_hook_,
    void *uswitch_callback_, void *uswitch_get_tp_, void* sg_malloc_hook_, void* sg_free_hook_, void* sg_malloc_in_hook_, void* sg_relinquish_hook_, void* sg_realloc_hook_, void* xxmalloc_vpkey_, void* xxfree_vpkey_, int vpkey_) {
    pthread_create_hook = pthread_create_hook_;
    pthread_join_hook = pthread_join_hook_;
    pthread_detach_hook = pthread_detach_hook_;
    pthread_exit_hook = pthread_exit_hook_;
    mmap_hook = mmap_hook_;
    munmap_hook = munmap_hook_;
    mremap_hook = mremap_hook_;
    mprotect_hook = mprotect_hook_;
    uswitch_callback = uswitch_callback_;
    //fprintf(stderr, "SG_MALLOC_HOOK ptr %p\n", sg_malloc_hook_);
    sg_malloc_hook = sg_malloc_hook_;
    sg_free_hook = sg_free_hook_;
    sg_realloc_hook = sg_realloc_hook_;
    sg_malloc_in_hook = sg_malloc_in_hook_;
    sg_relinquish_hook = sg_relinquish_hook_;
    xxmalloc_vpkey = xxmalloc_vpkey_;
    xxfree_vpkey = xxfree_vpkey_;
    vpkey = vpkey_;
    uswitch_get_tp = uswitch_get_tp_;
    uswitch_init_tp(tid);
    malloc_init(heap_base, heap_size, sg_malloc_hook);
    struct set_uswitch_functions_ret_t ret = {malloc, free};
    return ret;
}

int pthread_create(pthread_t *thread, const pthread_attr_t *attr, void *(*start_routine)(void *), void *arg) {
    return pthread_create_hook(thread, NULL, start_routine, arg);
}

int pthread_join(pthread_t thread, void **retval) {
    return pthread_join_hook(thread, retval);
}

int pthread_detach(pthread_t thread) {
    return pthread_detach_hook(thread);
}

int pthread_cancel(pthread_t thread) {
    return -1;
}

void pthread_exit(void *retval) {

}

void* malloc(size_t size) {
//      fprintf(stderr, "malloc in musl %d\n", size);
        return sg_malloc_hook(size);
//	return xxmalloc_vpkey(size, vpkey);
}

void* memalign(size_t alignment, size_t size) {
//	fprintf(stderr, "memalign in musl %d\n", size);
	return sg_malloc_hook(size);
//	return xxmalloc_vpkey(size, vpkey);
}

int posix_memalign(void** ptr, size_t alignment, size_t size) {
	fprintf(stderr, "musl posix memalign\n");
	return 0;
}

void* calloc( size_t num, size_t size ) {
//	fprintf(stderr, "calloc in musl %d\n", size*num);
	void* ret = sg_malloc_hook(num*size);
//	void* ret = xxmalloc_vpkey(num*size, vpkey);
	memset(ret, 0, size*num);
	return ret;
}

void free(void* ptr) {
//	fprintf(stderr, "free in musl %p\n", ptr);
	return sg_free_hook(ptr);
//	return xxfree_vpkey(ptr, vpkey);
}

void *malloc_in(size_t size) {
	void* ret = sg_malloc_in_hook(size);
	return ret;
}

void* relinquish(void* ptr) {
	return sg_relinquish_hook(ptr);
}

void *realloc( void *ptr, size_t new_size ) {
//	fprintf(stderr, "realloc in musl %d\n", new_size);
	void* ret = sg_realloc_hook(ptr, new_size);
	return ret;
}


__asm__ (
    ".global uswitch_dip_trampoline\n"
    "uswitch_dip_trampoline:\n"
    "sub $8, %rsp\n"
    "callq %rdx\n"
    "add $8, %rsp\n"
    "retq\n"
);
