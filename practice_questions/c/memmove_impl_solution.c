/* memmove_solution.c */
#include <stdio.h>
#include <string.h>

void *my_memmove(void *dst, const void *src, size_t n) {
    unsigned char *d = dst; const unsigned char *s = src;
    if (d < s) {
        for (size_t i=0;i<n;i++) d[i]=s[i];
    } else if (d > s) {
        for (size_t i=n;i>0;i--) d[i-1]=s[i-1];
    }
    return dst;
}

int main(){ char b[20] = "HelloWorld"; my_memmove(b+2,b,5); printf("%s\n", b); return 0; }
