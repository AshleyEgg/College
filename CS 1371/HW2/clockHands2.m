function [finalHour, finalMin]=clockHands2(hour,min,time)
%Takes given time and time passed and returns current hour and minutes
min2=time+min;
hPassed=floor(min2./60);
minPassed=min2-(hPassed.*60);


finalMin=minPassed;
finalHour=mod(hPassed+hour,12);
%Below loop deals with time changes of over 12 hours
% while (finalHour<0||finalHour>11)
%     if(finalHour<0)
%         finalHour=finalHour+12;
%     else 
%         finalHour=finalHour-12;
%     end
% end

end