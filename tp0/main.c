#include <stdio.h>
#include <stdlib.h>
int main(int argc, const char* argv[]) {

  int* ptr;
  int n=100;

  ptr = (int*)malloc(n*sizeof(int));

  int i = 0;
  for (i=0; i<n; i++) {
	ptr[i] = i;
  }
  
  for (i=0; i<n; i++) {
	printf("%d, ", ptr[i]);
  }

  free(ptr);
  
  return 0;
}
