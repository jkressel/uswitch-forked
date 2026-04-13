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




static uint64_t time_nanosec() {
	struct timespec t;
	clock_gettime(CLOCK_MONOTONIC, &t);
	return t.tv_sec * 1000000000ull + t.tv_nsec;
}



int main(int argc, char **argv) {

    //do_compress(filename);


//    for (int i = 0; i < comps; i++) {
	sandboxes.push_back(new USwitchSandbox("/home/dev/uswitch/benchmark/libhello.so", 1024l << 20, 2l << 20));
    	sandboxes[0]->init();
//	sandboxes[0]->init_del(8UL<<10, 1);
#define GET_FUNC_PTR(name) decltype(name) *name##_s = (decltype(name) *)sandboxes[0]->get_symbol_addr(#name)
        GET_FUNC_PTR(testtest);
#undef GET_FUNC_PTR
        uswctx_t ctx = sandboxes[0]->get_context();
	sandboxes[0]->malloc_in_sandbox(sizeof(int));
	sandboxes[0]->malloc_in_sandbox(sizeof(int));
        int ret;
	uint64_t t1 = time_nanosec();
        uswitch_call_dynamic(ctx, testtest_s, ret);
	uint64_t t2 = time_nanosec();
	uint64_t total = 0;
	for (int i = 0; i < 500; i++) {
		t1 = time_nanosec();
        	sandboxes[0]->malloc_in_sandbox(sizeof(int));
		t2 = time_nanosec();
		total += (t2-t1);
	}
        printf("malloc in sandox from outside sandbox latency %ld\n", total/500);

	total = 0;
	for (int i = 0; i < 500; i++) {
                t1 = time_nanosec();
                malloc(sizeof(int));
                t2 = time_nanosec();
                total += (t2-t1);
        }

	printf("regular malloc latency %ld\n", total/500);
    return 0;
}
