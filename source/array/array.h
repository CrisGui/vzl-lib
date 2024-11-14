/// @file array.h
#pragma once
#ifndef VZL_ARRAY_H_
#define VZL_ARRAY_H_

#define ARRAY_ERROR_CODE -1

#include <assert.h>
#include <stdlib.h>
#include <string.h>

/**
 * Array structure
 */
typedef struct {
  size_t length;   ///< Maximum length
  size_t capacity; ///< Capacity
  size_t element_size;
  void *data; ///< Elements of the array
} array_t;

/**
 * Return a set, with constant length, of unique elements of the same type
 */
array_t *array_create(unsigned int length, size_t element_size);

/**
 * Return a copy of a given array
 */
array_t *array_copy(array_t *array);

/**
 * Allocate a new block of memory of the same length
 */
void array_clean(array_t *array);

/**
 * Free a given array
 */
void array_destroy(array_t *array);

/**
 * Returns the element on a given index
 */
void *array_get_element(array_t *array, size_t index);

/**
 * Returns the index of the first element on a given array
 */
size_t array_get_index(array_t *array, void *element);

#endif // VZL_ARRAY_H_
