#include <iostream>
#include <fstream>
#include <vector>
#include <ctime>
#include <cstdlib>
#include <cinttypes>
#include <cstring>
#include <sys/syscall.h>
#include "zlib.h"
#include "uswitchsandbox.h"
#include "uswitch.hpp"

static uint64_t time_nanosec() {
	struct timespec t;
	clock_gettime(CLOCK_MONOTONIC, &t);
	return t.tv_sec * 1000000000ull + t.tv_nsec;
}

static void load_gzip_file(USwitchSandbox *sandbox, uint8_t *input, size_t in_size, uint8_t *output, size_t out_size) {
#define GET_FUNC_PTR(name) decltype(name) *name##_s = (decltype(name) *)sandbox->get_symbol_addr(#name)
    GET_FUNC_PTR(inflateInit2_);
    GET_FUNC_PTR(inflate);
    GET_FUNC_PTR(inflateEnd);
#undef GET_FUNC_PTR
    z_stream *stream = (z_stream *)sandbox->malloc_in_sandbox(sizeof(z_stream));
    size_t len = strlen(ZLIB_VERSION);
    char *ver_str = (char *)sandbox->malloc_in_sandbox(len + 1);
    sandbox->malloc_in_sandbox(270);
    sandbox->malloc_in_sandbox(385);
    sandbox->malloc_in_sandbox(9384);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(270);
    sandbox->malloc_in_sandbox(838);
    sandbox->malloc_in_sandbox(24);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(270);
    sandbox->malloc_in_sandbox(270);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(278);
    sandbox->malloc_in_sandbox(2700);
    sandbox->malloc_in_sandbox(27);
    sandbox->malloc_in_sandbox(278);
    sandbox->malloc_in_sandbox(278);
    sandbox->malloc_in_sandbox(2784); 
    memcpy(ver_str, ZLIB_VERSION, len + 1);
    memset(stream, 0, sizeof(z_stream));
    uswctx_t ctx = sandbox->get_context();
    int res;
    uswitch_call_dynamic(ctx, inflateInit2__s, res, stream, 16 + MAX_WBITS, ver_str, sizeof(z_stream));
    if (res != Z_OK) {
        return;
    }
    stream->avail_in = in_size;
    stream->next_in = input;
    stream->avail_out = out_size;
    stream->next_out = output;
    uswitch_call_dynamic(ctx, inflate_s, res, stream, Z_NO_FLUSH);
    if (res == Z_STREAM_ERROR) {
        return;
    }
    uswitch_call_dynamic(ctx, inflateEnd_s, nullptr, stream);
    sandbox->free_in_sandbox(stream);
    sandbox->free_in_sandbox(ver_str);
}

int main(int argc, char **argv) {
    if (argc != 5) {
        std::cerr << "Usage: ./test3-uswitch <filename> <times>\n";
        return 1;
    }
    const char *filename = argv[1];
    int n = atoi(argv[2]);
    int comps = atoi(argv[3]);
    int print = atoi(argv[4]);
    std::ifstream ifs(filename, std::ios::binary);
    if (!ifs) {
        std::cerr << "Failed to open file: " << filename << std::endl;
        return 1;
    }
    ifs.seekg(0, std::ios_base::end);
    size_t size = ifs.tellg();
    ifs.seekg(0, std::ios_base::beg);
    uint8_t *input = new uint8_t[size];
    if (!ifs.read((char *)input, size)) {
        std::cerr << "Failed to read file\n";
        return 1;
    }

    std::vector<USwitchSandbox*> sandboxes;

    for (int i = 0; i < comps; i++) {
        sandboxes.push_back(new USwitchSandbox("../libraries_uswitch/zlib/libz.so", 1024l << 20, 2l << 20));
        sandboxes[i]->init();

    }
   // USwitchSandbox sandbox11("../libraries_uswitch/zlib/libz.so", 1024l << 20, 2l << 20);
   // sandbox11.init();
    static const std::vector<unsigned int> AllowedSyscalls {
#ifdef ONLYMEMPROT
        __NR_brk, __NR_mmap, __NR_munmap,
        __NR_lseek, __NR_fstat, __NR_read, __NR_write,
        __NR_close, __NR_exit_group, __NR_newfstatat,
#endif
        __NR_exit, __NR_futex, __NR_sched_yield, 451};

    std::vector<uint64_t> times(n);
    std::vector<uint8_t*> input_ss;
    std::vector<uint8_t*> outputs;
    uint64_t t1 = time_nanosec();
    for (int i = 0; i < comps; i++) {
        //simulate some more allocations happening in application
        input_ss.push_back((uint8_t *)sandboxes[i]->malloc_in_sandbox(size));
        outputs.push_back((uint8_t *)sandboxes[i]->malloc_in_sandbox(size * 2));
        memcpy(input_ss[i], input, size);
    }
    for (int i= 0; i < n; ++i) {
	for (int i = 0; i < comps; i++) {
		sandboxes[i]->malloc_in_sandbox(839);
      sandboxes[i]->malloc_in_sandbox(839);
      sandboxes[i]->malloc_in_sandbox(33984);

		load_gzip_file(sandboxes[i], input_ss[i], size, outputs[i], size * 2);
	}
    }
    uint64_t t2 = time_nanosec();
    //printf("done\n");
    if (print) {
	printf("%ld\n", t2-t1);
	return 0;
    }
    sleep(2000);
    return 0;
}
