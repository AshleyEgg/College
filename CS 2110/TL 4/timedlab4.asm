;; ====================================================
;; CS 2110 Spring 2018
;; Timed Lab 4 - Traverse Array with Caesarian Shift
;; ====================================================
;; Name: Ashley Eggart
;; ====================================================

.orig x3000

;; Don't try to run this code directly, since only contains subroutines
;; that need to be invoked using the LC-3 calling convention. Use Debug >
;; Setup Test or Simulate Subroutine Call in complx instead
;;
;; Do not remove this line or you will break Simulate Subroutine Call

HALT

;; The pseudocode is posted here for your reference:
;;
;; caesar_encode(str, start, length, shift)
;; {
;;   ch = str[start];
;;
;;   if (start >= length)
;;     return 0;
;;
;;   ch = ch + shift;
;;
;;   if (ch > ’Z’)
;;     ch = ch - ’Z’ + ’A’ - 1;
;;
;;   str[start] = ch;
;;
;;   return caesar_encode(str, start + 1, length, shift) + 1;
;; }

caesar_encode

;; YOUR CODE HERE! :D
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
	LDR R0,R5,4	;R0=str
	LDR R1,R5,5	;R1=start
	LDR R2,R5,6	;R2=length
	LDR R3,R5,7	;R3=shift

	ADD R6,R6,-1	;Push R0
	STR R0,R6,0

	NOT R2,R2
	ADD R2,R2,1	;R2=-length
	ADD R0,R1,R2	;R0=start-length
	NOT R2,R2
	ADD R2,R2,1	;R2=length
	ADD R0,R0,0	;Reset CC
	BRn ENDIF1	;if(start>=length)

	AND R0,R0,0	;R0=0
	STR R0,R5,0	;answer=0
	STR R0,R5,3	;rv=0
	BR RET1		;Branch to teardown

ENDIF1	LDR R0,R6,0	;R0=string address
	ADD R6,R6,1	;Pop address

	ADD R4,R0,R1	;R4=start address
	LDR R4,R4,0	;first char ascii value in R4?

	ADD R4,R4,R3	;ch=ch+shift

	ADD R6,R6,-1	;Push R0
	STR R0,R6,0
	ADD R6,R6,-1	;Push R1
	STR R1,R6,0
	
	LD R0,CHAR_Z	;R0='Z'

	NOT R0,R0
	ADD R0,R0,1	;R0=-Z
	ADD R1,R4,R0	;R1=ch-Z
	BRnz ENDIF2	;if(ch>Z)
	
	ADD R4,R4,R0;	;ch=ch-Z
	LD R1,CHAR_A	;R1='A'
	ADD R4,R4,R1	;ch=ch+A
	ADD R4,R4,-1	;ch=ch-1

ENDIF2	LDR R1,R6,0	;R1=start
	ADD R6,R6,1	;Pop R1
	LDR R0,R6,0	;R0=string address
	ADD R6,R6,1	;Pop address

	ADD R6,R6,-1	;Push R2
	STR R2,R6,0

	ADD R2,R0,R1	;R2=str+start
	STR R4,R2,0	;str(start)=ch

	LDR R2,R6,0	;R2=start
	ADD R6,R6,1	;Pop R2	

	ADD R6,R6,-1	;Push shift
	STR R3,R6,0
	ADD R6,R6,-1	;Push length
	STR R2,R6,0	
	ADD R6,R6,-1	;Push start+1
	ADD R1,R1,1
	STR R1,R6,0
	ADD R6,R6,-1	;Push str
	STR R0,R6,0

	JSR caesar_encode

	LDR R0,R6,0
	ADD R0,R0,1
	STR R0,R5,0	;answer
	STR R0,R5,3	;rv
	


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

STACK  .fill xF000
STRING .blkw 1

CHAR_A .fill 'A'
CHAR_Z .fill 'Z'

.end

;; ====================================================
;; The string to be encoded. USED ONLY FOR DEBUGGING.
;; ====================================================

.orig x6000
.stringz "ASSEMBLY"
.end
