function [finalHour, finalMin]=clockHands(hour,min,time)
%Takes given time and time passed and returns current hour and minutes
min2=time+min
hPassed=floor(min2./60)
minPassed=min2-(hPassed.*60)

finalMin=minPassed
finalHour=mod(hPassed+hour,12)
end