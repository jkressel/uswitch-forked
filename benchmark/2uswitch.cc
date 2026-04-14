#include <iostream>
#include <fstream>
#include <vector>
#include <ctime>
#include <cstdlib>
#include <cinttypes>
#include <cstring>
#include <sys/syscall.h>
#include "png.h"
#include "uswitchsandbox.h"
#include "uswitch.hpp"

static uint64_t time_nanosec() {
	struct timespec t;
	clock_gettime(CLOCK_MONOTONIC, &t);
	return t.tv_sec * 1000000000ull + t.tv_nsec;
}

extern "C" void sg_alloc_stats();

void info_callback(uswctx_t ctx, void *data, png_structp png, png_infop info) {
    uswitch_call_dynamic(ctx, (decltype(png_read_update_info) *)data, png, info);
}

void row_callback(png_structp png, png_bytep new_row, png_uint_32 row_num, int pass) {

}

void end_callback(png_structp png, png_infop info) {
}

void (*info_callback_uswitch)(png_structp png, png_infop info);

void (*row_callback_uswitch)(png_structp png, png_bytep new_row, png_uint_32 row_num, int pass);

void (*end_callback_uswitch)(png_structp png, png_infop info);

void (*mem_read_callback_uswitch)(png_structp png_ptr, png_bytep outBytes, png_size_t byteCountToRead);
// Structure to keep track of where we are in the buffer
struct MemReaderState {
    uint8_t* buffer;
    size_t size;
    size_t offset;
};

// The custom read callback (must be accessible to uSwitch)
//void mem_read_callback(png_structp png_ptr, png_bytep outBytes, png_size_t byteCountToRead) {
//    // libpng has a utility to get the IO pointer we pass in later
//    MemReaderState* state = (MemReaderState*)png_get_io_ptr(png_ptr);
//    
//    if (state->offset + byteCountToRead <= state->size) {
//        memcpy(outBytes, state->buffer + state->offset, byteCountToRead);
//        state->offset += byteCountToRead;
//    } else {
//        //png_error(png_ptr, "Sandbox read error: EOF");
//    }
//}


