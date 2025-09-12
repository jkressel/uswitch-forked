CC=../musl/bin/musl-gcc
LD_DEBUG=all
AS=yasm
OBJECTS = sb_libc.o
all: libsblibc.so
.PHONY: all clean

%.o: %.c
	$(CC) $< -o $@ -fPIC -O0 -g -c -fno-stack-protector
%.o: %.asm
	$(AS) $< -o $@ -f elf64 -I./simd/ -D__x86_64__ -DPIC -DELF
libsblibc.so: $(OBJECTS)
	$(CC) $(OBJECTS)  -shared -o libsblibc.so
clean:
	rm -rf libsblibc.so $(OBJECTS)
