/* reverse_string_solution.c */
#include <stdio.h>
#include <string.h>

void reverse(char *str) {
    int n = strlen(str);
    for (int i = 0; i < n/2; i++) {
        char tmp = str[i];
        str[i] = str[n - i - 1];
        str[n - i - 1] = tmp;
    }
}

int main() {
    char s[] = "HELLO";
    reverse(s);
    printf("%s\n", s);
    return 0;
}
