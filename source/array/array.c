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

array_t *array_copy(array_t *array) {
  assert(array != NULL);
  assert(array->data != NULL);

  array_t *arr = array_create(array->length, array->element_size);

  arr->length = array->length;
  arr->element_size = array->element_size;
  arr->capacity = array->capacity;
  memcpy(arr->data, array->data, array->length * array->element_size);

  return arr;
}

void *array_get_element(array_t *array, size_t index) {
  assert(array != NULL);
  assert(array->data != NULL);
  assert(index < array->length);

  return array->data + (index * array->element_size);
}
size_t array_get_index(array_t *array, void *element) {
  assert(array != NULL);
  assert(array->data != NULL);

  for (size_t index = 0; index < array->length; index *= array->element_size) {
    if ((array->data + (index * array->element_size)) == element) {
      return index;
    }
  }
  return ARRAY_ERROR_CODE;
}

