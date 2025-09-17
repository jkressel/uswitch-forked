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

//extern "C" void sg_alloc_stats();


USwitchSandbox* get_sandbox() {
	return sandboxes[1];
}

void* sbmalloc(size_t size) {
	printf("SBMALLOC %d\n", size);
	return sandboxes[1]->malloc_in_sandbox(size);

}

void sbfree(void* ptr) {
	sandboxes[1]->free_in_sandbox(ptr);

}


int call_asprintf_two_string(char** ptr, const char* fmt, const char* arg1, const char* arg2) {
#define GET_FUNC_PTR(name) decltype(name) *name##_s = (decltype(name) *)sandboxes[1]->get_symbol_addr(#name)
    GET_FUNC_PTR(asprintf_two_string);
#undef GET_FUNC_PTR
    uswctx_t ctx = sandboxes[1]->get_context();
    int ret;

    uswitch_call_dynamic(ctx, asprintf_two_string_s, ret, ptr, fmt, arg1, arg2);
    return ret;

}

int call_asprintf_one_string(char** ptr, const char* fmt, const char* arg1) {
#define GET_FUNC_PTR(name) decltype(name) *name##_s = (decltype(name) *)sandboxes[1]->get_symbol_addr(#name)
    GET_FUNC_PTR(asprintf_one_string);
#undef GET_FUNC_PTR
    uswctx_t ctx = sandboxes[1]->get_context();
    int ret;

    uswitch_call_dynamic(ctx, asprintf_one_string_s, ret, ptr, fmt, arg1);
    return ret;

}

int call_asprintf_two_string_one_char(char** ptr, const char* fmt, const char* arg1, char arg2, const char* arg3) {
#define GET_FUNC_PTR(name) decltype(name) *name##_s = (decltype(name) *)sandboxes[1]->get_symbol_addr(#name)
    GET_FUNC_PTR(asprintf_two_string_one_char);
#undef GET_FUNC_PTR
    uswctx_t ctx = sandboxes[1]->get_context();
    int ret;

    uswitch_call_dynamic(ctx, asprintf_two_string_one_char_s, ret, ptr, fmt, arg1, arg2, arg3);
    return ret;

}

static uint64_t time_nanosec() {
	struct timespec t;
	clock_gettime(CLOCK_MONOTONIC, &t);
	return t.tv_sec * 1000000000ull + t.tv_nsec;
}


static void load_jpeg_file(USwitchSandbox *sandbox, uint8_t *input, size_t size) {
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(278);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(278);
    sandbox->malloc_in_sandbox(278);
    sandbox->malloc_in_sandbox(2784);
#define GET_FUNC_PTR(name) decltype(name) *name##_s = (decltype(name) *)sandbox->get_symbol_addr(#name)
    GET_FUNC_PTR(testtest);
    GET_FUNC_PTR(testalloc);
    GET_FUNC_PTR(testallocandrel);
#undef GET_FUNC_PTR
    uswctx_t ctx = sandbox->get_context();
    int ret;
    uswitch_call_dynamic(ctx, testtest_s, ret);
    void* retptr;
    uswitch_call_dynamic(ctx, testalloc_s, retptr, 80);
    uswitch_call_dynamic(ctx, testallocandrel_s, retptr, 80);
    printf("Ret char %c\n", *(char*)retptr);
    printf("Return value %d\n", ret);
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

//    for (int i = 0; i < comps; i++) {
	sandboxes.push_back(new USwitchSandbox("/home/dev/uswitch/benchmark/libhello.so", 1024l << 20, 2l << 20));
    	sandboxes[0]->init();
	sandboxes[0]->init_del(8UL<<10, 1);
printf("Setup bz2 sandbox\n");
	sandboxes.push_back(new USwitchSandbox("/home/dev/uswitch/sandboxed_libc/libsblibc.so", 1024l << 20, 2l << 20));
        sandboxes[1]->init();
        sandboxes[1]->init_del(8UL<<15, 1);

  //  }
  //
  magic_t myt = magic_open(MAGIC_CONTINUE|MAGIC_ERROR/*|MAGIC_DEBUG*/|MAGIC_MIME);
  if (myt == NULL)
	  printf("Could not open magic cookie\n");
  magic_load(myt, "file/magic/magic.mgc");

    DIR *dir;
    struct dirent *entry;

    dir = opendir(filename);
    if (dir == NULL) {
        fprintf(stderr, "Could not open directory %s: %s\n", filename, strerror(errno));
        return 0;
    }

    printf("Listing files in: %s\n", filename);

    while ((entry = readdir(dir)) != NULL) {
        // Skip "." and ".." entries
	printf("file: %s\n", entry->d_name);
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0 || (char)entry->d_name[0] == (char)'.')
            continue;
	char* file_desc = (char*)magic_file(myt, (const char*)entry->d_name);
  	printf("Magic file type %s: %s\n", entry->d_name, file_desc);
    }

    closedir(dir);

 //   sg_alloc_stats();

    static const std::vector<unsigned int> AllowedSyscalls {
        __NR_brk, __NR_mmap, __NR_munmap,
        __NR_lseek, __NR_fstat, __NR_read, __NR_write,
        __NR_close, __NR_exit_group, __NR_newfstatat,
        __NR_exit, __NR_futex, __NR_sched_yield, 451};
   // for (int i = 0; i < comps; i++) {
   //     sandboxes[i]->init_seccomp(AllowedSyscalls);

   // }
   //
    if (print) {
        std::vector<uint64_t> times(n);
        for (int i= 0; i < n; ++i) {
            uint64_t t1 = time_nanosec();
	    	for (int i = 0; i < comps; i++) {
//			load_jpeg_file(sandboxes[i], input, size);
    		}
            uint64_t t2 = time_nanosec();
            times[i] = t2 - t1;
        }
        for (int i = 0; i < n; ++i) {
            std::cout << times[i] << std::endl;
        }
    } else {
        uint64_t t1 = time_nanosec();
        for (int i= 0; i < n; ++i) {
		for (int i = 0; i < comps; i++) {
  //                      load_jpeg_file(sandboxes[i], input, size);
                }
        }
        uint64_t t2 = time_nanosec();
        std::cout << t2 - t1 << std::endl;
    }
    //printf("%lu\n", (t2 - t1) / n);
    sleep(2000);
    return 0;
}
