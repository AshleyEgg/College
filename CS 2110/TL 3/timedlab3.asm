;; Spring 2018 - Timed Lab 3
;; ======================================
;;  Name: Ashley Eggart
;; ======================================

.orig x3000

;; YOUR CODE GOES HERE
AND R0,R0,0	;Clear R0=count
AND R1,R1,0	;Clear R1=i
LD R2,LENGTH	;R2=length
LD R4,ARRAY	;R4=x6000 aka array address
LD R3,UPPER	;R3=upper
LD R6,LOWER	;R6=lower

NOT R3,R3	;~R3
ADD R3,R3,1	;R3=-upper

NOT R6,R6	;~R6
ADD R6,R6,1	;R6=-lower

NOT R2,R2	;~R2
ADD R2,R2,1	;R2=-length
ADD R2,R1,R2	;R2=i-length
BRzp FOREND
	
FOR	LDR R5,R4,0	;R5=elem

	;elem-lower>=0
	ADD R1,R5,R6	;R1=elem-lower
	BRn IFEND
	;elem-upper<=0
	ADD R1,R5,R3	;R1=elem-upper
	BRp IFEND
	ADD R0,R0,1	;count++

IFEND	ADD R4,R4,1	;Increment address
	ADD R2,R2,1	;i-length+1	
	BRn FOR


FOREND ST R0,RESULT	;result=count

HALT

ARRAY .fill x6000
LENGTH .fill 7
LOWER .fill 1
UPPER .fill 50
RESULT .fill 0

.end

.orig x6000
.fill 10
.fill 7
.fill 67
.fill 90
.fill 3
.fill 2
.fill 45
.end
