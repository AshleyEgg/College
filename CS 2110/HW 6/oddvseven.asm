;;===============================
;; Name: Ashley Eggart
;;===============================
.orig x3000
LD R1,LENGTH ; R1=length of array
BRz END ; branch to end if length is 0
LD R2, ARRAY ; R2=memory address for start of the array
LOOP LDR R3,R2,0  ; R3=array element
	BRz L2 ; If array element is 0 go to L2
	AND R4,R3,1 ; Determine if the element is odd or even
	BRz L1 ; If even go to L1
	LEA R0,ODD ; If odd load odd into R0
	PUTS ; Prints ODD
CONT ADD R2,R2,1 ; Increment the adress by 1
	ADD R1,R1,-1 ; Decrement length by 1
BRp LOOP ; Branch to top of loop
END HALT

L1 LEA R0,EVEN ; If even load even into R0
PUTS ; Prints EVEN
BRnzp CONT ; Jumps back to CONT

L2 LEA R0,ZE ; If zero load zero into R0
PUTS ; Prints ZERO
BRnzp CONT ; Jumps back to CONT



HALT
LENGTH .fill 5
ARRAY .fill x6000
ODD .stringz "ODD\n"
EVEN .stringz "EVEN\n"
ZE .stringz "ZERO\n"

.end

.orig x6000
.fill 0
.fill 9
.fill 10
.fill 0
.fill 14
.end
