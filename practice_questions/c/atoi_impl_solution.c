/* atoi_solution.c */
#include <stdio.h>
#include <ctype.h>

int my_atoi(const char *s) {
    while (isspace(*s)) s++;
    int sign = 1; if (*s=='+'||*s=='-') { if (*s=='-') sign=-1; s++; }
    int val = 0;
    while (*s && isdigit(*s)) { val = val*10 + (*s - '0'); s++; }
    return sign*val;
}

int main(){ printf("%d\n", my_atoi(" -123 ")); return 0; }
