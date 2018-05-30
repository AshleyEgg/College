/*
 * CS 2110 Spring 2018
 * Author: Ashley Eggart
 */

/* we need this for uintptr_t */
#include <stdint.h>
/* we need this for memcpy/memset */
#include <string.h>
/* we need this to print out stuff*/
#include <stdio.h>
/* we need this for my_sbrk */
#include "my_sbrk.h"
/* we need this for the metadata_t struct and my_malloc_err enum definitions */
#include "my_malloc.h"

/* Our freelist structure - our freelist is represented as two doubly linked lists
 * the address_list orders the free blocks in ascending address
 * the size_list orders the free blocks by size
 */
int check_canaries(void *ptr);

metadata_t *address_list;
metadata_t *size_list;
void *head = NULL;//maybe needed maybe not

/* Set on every invocation of my_malloc()/my_free()/my_realloc()/
 * my_calloc() to indicate success or the type of failure. See
 * the definition of the my_malloc_err enum in my_malloc.h for details.
 * Similar to errno(3).
 */
enum my_malloc_err my_malloc_errno;

/* MALLOC
 * See my_malloc.h for documentation
 */

void *my_malloc(size_t size) {//look at pdf to see what to do- do i need to call my_sbrk?
//size_t is an unsigned int?
	metadata_t *current = size_list;
	metadata_t *next;
	metadata_t *prev;
	unsigned int needed_size = TOTAL_METADATA_SIZE + size;//not sure if it should be a long maybe should be in bytes?
	if(needed_size > SBRK_SIZE){//if size needed in bytes?
		my_malloc_errno = SINGLE_REQUEST_TOO_LARGE;
		return NULL;
	}else if (size == 0){
		my_malloc_errno = NO_ERROR;
		return NULL;
	}


	if(!address_list || !size_list){
		void *my_ptr = my_sbrk(SBRK_SIZE);//maybe right but size might not be the right thing
		address_list = my_ptr;
		size_list = my_ptr;
		size_list->size = TOTAL_METADATA_SIZE;//maybe right
		address_list->size = SBRK_SIZE - needed_size;
			
	}else{
		while(!current){
			if(current->size == needed_size){
				//remove from address list
				prev = current->prev_addr;
				prev->next_addr = current->next_addr;
				next = current->next_addr;
				next->prev_addr = current->prev_addr;
	
				//remove from size list
				prev = current->prev_size;
				prev->next_size = current->next_size;
				next = current->next_size;
				next->prev_size = current->prev_size;

				//needs to set the canaries
				unsigned long can = ((uintptr_t)(current) ^ CANARY_MAGIC_NUMBER) + 1;
				current->canary = can;//sets beginning canary?
				unsigned long *end_can = (unsigned long*) ((uint8_t*)current + current->size - sizeof(unsigned long));//maybe?
				*end_can = can;
		
				my_malloc_errno = NO_ERROR;
				return (current + 1);// maybe will work
			}else if(current->size > needed_size && (current->size - needed_size) >= MIN_BLOCK_SIZE){
				//split block at back to make slpit block and user block
				//remove entire block split it return the user one and put the free one back in in the right place
	
				//remove from size list
				prev = current->prev_size;
				prev->next_size = current->next_size;
				next = current->next_size;
				next->prev_size = current->prev_size;

				//gets pointer to start of block that user wants maybe- should return back half to user
				metadata_t *userBlock = (metadata_t*)((uint8_t*)current + current->size) - needed_size;//points to meta?
				userBlock->size = needed_size;//maybe right
				current->size = current->size - needed_size;//maybe right?

				//set the canaries
				unsigned long can = ((uintptr_t)(userBlock + 1) ^ CANARY_MAGIC_NUMBER) + 1;
				userBlock->canary = can;//sets beginning canary?
				unsigned long *end_can = (unsigned long*) ((uint8_t*)userBlock + userBlock->size - sizeof(unsigned long));//maybe?
				*end_can = can;


				metadata_t *other = size_list;
				while (!other && current->size < other->size){//while not 

					other = other->next_size;
				}
				//add current back into the right place in the size list
				other->prev_size->next_size = current;
				current->prev_size = other->prev_size;
				other->prev_size = current;
				current->next_size = other;
				
				
				my_malloc_errno = NO_ERROR;
				return (userBlock + 1);
			}else if(current->next_size == NULL){
				void *new = my_sbrk(SBRK_SIZE);
				if(!new){
					my_malloc_errno = OUT_OF_MEMORY;
					return NULL;
				}
				return new;
			}
			current = current->next_size;
		}
	}

	

	my_malloc_errno = NO_ERROR;
    return (NULL);
}

/* REALLOC
 * See my_malloc.h for documentation
 */
void *my_realloc(void *ptr, size_t size) {
	if(!ptr){
		return NULL;
	}
	if(!check_canaries(ptr)){
		return NULL;
	}

	UNUSED_PARAMETER(size);
    return NULL;
}

/* CALLOC
 * See my_malloc.h for documentation
 */
void *my_calloc(size_t nmemb, size_t size) {//maybe works if malloc works?
	void *new = my_malloc(nmemb * size);//gives a pointer to the block
	if(!new){
		return NULL;
	}
	memset(new, 0, nmemb * size);//maybe works

    return new;
}

/* FREE
 * See my_malloc.h for documentation
 */
void my_free(void *ptr) {
	if(!ptr){
		my_malloc_errno = NO_ERROR;
		return;
	}
	metadata_t *start = (metadata_t*)ptr - 1;//pointer to start of metadata
	
	if(!check_canaries(ptr)){
		return;
	}

	//return blocks to free lists
	metadata_t *current_addr = address_list;
	while(current_addr->next_addr < start){
		
		current_addr = current_addr->next_addr;
	}
	metadata_t *current_size = size_list;
	while(current_size->size <= start->size){
		current_size = current_size->next_size;
	}

	my_malloc_errno = NO_ERROR;
	return;

}

int check_canaries(void *ptr){//takes in pointer to block
	metadata_t *temp = (metadata_t*)ptr - 1;
	unsigned long calc_can = ((uintptr_t)temp ^ CANARY_MAGIC_NUMBER) + 1;//calculates what the canary should be
	unsigned long front_can = temp->canary;
	if (calc_can != front_can){
		my_malloc_errno = CANARY_CORRUPTED;
		return 0;
	}
	unsigned long *end_can_pt = (unsigned long*) ((uint8_t*)temp + temp->size - sizeof(unsigned long));
	unsigned long end_can = *end_can_pt;
	if(calc_can != end_can || end_can != front_can){
		my_malloc_errno = CANARY_CORRUPTED;
		return 0;
	}


	return 1;
}

