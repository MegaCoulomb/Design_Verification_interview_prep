/* stack_array_solution.c */
#include <stdio.h>
#include <stdlib.h>
#define MAX 10
typedef struct { int a[MAX]; int top; } stack;

void push(stack *s, int v) { if (s->top >= MAX) { printf("overflow\n"); exit(1);} s->a[s->top++] = v; }
int pop(stack *s) { if (s->top <= 0) { printf("underflow\n"); exit(1);} return s->a[--s->top]; }
int peek(stack *s) { if (s->top <= 0) { printf("empty\n"); return -1;} return s->a[s->top-1]; }

int main() {
    stack s = {.top = 0};
    push(&s, 1); push(&s, 2); push(&s, 3);
    printf("%d\n", pop(&s));
    printf("%d\n", peek(&s));
    return 0;
}
