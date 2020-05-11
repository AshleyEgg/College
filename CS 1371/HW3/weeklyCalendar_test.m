clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for weeklyCalendar
[newDays1, newDates1] = weeklyCalendar('M T W R F S N', [3 4 5 6 7 8 9], 3);
% 	newDays1 => R F S N M T W
% 	newDates1 =>      6     7     8     9    10    11    12
% 
[newDays2, newDates2] = weeklyCalendar('N M T W R F S', [26 27 28 29 30 1 2], -5);
% 	newDays2 => T W R F S N M
% 	newDates2 =>     21    22    23    24    25    26    27
% 
[newDays3, newDates3] = weeklyCalendar('T W R F S N M', [11 12 13 14 15 16 17], 365);
% 	newDays3 => W R F S N M T
% 	newDates3 =>     16    17    18    19    20    21    22

[newDays1s, newDates1s] = weeklyCalendar_soln('M T W R F S N', [3 4 5 6 7 8 9], 3);
[newDays2s, newDates2s] = weeklyCalendar_soln('N M T W R F S', [26 27 28 29 30 1 2], -5);
[newDays3s, newDates3s] = weeklyCalendar_soln('T W R F S N M', [11 12 13 14 15 16 17], 365);


t1=isequal(newDays1,newDays1s);
t2=isequal(newDays2,newDays2s);
t3=isequal(newDays3,newDays3s);
t4=isequal(newDates1,newDates1s);
t5=isequal(newDates2,newDates2s);
t6=isequal(newDates3,newDates3s);

if (isequal(t1,t2,t3,t4,t5,t6)&t1==1)
    x =1
else
    x=0
end
