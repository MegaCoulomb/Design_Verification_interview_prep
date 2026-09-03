/* memmove_starter.c */
#include <stdio.h>
#include <string.h>
void *my_memmove(void *dst, const void *src, size_t n) { /* TODO */ }
int main(){ char b[20] = "HelloWorld"; my_memmove(b+2,b,5); printf("%s\n", b); return 0; }
