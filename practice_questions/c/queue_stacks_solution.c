/* queue_stacks_solution.c */
#include <stdio.h>
#include <stdlib.h>
#define MAX 100
typedef struct { int a[MAX]; int top; } stack;
void spush(stack *s, int v){ s->a[s->top++]=v; }
int spop(stack *s){ return s->a[--s->top]; }

typedef struct { stack s1, s2; } queue_ts;
void enqueue(queue_ts *q, int v){ spush(&q->s1, v); }
int dequeue(queue_ts *q){
    if (q->s2.top==0) while (q->s1.top>0) spush(&q->s2, spop(&q->s1));
    return spop(&q->s2);
}

int main() {
    queue_ts q = {{.top=0},{.top=0}};
    enqueue(&q,1); enqueue(&q,2); enqueue(&q,3);
    printf("%d\n", dequeue(&q));
    enqueue(&q,4);
    printf("%d\n", dequeue(&q));
    return 0;
}
