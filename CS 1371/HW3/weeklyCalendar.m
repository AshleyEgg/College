function [fWeek, fDays]=weeklyCalendar(week,days,time)
%Given the current dates and days of the week and a time passed it returns
%the new week and and dates
fDays=mod(days+time,30);%Calculates the new dates
daysP=mod(time,7);%Figures out how many days of the new week have passed
while daysP>0%Preforms a circle shift 
   [day,rem]=strtok(week);
   week=[rem ' ' day];%Adds an extra space 
   daysP=daysP-1;
end
week(1)=[];%Removes the extra space previously added
fWeek=week;
end