static void load_png_file_2(USwitchSandbox *sandbox, uint8_t *input, size_t size) {
//#define GET_FUNC_PTR(name) decltype(name) *name##_s = (decltype(name) *)sandbox->get_symbol_addr(#name)
//    GET_FUNC_PTR(png_create_read_struct);
//    GET_FUNC_PTR(png_create_info_struct);
//    GET_FUNC_PTR(png_set_progressive_read_fn);
//    GET_FUNC_PTR(png_process_data);
//    GET_FUNC_PTR(png_destroy_read_struct);
//    GET_FUNC_PTR(png_read_png);
//#undef GET_FUNC_PTR
//    uint8_t *sandbox_buffer = (uint8_t *)sandbox->malloc_in_sandbox(size);
//    uswctx_t ctx = sandbox->get_context();
//    memcpy(sandbox_buffer, input, size);
//    png_structp *png = (png_structp *)sandbox->malloc_in_sandbox(sizeof(png_structp));
//    size_t len = strlen(PNG_LIBPNG_VER_STRING);
//    char *ver_str = (char *)sandbox->malloc_in_sandbox(len + 1);
//    memcpy(ver_str, PNG_LIBPNG_VER_STRING, len + 1);
//    uswitch_call_dynamic(ctx, png_create_read_struct_s, png, ver_str, nullptr, nullptr, nullptr);
//    png_infop *info = (png_infop *)sandbox->malloc_in_sandbox(sizeof(png_infop));
//    uswitch_call_dynamic(ctx, png_create_info_struct_s, info, *png);
//    uswitch_call_dynamic(ctx, png_set_progressive_read_fn_s, *png, nullptr, info_callback_uswitch, row_callback_uswitch, end_callback_uswitch);
//    uswitch_call_dynamic(ctx, png_process_data_s, *png, *info, sandbox_buffer, size);
//    uswitch_call_dynamic(ctx, png_destroy_read_struct_s, png, info, nullptr);
//    sandbox->free_in_sandbox(png);
//    sandbox->free_in_sandbox(info);
//    sandbox->free_in_sandbox(sandbox_buffer);
//    sandbox->free_in_sandbox(ver_str);
//
//
//
//
#define GET_FUNC_PTR(name) decltype(name) *name##_s = (decltype(name) *)sandbox->get_symbol_addr(#name)
    GET_FUNC_PTR(png_create_read_struct);
    GET_FUNC_PTR(png_create_info_struct);
    // New pointers for the Pull API and data extraction
    GET_FUNC_PTR(png_set_read_fn);
    GET_FUNC_PTR(png_read_png);
    GET_FUNC_PTR(png_get_image_height);
    GET_FUNC_PTR(png_get_rowbytes);
    GET_FUNC_PTR(png_get_rows);
#undef GET_FUNC_PTR

    uswctx_t ctx = sandbox->get_context();

    // 1. Allocate and copy the raw image into the sandbox
    uint8_t *sandbox_buffer = (uint8_t *)sandbox->malloc_in_sandbox(size);
    memcpy(sandbox_buffer, input, size);

    // 2. Setup PNG structs
    png_structp *png = (png_structp *)sandbox->malloc_in_sandbox(sizeof(png_structp));
    size_t len = strlen(PNG_LIBPNG_VER_STRING);
    char *ver_str = (char *)sandbox->malloc_in_sandbox(len + 1);
    memcpy(ver_str, PNG_LIBPNG_VER_STRING, len + 1);
    
    uswitch_call_dynamic(ctx, png_create_read_struct_s, png, ver_str, nullptr, nullptr, nullptr);
    
    png_infop *info = (png_infop *)sandbox->malloc_in_sandbox(sizeof(png_infop));
    uswitch_call_dynamic(ctx, png_create_info_struct_s, info, *png);

    // 3. Initialize the IO State for our custom memory reader inside the sandbox
    MemReaderState *io_state = (MemReaderState *)sandbox->malloc_in_sandbox(sizeof(MemReaderState));
    io_state->buffer = sandbox_buffer;
    io_state->size = size;
    io_state->offset = 0;

    // 4. Bind the read callback (Replaces png_set_progressive_read_fn)
    uswitch_call_dynamic(ctx, png_set_read_fn_s, *png, io_state, mem_read_callback_uswitch);

    // 5. Read the entire image (Replaces png_process_data)
    // PNG_TRANSFORM_IDENTITY is 0 (no transforms). 
    // libpng is now allocating the row arrays inside the sandbox heap.
    uswitch_call_dynamic(ctx, png_read_png_s, *png, *info, 0, nullptr);

    // 6. Extract Metadata
    uint32_t height;
    uswitch_call_dynamic(ctx, png_get_image_height_s, height, *png, *info);
    long unsigned int row_bytes;
    uswitch_call_dynamic(ctx, png_get_rowbytes_s, row_bytes, *png, *info);

    // 7. Get the array of row pointers from the sandbox
    png_bytepp guest_row_pointers;
    uswitch_call_dynamic(ctx, png_get_rows_s, guest_row_pointers, *png, *info);

    // ========================================================================
    // 8. THE CROSS-COMPARTMENT DEEP COPY
    // ========================================================================
    uint8_t *host_image = (uint8_t *)malloc(height * row_bytes);

    for (uint32_t y = 0; y < height; y++) {
        // Because uSwitch/RLBox usually maps sandbox memory into the host's 
        // address space, we can dereference the pointer array directly here.
        png_bytep guest_single_row = guest_row_pointers[y];
        
        // Copy the pixels out of the sandbox to our safe host buffer
        memcpy(host_image + (y * row_bytes), guest_single_row, row_bytes);
    }
}

