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

; mult(a,b): multiply two numbers a and b
;
; pseudocode:
; mult(a, b) {
;     // do work only when a >= b
;     if a < b {
;         mult(b, a)
;     }
;     if b == 0 {
;         return 0
;     }
;     if b == 1 {
;         return a
;     }
;
;     remainder = 0
;     if b & 1 != 0 {
;         remainder = a
;     }
;
;     a = a << 1
;     b = right_shift(b, 1, 1)
;     return mult(a, b) + remainder
; }
mult
    ; callee setup
    add  r6, r6, -1 ; allocate space for return value
    add  r6, r6, -1 ; allocate space for return address
    str  r7, r6, 0  ; back up return address
    add  r6, r6, -1 ; allocate space for old frame pointer
    str  r5, r6, 0  ; back up old frame pointer
    add  r5, r6, -1 ; set frame pointer
    ; back up r0, r1, r2
    add  r6, r6, -2 ; allocate space for 2 local variables, a and remainder
    add  r6, r6, -4 ; allocate space for 4 saved registers
    str  r0, r6, 0  ; back up r0
    str  r1, r6, 1  ; back up r1
    str  r2, r6, 2  ; back up r2
    str  r3, r6, 3  ; back up r3

    ; if a < b {
    ; notice that a < b <-> a - b < 0
    ldr  r0, r5, 4  ; r0 <- a
    ldr  r1, r5, 5  ; r1 <- b
    not  r2, r1     ; r2 <- ~b
    add  r2, r2, 1  ; r2 <- -b
    add  r2, r0, r2 ; r2 <- a - b
    brzp mult_no_swap_args
    ; mult(b, a)
    ; caller setup
    add  r6, r6, -2 ; allocate space for args on stack
    str  r0, r6, 1  ; arg b <- a
    str  r1, r6, 0  ; arg a <- b
    jsr  mult
    ; caller teardown
    ldr  r0, r6, 0  ; r0 <- mult(b,a)
    add  r6, r6, 3  ; pop return value and 2 args off stack
    br   mult_teardown
    ; }
    mult_no_swap_args

    ; if b == 0 {
    add  r1, r1, 0  ; update CC for b
    brnp mult_b_nonzero
    ; return 0
    and  r0, r0, 0  ; r0 <- 0
    br   mult_teardown
    ; }
    mult_b_nonzero

    ; if b == 1 {
    add  r2, r1, -1 ; r2 <- b-1
    ; return a
    ; (r0 already contains a)
    brz  mult_teardown
    ; }

    ; if b & 1 != 0 {
    and  r2, r1, 1  ; r2 <- b & 1
    ; in this case, remainder (r2) == 0
    brz  mult_no_rem
    ; remainder = a
    add  r2, r0, 0  ; r2 <- a
    ; }
    mult_no_rem
    str  r2, r5, -1 ; save remainder to the local variable remainder on the stack

    ; a = a << 1
    add  r0, r0, r0 ; a <- a << 1
    str  r0, r5, 0  ; save a to the local variable a on the stack

    ; b = right_shift(b, 1, 1)
    and  r3, r3, 0  ; r3 <- 0
    add  r3, r3, 1  ; r3 <- 1
    ; caller setup
    add  r6, r6, -3 ; allocate space for args on stack
    str  r1, r6, 0  ; arg n <- b
    str  r3, r6, 1  ; arg k <- 1
    str  r3, r6, 2  ; arg sext <- 1
    jsr  right_shift
    ; caller teardown
    ldr  r1, r6, 0  ; r1 <- right_shift(b, 1, 1)
    add  r6, r6, 4  ; pop return value and 4 args off stack
    ldr  r0, r5, 0  ; reload a from the local variable slot on stack
    ldr  r2, r5, -1 ; reload remainder from the local variable slot on stack

    ; return mult(a, b) + remainder
    ; caller setup
    add  r6, r6, -2 ; allocate space for args on stack
    str  r0, r6, 0  ; arg a <- a
    str  r1, r6, 1  ; arg b <- b
    jsr  mult
    ; caller teardown
    ldr  r0, r6, 0  ; r0 <- mult(a,b)
    add  r6, r6, 3  ; pop return value and 2 args off stack
    add  r0, r0, r2 ; r0 <- mult(a,b) + remainder

    ; callee teardown
    mult_teardown
    str  r0, r5, 3  ; return value <- r0
    ; restore saved registers
    ldr  r0, r6, 0  ; restore r0
    ldr  r1, r6, 1  ; restore r1
    ldr  r2, r6, 2  ; restore r2
    ldr  r3, r6, 3  ; restore r3
    ; restore r5, r7
    add  r6, r6, 4  ; pop r0,r1,r2,r3 off stack
    add  r6, r6, 2  ; pop local variables a and remainder off stack
    ldr  r5, r6, 0  ; restore r5 (old frame pointer)
    add  r6, r6, 1  ; pop old frame pointer
    ldr  r7, r6, 0  ; restore r7, return address
    add  r6, r6, 1  ; pop return address
    ; top of stack is now return value
    ret


