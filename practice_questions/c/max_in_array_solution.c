/* max_in_array_solution.c */
#include <stdio.h>

int find_max(int *arr, int n) {
    if (n <= 0) return 0;
    int m = arr[0];
    for (int i = 1; i < n; i++) if (arr[i] > m) m = arr[i];
    return m;
}

int main() {
    int a[] = {3, 1, 4, 1, 5, 9};
    printf("%d\n", find_max(a, 6));
    return 0;
}
