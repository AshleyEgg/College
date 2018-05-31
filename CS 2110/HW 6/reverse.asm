;;===============================
;; Name: Ashley Eggart
;;===============================

.orig x3000
LD R0,LENGTH ; R0=length
ADD R0,R0,-1 ; Determines if length is 1
BRz END ; Branches to the end if length is 1
ADD R0,R0,-1 ; Gets rid of newline char

LD R1,STRING ; R1=1st letter address
AND R2,R2,0 ; R2=0
ADD R2,R1,R0 ; R2=R1+length

LOOP LDR R3,R1,0 ; R3=first letter
	LDR R4,R2,0 ; R4=last letter

STR R3,R2,0 ; Stores the first letter in the last letter address
STR R4,R1,0 ; Stores the last letter in the first letter address

ADD R1,R1,1 ; Increments the first letter address
ADD R2,R2,-1 ; Decrements the last letter address

NOT R6,R2 ; R6=~R2
ADD R6,R6,1 ; R6=-R2
ADD R5,R1,R6 ; R5=first address-last address
BRn LOOP

END HALT

STRING .fill x6000
LENGTH .fill 21

.end

.orig x6000
.stringz "To Hell With Georgia\n"
.end
