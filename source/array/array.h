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
 * Free a given array
 */
void array_destroy(array_t *array);
#endif // VZL_ARRAY_H_
