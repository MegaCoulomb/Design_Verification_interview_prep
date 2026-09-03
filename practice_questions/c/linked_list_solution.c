/* linked_list_solution.c */
#include <stdio.h>
#include <stdlib.h>

typedef struct node { int val; struct node *next; } node;

node* insert_front(node* head, int v) {
    node* n = malloc(sizeof(node));
    n->val = v; n->next = head; return n;
}
node* delete_value(node* head, int v) {
    node dummy; dummy.next = head;
    node *prev = &dummy, *cur = head;
    while (cur) {
        if (cur->val == v) { prev->next = cur->next; free(cur); break; }
        prev = cur; cur = cur->next;
    }
    return dummy.next;
}
void print_list(node* head) {
    while (head) { printf("%d -> ", head->val); head = head->next; } printf("NULL\n");
}

int main() {
    node* h = NULL;
    h = insert_front(h, 3);
    h = insert_front(h, 5);
    h = insert_front(h, 7);
    print_list(h);
    h = delete_value(h, 5);
    print_list(h);
    return 0;
}
