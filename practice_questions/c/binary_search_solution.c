/* bsearch_solution.c */
#include <stdio.h>
int bsearch_idx(int *a, int n, int key) {
    int lo=0, hi=n-1;
    while (lo<=hi) {
        int mid = lo + (hi-lo)/2;
        if (a[mid]==key) return mid;
        else if (a[mid]<key) lo=mid+1;
        else hi=mid-1;
    }
    return -1;
}
int main(){ int a[]={1,3,5,7,9}; printf("%d\n", bsearch_idx(a,5,7)); return 0; }
