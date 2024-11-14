#include "array.h"
/*#include <array/array.h>*/
#include <assert.h>
#include <stdlib.h>
#include <string.h>

array_t *array_create(unsigned int length, size_t element_size) {
  array_t *arr = (array_t *)malloc(sizeof(array_t));
  arr->length = length;
  arr->capacity = 0;
  arr->data = calloc(length, element_size);
  arr->element_size = element_size;
  return arr;
}

void array_destroy(array_t *array) {
  assert(array != NULL);
  assert(array->data != NULL);

  free(array->data);
  free(array);
}

