;;===================================
;; CS 2110 Spring 2018
;; Homework 7 - Functions & Recursion
;; Name: Ashley Eggart
;;===================================

; See the PDF for details on each function

.orig x3000
; Don't try to run this code directly, since only contains subroutines
; that need to be invoked using the LC-3 calling convention. Use Debug >
; Setup Test or Simulate Subroutine Call in complx instead
;
; Do not remove this line or you will break Simulate Subroutine Call
halt

bubble_sort
    ; TODO: Implement bubble_sort() here

	ADD R6, R6, -4      ; Make room for RV, RA, and OFP on STACK
    	STR R7, R6, 2       ; Store RA (return address)
   	STR R5, R6, 1       ; Store OFP (old frame pointer)
   	ADD R5, R6, 0	    ; Set new FP
  	ADD R6, R6, -5      ; Room for 5 registers

	STR R4, R5, -5	    ; Store old R4
	STR R3, R5, -4	    ; Store old R3
    	STR R2, R5, -3      ; Store old R2
    	STR R1, R5, -2      ; Store old R1
    	STR R0, R5, -1      ; Store old R0
	
	;Get local variables
	LDR R0,R5,4 	; R0 = array address
	ADD R6,R6,-1	;Push R0
	STR R0,R6,0
	LDR R1,R5,5 	; R1 = n

	LD R2,ONE	; R2 = -1
	ADD R2,R1,R2	; R2 = n-1 
	BRp IFEND1	; if (n<=1)

	AND R3,R0,0	;R3=0
	ADD R3,R0,1	;R3=1
	STR R3,R5,0	;answer=1
	STR R3,R5,3	;rv=1
	BR RET1		;Branch to teardown

IFEND1	AND R3,R3,0	; R3=0=swapCount
	NOT R2,R2	;~R2
	ADD R2,R2,1	; R2=i-n+1
	ADD R6,R6,-1	; Push i-n+1
FOR	STR R2,R6,0		
	ADD R2,R2,0	;Reset CC
	BRzp FOREND	; for i<n-1

	LDR R2,R0,0	;Load first memory element R2=temp
	ADD R6,R6,-1	;Push temp
	STR R2,R6,0	

	ADD R0,R0,1	;R0=i+1
	LDR R4,R0,0	;R4=array[i+1]
	ADD R6,R6,-1	;Push array[i+1]
	STR R4,R6,0

	;if(array[i] > array[i+1]

	NOT R4,R4	;~R4
	ADD R4,R4,1	;R4=-array[i+1]
	ADD R2,R4,R2	;R2=array[i]-array[i+1]
	BRnz IFEND2
	
	
	LDR R4,R6,1	;R4=array[i]
	STR R4,R0,0	;Store second in first spot

	ADD R0,R0,-1	;R0=mem addreess of first array	
	LDR R4,R6,0	;R4=array[i+1]
	STR R4,R0,0	;store first elem in second spot

	ADD R3,R3,1	;swapcounter++
	BR SKIP

IFEND2	ADD R0,R0,-1	;Fix memory location
SKIP	ADD R6,R6,2	;Pop array[i] and array[i+1]
	LDR R2,R6,0	;R2= i-n+1
	ADD R2,R2,1	;R2 = i-n+2
	ADD R0,R0,1	;R0 =R0+1
	BR FOR

	
FOREND	ADD R6,R6,1	;Get Sp to point at array start
	LDR R0,R6,0	;R0=array address
	ADD R1,R1,-1	;R1=n-1
	STR R1,R6,0	;Push n-1

	ADD R6,R6,-1	;Push array address
	STR R0,R6,0

	;LDR R3,R6,0
	STR R3,R5,0
	STr R3,r5,3

	JSR bubble_sort	;Recursive call
	LDR R3,R6,0	;R3=rv=swapcount
	ADD R3,R3,R4	;Maybe not right
	STR R3,R5,0
	

RET1   	LDR R0, R5, 0	; rv = answer
	STR R0,R5,3
	LDR R0,R5,-1	; Restore old R0
    	LDR R1,R5,-2    ; Restore old R1
    	LDR R2,R5,-3    ; Restore old R2
	LDR R3,R5,-4	; Restore old R3
	LDR R4,R5,-5	; Restore old R4

	ADD R6,R5,0	;Move SP
	LDR R5,R6,1	;Restore FP
	LDR R7,R6,2	;Restore RA
	ADD R6,R6,3	;Move SP    	

	
	RET		;Return to the adress in R7
		
	



; Needed by Simulate Subroutine Call in complx
STACK .fill xF000
ARRAY .blkw 1
ONE   .fill -1
.end

;;=====================================
;; The array to be sorted. USED ONLY FOR DEBUGGING
;; When using Simulate Subroutine Call, set params
;; to "x6000, 10" to execute the function with this
;; array
;;=====================================

.orig x6000
.fill 10
.fill -8
.fill 105
.fill 4
.fill 0
.fill -54
.fill 12
.fill 76
.fill -1
.fill 34
.end
