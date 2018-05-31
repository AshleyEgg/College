;;===============================
;; Name: Ashley Eggart
;;===============================
.orig x3000
AND R1,R1,0 ; R1 = 0 = counter
LD R2,TRIANGLE ; R2=triangle
AND R4,R4,0 ; R4 = 0 = forspaces
LD R3,TRIANGLE ; R3 = decimal = triangle


BRz END ; Branches to the end if decimal is 0 (if statement)
W1 ADD R3,R3,0 ; R3=R3
	BRnz END ; If decimal is not positive end the while loop
	AND R1,R1,0 ; counter=0
	W2 NOT R5,R1 ; R5=~R1
		ADD R5,R5,1 ; R5=-R1
		ADD R6,R4,R5 ; Compares counter and forspaces
		BRnz ENDW2 ; If not positive exit while loop 2
		LD R0,SPACE ; R0=space
		OUT ; Prints a space
		ADD R1,R1,1 ; counter++
	BRnzp W2
	ENDW2 AND R1,R1,0 ; counter=0
	W3 NOT R5,R1 ; R5=~R1
		ADD R5,R5,1 ; R5=-R1
		ADD R6,R3,R5 ; Compares counter and decimal
		BRnz ENDW3 ; If not positive exit while loop 3
		ADD R0,R3,0 ; R0=decimal
		LD R7,OFFSET ; R7=ASCII offset
		ADD R0,R0,R7 ; Decimal+ASCII offset
		OUT ; Prints the decimal value
		ADD R1,R1,1 ; counter++
	BRnzp W3
	ENDW3 ADD R3,R3,-2 ; decimal=decimal-2
	ADD R4,R4,1 ; forspaces++
	LD R0,NEW ; R0=newline
	OUT ; Prints the newline 
BRnzp W1 ; Branch back to beginning of while loop



END HALT
TRIANGLE	.fill 9
SPACE		.fill 32
NEW		.fill 10
OFFSET		.fill 48
.end