static void load_png_file(USwitchSandbox *sandbox, uint8_t *input, size_t size) {
#define GET_FUNC_PTR(name) decltype(name) *name##_s = (decltype(name) *)sandbox->get_symbol_addr(#name)
    GET_FUNC_PTR(png_create_read_struct);
    GET_FUNC_PTR(png_create_info_struct);
    GET_FUNC_PTR(png_set_progressive_read_fn);
    GET_FUNC_PTR(png_process_data);
    GET_FUNC_PTR(png_destroy_read_struct);
#undef GET_FUNC_PTR
    uint8_t *sandbox_buffer = (uint8_t *)sandbox->malloc_in_sandbox(size);
    uswctx_t ctx = sandbox->get_context();
    memcpy(sandbox_buffer, input, size);
    png_structp *png = (png_structp *)sandbox->malloc_in_sandbox(sizeof(png_structp));
    size_t len = strlen(PNG_LIBPNG_VER_STRING);
    char *ver_str = (char *)sandbox->malloc_in_sandbox(len + 1);
    memcpy(ver_str, PNG_LIBPNG_VER_STRING, len + 1);
    uswitch_call_dynamic(ctx, png_create_read_struct_s, png, ver_str, nullptr, nullptr, nullptr);
    png_infop *info = (png_infop *)sandbox->malloc_in_sandbox(sizeof(png_infop));
    uswitch_call_dynamic(ctx, png_create_info_struct_s, info, *png);
    uswitch_call_dynamic(ctx, png_set_progressive_read_fn_s, *png, nullptr, info_callback_uswitch, row_callback_uswitch, end_callback_uswitch);
    uswitch_call_dynamic(ctx, png_process_data_s, *png, *info, sandbox_buffer, size);
    uswitch_call_dynamic(ctx, png_destroy_read_struct_s, png, info, nullptr);
    sandbox->free_in_sandbox(png);
    sandbox->free_in_sandbox(info);
    sandbox->free_in_sandbox(sandbox_buffer);
    sandbox->free_in_sandbox(ver_str);
}

int main(int argc, char **argv) {
    if (argc != 5) {
        std::cerr << "Usage: ./test2-uswitch <filename> <times> comps\n";
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
    uint64_t total_time = 0;
    for (int i = 0; i < comps; i++) {
        sandboxes.push_back(new USwitchSandbox("../libraries_uswitch/libpng/libpng.so", 1024l << 20, 2l << 20));
        sandboxes[i]->init();
	uswctx_t ctx = sandboxes[i]->get_context();
        info_callback_uswitch = uswitch_register_callback_get_fp(16, ctx, sandboxes[i]->get_symbol_addr("png_read_update_info"), info_callback);
        row_callback_uswitch = uswitch_register_callback_get_fp(16, ctx, row_callback);
        end_callback_uswitch = uswitch_register_callback_get_fp(16, ctx, end_callback);
	uint64_t t1 = time_nanosec();
	load_png_file(sandboxes[i], input, size);
	uint64_t t2 = time_nanosec();
	total_time+= t2-t1;
    }
    if (print) {
        printf("%lu\n", (total_time));
        return 0;
    }
    sleep(2000);
    return 0;

uint64_t t1 = time_nanosec();
    for (int j = 0; j < comps; j++) {
    	uswctx_t ctx = sandboxes[j]->get_context();
    	info_callback_uswitch = uswitch_register_callback_get_fp(16, ctx, sandboxes[j]->get_symbol_addr("png_read_update_info"), info_callback);
    	row_callback_uswitch = uswitch_register_callback_get_fp(16, ctx, row_callback);
    	end_callback_uswitch = uswitch_register_callback_get_fp(16, ctx, end_callback);
//    	mem_read_callback_uswitch = uswitch_register_callback_get_fp(16, ctx, mem_read_callback);
	std::vector<uint64_t> times(n);
    	for (int i= 0; i < n; ++i) {
        	load_png_file(sandboxes[j], input, size);
		//load_png_file_2(sandboxes[j], input, size);
    	}
    }
    uint64_t t2 = time_nanosec();
    if (print) {
    	printf("%lu\n", (t2 - t1));
	return 0;
    }
    sg_alloc_stats();
    sleep(2000);
    return 0;
}
