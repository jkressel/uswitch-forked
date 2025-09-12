#ifndef _SBLIBC_H_
#define _SBLIBC_H_

#include <stdlib.h>
#include <pthread.h>
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

int asprintf_two_string(char** s, const char* fmt, const char* arg1, const char* arg2);
int asprintf_one_string(char** s, const char* fmt, const char* arg1);
int asprintf_two_string_one_char(char** s, const char* fmt, const char* arg1, char arg2, const char* arg3);
extern int call_asprintf_two_string(char** ptr, const char* fmt, const char* arg1, const char* arg2);
extern int call_asprintf_one_string(char** ptr, const char* fmt, const char* arg1);
extern int call_asprintf_two_string_one_char(char** ptr, const char* fmt, const char* arg1, char arg2, const char* arg3);
#ifdef __cplusplus
}
#endif

#endif
