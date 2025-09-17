#include <iostream>
#include <fstream>
#include <vector>
#include <dirent.h>
#include <ctime>
#include <cstdlib>
#include <cinttypes>
#include <cstring>
#include <sys/syscall.h>
#include "testtest.h"
#include "uswitchsandbox.h"
#include "uswitch.hpp"
#include <sys/stat.h>
#include <fcntl.h>
#include "sblibc.h"
#include "file/src/magic.h"

std::vector<USwitchSandbox*> sandboxes;

extern "C" void sg_alloc_stats();


USwitchSandbox* get_sandbox() {
	return sandboxes[0];
}

void* sbmalloc(size_t size) {
	return sandboxes[0]->malloc_in_sandbox(size);

}

void sbfree(void* ptr) {
	sandboxes[0]->free_in_sandbox(ptr);

}


int call_asprintf_two_string_one_char(char** ptr, const char* fmt, const char* arg1, char arg2, const char* arg3) {
#define GET_FUNC_PTR(name) decltype(name) *name##_s = (decltype(name) *)sandboxes[1]->get_symbol_addr(#name)
    GET_FUNC_PTR(asprintf_two_string_one_char);
#undef GET_FUNC_PTR
    uswctx_t ctx = sandboxes[0]->get_context();
    int ret;

    uswitch_call_dynamic(ctx, asprintf_two_string_one_char_s, ret, ptr, fmt, arg1, arg2, arg3);
    return ret;

}


static uint64_t time_nanosec() {
	struct timespec t;
	clock_gettime(CLOCK_MONOTONIC, &t);
	return t.tv_sec * 1000000000ull + t.tv_nsec;
}


int main(int argc, char **argv) {
    if (argc < 2) {
        std::cerr << "Usage: ./test1-uswitch <filename> <times> [print] <comps>\n";
        return 1;
    }
    int n = atoi(argv[1]);
    int comps = atoi(argv[2]);
    //std::ifstream ifs(filename, std::ios::binary);
    //if (!ifs) {
    //    std::cerr << "Failed to open file: " << filename << std::endl;
    //    return 1;
    //}
    //ifs.seekg(0, std::ios_base::end);
    //size_t size = ifs.tellg();
    //ifs.seekg(0, std::ios_base::beg);
    //uint8_t *input = new uint8_t[size];
    //if (!ifs.read((char *)input, size)) {
    //    std::cerr << "Failed to read file\n";
    //    return 1;
   // }

    //do_compress(filename);

//printf("Number %d\n", testtest());
    //std::vector<USwitchSandbox*> sandboxes;

    for (int i = 0; i < comps; i++) {
	sandboxes.push_back(new USwitchSandbox("/home/dev/uswitch-standard/sandboxed_libc/libsblibc.so", 1024l << 20, 2l << 20));
    	sandboxes[i]->init();

    }

    static const std::vector<unsigned int> AllowedSyscalls {
        __NR_brk, __NR_mmap, __NR_munmap,
        __NR_lseek, __NR_fstat, __NR_read, __NR_write,
        __NR_close, __NR_exit_group, __NR_newfstatat,
        __NR_exit, __NR_futex, __NR_sched_yield, 451};



    for (int i = 0; i < comps; i++) {
	for (int j = 0; j < n; j++) {
		sandboxes[i]->malloc_in_sandbox(0x1000);
	}

    }
  //
  //
    printf("Done experiment with %d sandboxes, %d * 100 allocated in each sandbox\n", comps, n);
    sleep(2000);
    return 0;
}
