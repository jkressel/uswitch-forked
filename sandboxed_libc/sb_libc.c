#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stdarg.h>
#include "sblibc.h"

extern void* malloc_in(size_t size);

char *strdup(const char *s)
{
	size_t l = strlen(s);
	char *d = malloc(l+1);
	if (!d) return NULL;
	return memcpy(d, s, l+1);
}


int vasprintf(char **s, const char *fmt, va_list ap)
{
	va_list ap2;
	va_copy(ap2, ap);
	int l = vsnprintf(0, 0, fmt, ap2);
	va_end(ap2);

	if (l<0 || !(*s=malloc_in(l+1U))) return -1;
	fprintf(stderr,"Did malloc\n");
	return vsnprintf(*s, l+1U, fmt, ap);
}

int asprintf(char **s, const char *fmt, ...)
{
	int ret;
	va_list ap;
	va_start(ap, fmt);
	ret = vasprintf(s, fmt, ap);
	va_end(ap);
	return ret;
}

int asprintf_two_string(char** s, const char* fmt, const char* arg1, const char* arg2) {
	fprintf(stderr, "In sandbox two string\n");
	return asprintf(s, fmt, arg1, arg2);
}

int asprintf_one_string(char** s, const char* fmt, const char* arg1) {
        fprintf(stderr, "In sandbox one string\n");
        return asprintf(s, fmt, arg1);
}

int asprintf_two_string_one_char(char** s, const char* fmt, const char* arg1, char arg2, const char* arg3) {
        fprintf(stderr, "In sandbox two string one char\n");
        return asprintf(s, fmt, arg1, arg2, arg3);
}
