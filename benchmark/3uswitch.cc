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
    sandbox->malloc_in_sandbox(7827);
    sandbox->malloc_in_sandbox(78);
    sandbox->malloc_in_sandbox(1729);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(27848);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(2784);
    sandbox->malloc_in_sandbox(128);
    
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
    if (argc != 3) {
        std::cerr << "Usage: ./test3-uswitch <filename> <times>\n";
        return 1;
    }
    const char *filename = argv[1];
    int n = atoi(argv[2]);
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
    USwitchSandbox sandbox("../libraries_uswitch/zlib/libz.so", 1024l << 20, 2l << 20);
    sandbox.init();
    USwitchSandbox sandbox1("../libraries_uswitch/zlib/libz.so", 1024l << 20, 2l << 20);
    sandbox1.init();
    USwitchSandbox sandbox2("../libraries_uswitch/zlib/libz.so", 1024l << 20, 2l << 20);
    sandbox2.init();
    USwitchSandbox sandbox3("../libraries_uswitch/zlib/libz.so", 1024l << 20, 2l << 20);
    sandbox3.init();
    USwitchSandbox sandbox4("../libraries_uswitch/zlib/libz.so", 1024l << 20, 2l << 20);
    sandbox4.init();
    USwitchSandbox sandbox5("../libraries_uswitch/zlib/libz.so", 1024l << 20, 2l << 20);
    sandbox5.init();
    USwitchSandbox sandbox6("../libraries_uswitch/zlib/libz.so", 1024l << 20, 2l << 20);
    sandbox6.init();
    USwitchSandbox sandbox7("../libraries_uswitch/zlib/libz.so", 1024l << 20, 2l << 20);
    sandbox7.init();
    USwitchSandbox sandbox8("../libraries_uswitch/zlib/libz.so", 1024l << 20, 2l << 20);
    sandbox8.init();
    USwitchSandbox sandbox9("../libraries_uswitch/zlib/libz.so", 1024l << 20, 2l << 20);
    sandbox9.init();
    USwitchSandbox sandbox10("../libraries_uswitch/zlib/libz.so", 1024l << 20, 2l << 20);
    sandbox10.init();
   // USwitchSandbox sandbox11("../libraries_uswitch/zlib/libz.so", 1024l << 20, 2l << 20);
   // sandbox11.init();
    static const std::vector<unsigned int> AllowedSyscalls {
#ifdef ONLYMEMPROT
        __NR_brk, __NR_mmap, __NR_munmap,
        __NR_lseek, __NR_fstat, __NR_read, __NR_write,
        __NR_close, __NR_exit_group, __NR_newfstatat,
#endif
        __NR_exit, __NR_futex, __NR_sched_yield, 451};
    sandbox.init_seccomp(AllowedSyscalls);
    sandbox1.init_seccomp(AllowedSyscalls);
    sandbox2.init_seccomp(AllowedSyscalls);
    sandbox3.init_seccomp(AllowedSyscalls);
    sandbox4.init_seccomp(AllowedSyscalls);
    sandbox5.init_seccomp(AllowedSyscalls);
    sandbox6.init_seccomp(AllowedSyscalls);
    sandbox7.init_seccomp(AllowedSyscalls);
    sandbox8.init_seccomp(AllowedSyscalls);
    sandbox9.init_seccomp(AllowedSyscalls);
    sandbox10.init_seccomp(AllowedSyscalls);
    //sandbox11.init_seccomp(AllowedSyscalls);

    std::vector<uint64_t> times(n);
    uint8_t *input_s = (uint8_t *)sandbox.malloc_in_sandbox(size);
    uint8_t *output = (uint8_t *)sandbox.malloc_in_sandbox(size * 2);
    memcpy(input_s, input, size);
    uint8_t *input_s1 = (uint8_t *)sandbox1.malloc_in_sandbox(size);
    uint8_t *output1 = (uint8_t *)sandbox1.malloc_in_sandbox(size * 2);
    memcpy(input_s1, input, size);
    uint8_t *input_s2 = (uint8_t *)sandbox2.malloc_in_sandbox(size);
    uint8_t *output2 = (uint8_t *)sandbox2.malloc_in_sandbox(size * 2);
    memcpy(input_s2, input, size);
    uint8_t *input_s3 = (uint8_t *)sandbox3.malloc_in_sandbox(size);
    uint8_t *output3 = (uint8_t *)sandbox3.malloc_in_sandbox(size * 2);
    memcpy(input_s3, input, size);
    uint8_t *input_s4 = (uint8_t *)sandbox4.malloc_in_sandbox(size);
    uint8_t *output4 = (uint8_t *)sandbox4.malloc_in_sandbox(size * 2);
    memcpy(input_s4, input, size);
    uint8_t *input_s5 = (uint8_t *)sandbox5.malloc_in_sandbox(size);
    uint8_t *output5 = (uint8_t *)sandbox5.malloc_in_sandbox(size * 2);
    memcpy(input_s5, input, size);
    uint8_t *input_s6 = (uint8_t *)sandbox6.malloc_in_sandbox(size);
    uint8_t *output6 = (uint8_t *)sandbox6.malloc_in_sandbox(size * 2);
    memcpy(input_s6, input, size);
    uint8_t *input_s7 = (uint8_t *)sandbox7.malloc_in_sandbox(size);
    uint8_t *output7 = (uint8_t *)sandbox7.malloc_in_sandbox(size * 2);
    memcpy(input_s7, input, size);
    uint8_t *input_s8 = (uint8_t *)sandbox8.malloc_in_sandbox(size);
    uint8_t *output8 = (uint8_t *)sandbox8.malloc_in_sandbox(size * 2);
    memcpy(input_s8, input, size);
    uint8_t *input_s9 = (uint8_t *)sandbox9.malloc_in_sandbox(size);
    uint8_t *output9 = (uint8_t *)sandbox9.malloc_in_sandbox(size * 2);
    memcpy(input_s9, input, size);
    uint8_t *input_s10 = (uint8_t *)sandbox10.malloc_in_sandbox(size);
    uint8_t *output10 = (uint8_t *)sandbox10.malloc_in_sandbox(size * 2);
    memcpy(input_s10, input, size);
  //  uint8_t *input_s11 = (uint8_t *)sandbox11.malloc_in_sandbox(size);
  //  uint8_t *output11 = (uint8_t *)sandbox11.malloc_in_sandbox(size * 2);
  //  memcpy(input_s11, input, size);
    for (int i= 0; i < n; ++i) {
        uint64_t t1 = time_nanosec();
        load_gzip_file(&sandbox, input_s, size, output, size * 2);
	load_gzip_file(&sandbox1, input_s1, size, output1, size * 2);
	load_gzip_file(&sandbox2, input_s2, size, output2, size * 2);
	load_gzip_file(&sandbox3, input_s3, size, output3, size * 2);
	load_gzip_file(&sandbox4, input_s4, size, output4, size * 2);
	load_gzip_file(&sandbox5, input_s5, size, output5, size * 2);
	load_gzip_file(&sandbox6, input_s6, size, output6, size * 2);
	load_gzip_file(&sandbox7, input_s7, size, output7, size * 2);
	load_gzip_file(&sandbox8, input_s8, size, output8, size * 2);
	load_gzip_file(&sandbox9, input_s9, size, output9, size * 2);
	load_gzip_file(&sandbox10, input_s10, size, output10, size * 2);
//	load_gzip_file(&sandbox11, input_s11, size, output11, size * 2);
        uint64_t t2 = time_nanosec();
        times[i] = t2 - t1;
    }
    for (int i = 0; i < n; ++i) {
        std::cout << times[i] << std::endl;
    }
    //printf("%lu\n", (t2 - t1) / n);
    sleep(2000);
    return 0;
}
