#include <iostream>
#include <fstream>
#include <vector>
#include <ctime>
#include <cstdlib>
#include <cinttypes>
#include <cstring>
#include <sys/syscall.h>
#include "testtest.h"
#include "uswitchsandbox.h"
#include "uswitch.hpp"
#include "bzip2/bzlib.h"
#include "bzip2/bzlib_private.h"
#include <sys/stat.h>
#include <fcntl.h>

std::vector<USwitchSandbox*> sandboxes;
extern "C" void sg_alloc_stats();

USwitchSandbox* get_sandbox() {
	return sandboxes[1];
}

void* sbmalloc(size_t size) {
//	printf("SBMALLOC %d\n", size);
	return sandboxes[1]->malloc_in_sandbox(size);

}

void sbfree(void* ptr) {
	sandboxes[1]->free_in_sandbox(ptr);

}


int call_decompress(DState* s) {
	USwitchSandbox* sandbox = sandboxes[1];
#define GET_FUNC_PTR(name) decltype(name) *name##_s = (decltype(name) *)sandbox->get_symbol_addr(#name)
    	GET_FUNC_PTR(BZ2_decompress);
#undef GET_FUNC_PTR
	uswctx_t ctx = sandbox->get_context();
    	int ret;
    	uswitch_call_dynamic(ctx, BZ2_decompress_s, ret, s);
	 if(s->state == BZ_X_OUTPUT) {
        if (s->ll16)
                s->ll16 = (UInt16 *)sandbox->relinquish_in_sandbox(s->ll16);
        if (s->ll4)
                s->ll4 = (UChar*)sandbox->relinquish_in_sandbox(s->ll4);
        if (s->tt)
                s->tt = (UInt32*)sandbox->relinquish_in_sandbox(s->tt);
   }
	return ret;
}


static uint64_t time_nanosec() {
	struct timespec t;
	clock_gettime(CLOCK_MONOTONIC, &t);
	return t.tv_sec * 1000000000ull + t.tv_nsec;
}

static void do_compress(const char* filename) {
    FILE* compressed_file = fopen(filename, "r");
    int bzError;
    BZFILE *pBz = BZ2_bzReadOpen(&bzError, compressed_file, 0, 1, 0, 0);

    const int BUF_SIZE = 10000000;
    char* buf = new char[BUF_SIZE];
    BZ2_bzRead(&bzError, pBz, buf, BUF_SIZE);
//    printf("%s\n", buf);
    BZ2_bzReadClose(&bzError, pBz);


}


int main(int argc, char **argv) {
    if (argc < 4) {
        std::cerr << "Usage: ./test1-uswitch <filename> <times> [print] <comps>\n";
        return 1;
    }
    const char *filename = argv[1];
    int n = atoi(argv[2]);
    bool print = !argv[3] || atoi(argv[3]);
    int comps = atoi(argv[4]);

    //do_compress(filename);


//    for (int i = 0; i < comps; i++) {
	sandboxes.push_back(new USwitchSandbox("/home/dev/uswitch/benchmark/libhello.so", 1024l << 20, 2l << 20));
    	sandboxes[0]->init();
	sandboxes[0]->init_del(8UL<<10, 1);
	sandboxes.push_back(new USwitchSandbox("/home/dev/uswitch/bzip2/build/libbz2.so.1.0.9", 1024l << 20, 2l << 20));
        sandboxes[1]->init();
        sandboxes[1]->init_del(8UL<<20, 1);

  //  }
  //
    do_compress(filename);
    sg_alloc_stats();
    static const std::vector<unsigned int> AllowedSyscalls {
        __NR_brk, __NR_mmap, __NR_munmap,
        __NR_lseek, __NR_fstat, __NR_read, __NR_write,
        __NR_close, __NR_exit_group, __NR_newfstatat,
        __NR_exit, __NR_futex, __NR_sched_yield, 451};
   // for (int i = 0; i < comps; i++) {
   //     sandboxes[i]->init_seccomp(AllowedSyscalls);

   // }
    return 0;
}
