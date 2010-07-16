#include <stdio.h>
#include <stdlib.h>

#include "bst.h"

void preorder(node_t *r)
{
  if (r != NULL) {
    printf("%d\n", r->info);
    preorder(r->left);
    preorder(r->right);
  }
}

void inorder(node_t *r)
{
  if (r != NULL) {
    inorder(r->left);
    printf("%d\n", r->info);
    inorder(r->right);
  }
}

void postorder(node_t *r)
{
  if (r != NULL) {
    postorder(r->left);
    postorder(r->right);
    printf("%d\n", r->info);
  }
}

node_t *find(node_t *r, int x)
{
  if (r == NULL) return NULL;
  if (r->info == x) return r;
  if (r->info < x) return find(r->right, x);
  return find(r->left, x); /* r->info > x */
}

node_t *find_iter(node_t *r, int x)
{
  while (r != NULL && r->info != x) {
    if (r->info < x) { r = r->right; }
    else { r = r->left; }
  }
  return r;
}

node_t *findmin(node_t *r)
{
  node_t *prev = NULL, *cur = r;

  while (cur != NULL) {
    prev = cur; cur = cur->left;
  }

  return prev;
}

node_t *findmax(node_t *r)
{
  node_t *prev = NULL, *cur = r;

  while (cur != NULL) {
    prev = cur; cur = cur->right;
  }

  return prev;
}

static node_t *newnode(int x)
{
  node_t *r;

  if ((r = malloc(sizeof(node_t))) == NULL) {
    perror("Error in memory allocation");
    exit(1);
  }

  r->info = x;
  r->left = NULL;
  r->right = NULL;

  return r;
}

node_t *insert(node_t *r, int x)
{
  if (r == NULL) r = newnode(x);
  else if (r->info < x) r->right = insert(r->right, x);
  else if (r->info > x) r->left  = insert(r->left, x);
  else printf("Node with info field %d already inserted!\n", x);

  return r;
}

node_t *insert_iter(node_t *r, int x)
{
  node_t *prev = NULL, *cur = r;

  while (cur != NULL && cur->info != x) {
    if (cur->info < x) { prev = cur; cur = cur->right; }
    else { prev = cur; cur = cur->left; }
  }

  /* now, test to see if and where we should insert the node */
  if (cur != NULL) {
    printf("Node with info field %d already inserted!\n", x);
    return r;
  } else {
    cur = newnode(x);

    if (prev == NULL) {
      return cur;
    } else { /* prev != NULL */
      if (prev->info < x) { prev->right = cur; }
      else { prev->left = cur; }
    }
  }

  return r;
}

static int my_max(int a, int b)
{
  return (a>b)?a:b;
}

int height(node_t *r)
{
  if (r == NULL) return -1;
  else return 1+my_max(height(r->left), height(r->right));
}

void killtree(node_t *r)
{
  if (r != NULL) {
    killtree(r->left);
    killtree(r->right);
    free(r);
  }
}
