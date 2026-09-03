/* bit_count_solution.c */
#include <stdio.h>
unsigned int popcount(unsigned int x) {
    unsigned int cnt = 0;
    while (x) { x &= x-1; cnt++; }
    return cnt;
}
int main() { printf("%u\n", popcount(0b101101)); return 0; }
