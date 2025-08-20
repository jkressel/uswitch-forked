CC=../../musl/bin/musl-gcc
LD_DEBUG=all
AS=yasm
OBJECTS = testlib.o
all: libhello.so
.PHONY: all clean

%.o: %.c
	$(CC) -static $< -o $@ -fPIC -O3 -g -c -fno-stack-protector
%.o: %.asm
	$(AS) $< -o $@ -f elf64 -I./simd/ -D__x86_64__ -DPIC -DELF
libhello.so: $(OBJECTS)
	$(CC) $(OBJECTS)  -shared -o libhello.so
clean:
	rm -rf libhello.so $(OBJECTS)
