clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for marchMadness

[bracket1] = marchMadness('ppg15.xlsx', 'oppg15.xlsx', 'winPct15.xlsx', 'seed15.xlsx', 'matches.xlsx');
% 	bracket1 => Value too large to display. Value should match that of the solution function.
% 
[bracket2] = marchMadness('ppg16.xlsx', 'oppg16.xlsx', 'winPct16.xlsx', 'seed16.xlsx', 'matches.xlsx');
% 	bracket2 => Value too large to display. Value should match that of the solution function.
% 
[bracket3] = marchMadness('ppg15.xlsx', 'oppg16.xlsx', 'winPct15.xlsx', 'seed16.xlsx', 'matches.xlsx');
% 	bracket3 => Value too large to display. Value should match that of the solution function.
% 
[bracket4] = marchMadness('ppg16.xlsx', 'oppg15.xlsx', 'winPct16.xlsx', 'seed15.xlsx', 'matches.xlsx');
% 	bracket4 => Value too large to display. Value should match that of the solution function.

[bracket1s] = marchMadness_soln('ppg15.xlsx', 'oppg15.xlsx', 'winPct15.xlsx', 'seed15.xlsx', 'matches.xlsx');
[bracket2s] = marchMadness_soln('ppg16.xlsx', 'oppg16.xlsx', 'winPct16.xlsx', 'seed16.xlsx', 'matches.xlsx');
[bracket3s] = marchMadness_soln('ppg15.xlsx', 'oppg16.xlsx', 'winPct15.xlsx', 'seed16.xlsx', 'matches.xlsx');
[bracket4s] = marchMadness_soln('ppg16.xlsx', 'oppg15.xlsx', 'winPct16.xlsx', 'seed15.xlsx', 'matches.xlsx');


t1=isequal(bracket1,bracket1s);
t2=isequal(bracket2,bracket2s);
t3=isequal(bracket3,bracket3s);
t4=isequal(bracket4,bracket4s);



if (isequal(t1,t2,t3,t4)&&t1==1)
    x =1
else
    x=0
end