rotate_bits
    ; TODO: Implement rotate_bits() here off by one when recursivly called
	;stack pointer points to first variable(R6)
	ADD R6, R6, -4      ; Make room for RV, RA, and OFP on STACK
    	STR R7, R6, 2       ; Store RA (return address)
   	STR R5, R6, 1       ; Store OFP (old frame pointer)
   	ADD R5, R6, 0	    ; Set new FP
  	ADD R6, R6, -3      ; Room for 2 registers


    	STR R2, R5, -3      ; Store old R2
    	STR R1, R5, -2      ; Store old R1
    	STR R0, R5, -1      ; Store old R0

	;Get local variables
	LDR R0,R5,4 	; R0 = n
	LDR R1,R5,5 	; R1 = k
	BRp ELSE	;if k>0 go to else
	
	;if k <= 0
	STR R0,R5,0	;Store n back on the stack?
	BR RETURN 	;Branch to return
ELSE 	;else {
	LD R2,NUM 	;R2 = x8000
	AND R2,R0,R2	;R2 = n & x8000 =msb
	ADD R0,R0,R0	;n = n + n
	ADD R2,R2,0	;Set condition codes
	BRz ENDIF2	;if msb != 0
	ADD R0,R0,1	;n = n + 1

ENDIF2
	ADD R6,R6,-1	;Move SP
	ADD R1,R1,-1	;R1=k-1
	STR R1,R6,0	;Store k-1 on the stack
	ADD R6,R6,-1	;move R6 to the top of the stack

	STR R0,R6,0	;Store n on the stack
	;ADD R6,R6,-1	;move R6 to top of stack

	JSR rotate_bits	;Call rotate_bits(n,k-1)?

	LDR R0,R6,0   	; R0 = return value
	ADD R6,R6,3	;Pop rv and arg1 and arg2?
    	STR R0,R5,0   	; answer=return value?
	;ADD R6,R6,3	;Pop rv and arg1 and arg2?

	
RETURN
   	; Restore registers
    	LDR R0, R5, 0	    ; rv = answer
	STR R0,R5,3
	LDR R0,R5,-1	    ; Restore old R0
    	LDR R1,R5,-2      ; Restore old R1
    	LDR R2,R5,-3      ; Restore old R2

	ADD R6,R5,0	;Move SP
	LDR R5,R6,1	;Restore FP
	LDR R7,R6,2	;Restore RA
	ADD R6,R6,3	;Move SP    	

	
	RET		;Return to the adress in R7
	
HALT

right_shift_once
    ; TODO: Implement right_shift_once() here
	ADD R6, R6, -4      ; Make room for RV, RA, and OFP on STACK
    	STR R7, R6, 2       ; Store RA (return address)
   	STR R5, R6, 1       ; Store OFP (old frame pointer)
   	ADD R5, R6, 0	    ; Set new FP
  	ADD R6, R6, -4      ; Room for 4 registers

	STR R3, R5, -4	    ; Store old R3
    	STR R2, R5, -3      ; Store old R2
    	STR R1, R5, -2      ; Store old R1
    	STR R0, R5, -1      ; Store old R0
	
	;Get local variables
	LDR R0,R5,4 	; R0 = n
	LDR R1,R5,5 	; R1 = sext
	
	LD R2,NUM 	;R2 = x8000
	AND R2,R0,R2	;R2 = n & x8000 =msb
	
	;Push 15 then push n
	LD R3,FIF	;R3=15 aka 16-1
	STR R3,R6,0	;Push 15
	ADD R6,R6,-1	;Move SP
	
	STR R0,R6,0	;Push n
	JSR rotate_bits	;rotate_bits(n,15)
	LDR R0,R6,0	;n = rv
	ADD R6,R6,3	;Pop rv and 15 and n

	LD R3,NUM2	;R3=7FFF
	AND R0,R0,R3	;n = n & 7FFF

	ADD R1,R1,0	;Set CC
	BRz IFEND	;if sext!=0
	ADD R0,R0,R2	;n = n + msb
	
	
IFEND	

    	STR R0,R5,0   	; answer=return value?

   	; Restore registers
    	LDR R0, R5, 0	    ; rv = answer
	STR R0,R5,3
	LDR R0,R5,-1	    ; Restore old R0
    	LDR R1,R5,-2      ; Restore old R1
    	LDR R2,R5,-3      ; Restore old R2

	ADD R6,R5,0	;Move SP
	LDR R5,R6,1	;Restore FP
	LDR R7,R6,2	;Restore RA
	ADD R6,R6,3	;Move SP    	

	
	RET		;Return to the adress in R7
	
	


right_shift
    ; TODO: Implement right_shift() here
	ADD R6, R6, -4      ; Make room for RV, RA, and OFP on STACK
    	STR R7, R6, 2       ; Store RA (return address)
   	STR R5, R6, 1       ; Store OFP (old frame pointer)
   	ADD R5, R6, 0	    ; Set new FP
  	ADD R6, R6, -4      ; Room for 4 registers

	STR R3, R5, -4	    ; Store old R3
    	STR R2, R5, -3      ; Store old R2
    	STR R1, R5, -2      ; Store old R1
    	STR R0, R5, -1      ; Store old R0
	
	;Get local variables
	LDR R0,R5,4 	; R0 = n
	LDR R1,R5,5 	; R1 = k
	LDR R2,R5,6	; R2 = sext
	AND R3,R3,0	; R3 = 0

	ADD R1,R1,0	;Set CC
	BRp IFEND1	;if k<=0
	STR R0,R5,0
	STR R0,R5,3	;return n? might not be correct
	BR RET1

IFEND1	ADD R6,R6,-1	;Push sext
	STR R2,R6,0	
	ADD R6,R6,-1	;Push n
	STR R0,R6,0	
	JSR right_shift_once	;right_shift_once(n,sext)
	LDR R3,R6,0	;R3 = rv
	ADD R6,R6,3	;Pop n,sext and rv

	ADD R6,R6,-1	;Push sext
	STR R2,R6,0

	ADD R6,R6,-1	;Push k-1
	ADD R1,R1,-1	;R1 = k-1	
	STR R1,R6,0	

	ADD R6,R6,-1	;Push R3
	STR R3,R6,0

	JSR right_shift

  	LDR R3,R6,0   	; answer=return value?
	STR R3,R5,0

RET1   	; Restore registers
    	LDR R0, R5, 0	; rv = answer
	STR R0,R5,3
	LDR R0,R5,-1	; Restore old R0
    	LDR R1,R5,-2    ; Restore old R1
    	LDR R2,R5,-3    ; Restore old R2
	LDR R3,R5,-4	;Restore old R3

	ADD R6,R5,0	;Move SP
	LDR R5,R6,1	;Restore FP
	LDR R7,R6,2	;Restore RA
	ADD R6,R6,3	;Move SP    	

	
	RET		;Return to the adress in R7
	


pow
    ; TODO: Implement pow() here
;pow(n,k) {
;	if k == 0 {
;		return 1
;	}
;	k_halved = right_shift(k, 1, 1)
;	halfpow = pow(n, k_halved)
;	product = mult(halfpow, halfpow)
;	if (k & 1 != 0) {
;		product = mult(product, n)
;	}
;	return product
;
;}
	ADD R6, R6, -4      ; Make room for RV, RA, and OFP on STACK
    	STR R7, R6, 2       ; Store RA (return address)
   	STR R5, R6, 1       ; Store OFP (old frame pointer)
   	ADD R5, R6, 0	    ; Set new FP
  	ADD R6, R6, -4      ; Room for 4 registers

	STR R3, R5, -4	    ; Store old R3
    	STR R2, R5, -3      ; Store old R2
    	STR R1, R5, -2      ; Store old R1
    	STR R0, R5, -1      ; Store old R0
	
	;Get local variables
	LDR R0,R5,4 	; R0 = n
	LD R2,ONE	; R2 = 1
	LDR R1,R5,5 	; R1 = k
	
	BRnp ENDIF	;if k==0
	AND R0,R0,0	;return 1
	ADD R0,R0,1	
	STR R0,R5,0	;answer=1
	STR R0,R5,3	;rv=1
	BR RET2		;Branch to teardown

ENDIF	ADD R6,R6,-2	;Push 1
	STR R2,R6,0
	STR R2,R6,1	;Push 1 again

	ADD R6,R6,-1	;Push k
	STR R1,R6,0	
	JSR right_shift
	LDR R3,R6,0	;Maybe not right R3 = rv = k_halved
	ADD R6,R6,3	;Pop k and both 1s

	;ADD R6,R6,-1	;Push k_halved
	STR R3,R6,0	

	ADD R6,R6,-1	;Push n
	STR R0,R6,0
	JSR pow
	LDR R3,R6,0	;Maybe not right R3=rv=halfpow
	ADD R6,R6,2	;Pop k_halved and n

	ADD R6,R6,-2 	;Push halfpow twice
	STR R3,R6,0
	STR R3,R6,1
	JSR mult
	LDR R3,R6,0	; R3=product=rv
	ADD R6,R6,2	;Pop both halfpows

	AND R2,R1,1	;k&1
	BRz ENDIF3	;if(k&1 !=0)
	
	ADD R6,R6,-1	;Push n
	STR R0,R6,0

	ADD R6,R6,-1	;Push product
	STR R3,R6,0
	JSR mult
	LDR R3,R6,0	;R3=rv=product
	STR R3,R5,0
	
	ADD R6,R6,2	;Pop product and n


ENDIF3	;LDR R3,R6,0
	STR R3,R5,0
	

RET2   	; Restore registers
    	LDR R0, R5, 0	; rv = answer
	STR R0,R5,3
	LDR R0,R5,-1	; Restore old R0
    	LDR R1,R5,-2    ; Restore old R1
    	LDR R2,R5,-3    ; Restore old R2
	LDR R3,R5,-4	;Restore old R3

	ADD R6,R5,0	;Move SP
	LDR R5,R6,1	;Restore FP
	LDR R7,R6,2	;Restore RA
	ADD R6,R6,3	;Move SP    	

	
	RET		;Return to the adress in R7


;ENDIF2	

; Needed by Simulate Subroutine Call in complx
STACK .fill xF000
NUM   .fill x8000
NUM2  .fill x7FFF
FIF   .fill 15
ONE   .fill 1
.end
