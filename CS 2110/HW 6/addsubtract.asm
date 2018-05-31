;;===============================
;; Name: Ashley Eggart
;;===============================

.orig x3000

LD R1,LENGTH ; R1=length
AND R2,R2,0 ; R2 = 0 = counter
AND R0,R0,0 ; R0 = 0 = total
LD R3,ARRAY ; R3=address of beginning of array
LOOP LDR R4,R3,0 ; R4=array value
	ADD R2,R2,0 ; R2=R2+0
	BRz L1 ; If length is 0
	NOT R4,R4 ; Negate array value
	ADD R4,R4,1 ; R4=-R4
	ADD R0,R0,R4 ; Total=total-R4
	ADD R2,R2,-1; ; counter--
CONT ADD R3,R3,1 ; R3++
	ADD R1,R1,-1 ; length--
BRp LOOP ; If length is positive loop
ST R0,RESULT ; Stores the sum into result
		
HALT

L1 ADD R0,R0,R4 ; Total=total+R4
ADD R2,R2,1 ; counter++
BRnzp CONT ; Jump to CONT


ARRAY .fill x6000
LENGTH .fill 7
RESULT .fill 0
.end

.orig x6000
.fill 3 ; +
.fill 5 ; -
.fill 1 ; +
.fill 4 ; -
.fill 6 ; +
.fill 8 ; -
.fill 12; +
.end
