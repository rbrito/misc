#ifndef BST_H
#define BST_H

/* the data structure used for binary search trees */
struct node_s {
  int info;
  struct node_s *left, *right;
};

typedef struct node_s node_t;

/* functions for binary search trees */
void preorder(node_t *r);
void inorder(node_t *r);
void postorder(node_t *r);
void killtree(node_t *r);
int height(node_t *r);
node_t *find(node_t *r, int x);
node_t *find_iter(node_t *r, int x);
node_t *findmin(node_t *r);
node_t *findmax(node_t *r);
node_t *insert(node_t *r, int x);
node_t *insert_iter(node_t *r, int x);

#endif /* BST_H */
