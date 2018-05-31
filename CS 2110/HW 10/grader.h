//
// Created by pjztam on 4/4/18.
//

#ifndef HW10_GRADER_H
#define HW10_GRADER_H

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include "wrap.h"
#include "array_list.h"

extern alloc_tester t;

// function prototypes
int setup();
int teardown();
int test_create_first_malloc_fails(alloc_tester* t1);
int test_create_second_malloc_fails(alloc_tester* t1);
int test_create_success(alloc_tester* t1);
int test_shallow_copy_first_malloc_fails(alloc_tester* t1);
int test_shallow_copy_second_malloc_fails(alloc_tester* t1);
int test_shallow_copy_fail_params(alloc_tester* t1);
int test_shallow_copy_success(alloc_tester* t1);

// add tests
//int test_add_neg_empty_1(alloc_tester* t1);
//int test_add_neg_empty_2(alloc_tester* t1);
//int test_add_neg_easy_1(alloc_tester* t1);
//int test_add_neg_easy_2(alloc_tester* t1);
//int test_add_neg_easy_3(alloc_tester* t1);
//int test_add_neg_hard_1(alloc_tester* t1);
//int test_add_neg_hard_2(alloc_tester* t1);
//int test_add_neg_hard_3(alloc_tester* t1);
int test_add_pos_empty_1(alloc_tester* t1);
int test_add_pos_empty_2(alloc_tester* t1);
int test_add_pos_easy_1(alloc_tester* t1);
int test_add_pos_easy_2(alloc_tester* t1);
int test_add_pos_easy_3(alloc_tester* t1);
int test_add_pos_easy_4(alloc_tester* t1);
int test_add_pos_hard_1(alloc_tester* t1);
int test_add_pos_hard_2(alloc_tester* t1);
int test_add_pos_hard_3(alloc_tester* t1);
int test_add_pos_hard_4(alloc_tester* t1);
int test_add_pos_hard_5(alloc_tester* t1);
int test_add_null_params(alloc_tester* t1);
//int test_add_resize_fail(alloc_tester* t1);

// remove tests
//int test_rem_neg_empty_1(alloc_tester* t1);
//int test_rem_neg_easy_1(alloc_tester* t1);

// ta functions
array_list_t* ta_create_array_list();

#endif //HW10_GRADER_H


