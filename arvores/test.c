#include <stdio.h>

#include "bst.h"

int main(void)
{
  node_t *r = NULL;
  int i;
/*   r = insert_iter(r, 4); */
/*   r = insert_iter(r, 2); */
/*   r = insert_iter(r, 6); */
/*   r = insert_iter(r, 1); */
/*   r = insert_iter(r, 3); */
/*   r = insert_iter(r, 5); */
/*   r = insert_iter(r, 7); */

/*   r = insert_iter(r, 7); */

  for (i = 10; i > 0; i--) {
    r = insert_iter(r, i);
  }

  printf("inorder:\n");
  inorder(r);

  printf("preorder:\n");
  preorder(r);

  printf("postorder:\n");
  postorder(r);

  printf("The maximum element is: %d\n", findmax(r)->info);
  printf("The minimum element is: %d\n", findmin(r)->info);
  printf("The height of the tree is: %d\n", height(r));

  for (i = 1; i < 12; i++) {
    if (find_iter(r, i)) {
      printf("The element %d is in the tree\n", i);
    } else {
      printf("The element %d is not in the tree\n", i);
    }
  }


  killtree(r);

  return 0;
}
